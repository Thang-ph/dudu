/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Shop;

/**
 *
 * @author ADMIN
 */
public class ShopDAO extends DBContext {

    public List<Shop> getAllShop() {
        UserDAO cdb = new UserDAO();
        List<Shop> list = new ArrayList<>();
        String sql
                = "SELECT [ShopID]\n"
                + "      ,[name]\n"
                + "      ,[userID]\n"
                + "      ,[rate]\n"
                + "  FROM [dbo].[Shop]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = new Shop();
                s.setShopID(rs.getInt("ShopID"));
                s.setName(rs.getString("name"));
                s.setUser(cdb.getUserbyID(rs.getInt("userID")));
                s.setRate(rs.getInt("rate"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Shop getShopByID(int ShopID) {
        UserDAO cdb = new UserDAO();
        Shop s = new Shop();
        String sql
                = "SELECT [ShopID]\n"
                + "      ,[name]\n"
                + "      ,[userID]\n"
                + "      ,[rate]\n"
                + "  FROM [dbo].[Shop]"
                + " WHERE ShopID = " + ShopID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                s.setShopID(rs.getInt("ShopID"));
                s.setName(rs.getString("name"));
                s.setUser(cdb.getUserbyID(rs.getInt("userID")));
                s.setRate(rs.getInt("rate"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return s;
    }


    public void AddShop(Shop Shop) {
        String sql
                = "INSERT INTO [dbo].[Shop]\n"
                + "           ([name]\n"
                + "           ,[userID]\n"
                + "           ,[rate])\n"
                + "     VALUES('" + Shop.getName() + "'\n"
                + "           ," + Shop.getUser().getUserID() + "\n"
                + "           ," + Shop.getRate() + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void UpdateShop(Shop Shop) {
        String sql
                = "UPDATE [dbo].[Shop]\n"
                + "   SET [name] = '" + Shop.getName() + "'\n"
                + "      ,[userID] = " + Shop.getUser().getUserID() + "\n"
                + "      ,[rate] = " + Shop.getRate() + "\n"
                + " WHERE ShopID = " + Shop.getShopID() + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateStoreHouse(Shop Shop) {
        String sql
                = "UPDATE [dbo].[Shop]\n"
                + "   SET [ShopID] = " + Shop.getShopID() + "\n"
                + "      ,[name] = '" + Shop.getName() + "'\n"
                + "      ,[userID] = " + Shop.getUser().getUserID() + "\n"
                + "      ,[rate] = " + Shop.getRate() + "\n"
                + " WHERE ShopID = " + Shop.getShopID() + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void DeleteShopByID(int id) {
        String sql
                = "DELETE FROM [dbo].[Shop]\n"
                + "      WHERE ShopID = "+ id +" ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Shop> getShopByAccountID(int accountID) {
        String sql
                = "select * from Shop s, [User] u where s.userID=u.userID and u.userID=?";
        List<Shop> list=new ArrayList<>();
        UserDAO ud=new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s=new Shop();
                s.setShopID(rs.getInt("ShopID"));
                s.setName(rs.getString("name"));
                s.setUser(ud.getUserbyID(rs.getInt("userID")));
                s.setRate(rs.getInt("rate"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
        public static void main(String[] args) {
            ShopDAO sd=new ShopDAO();
        System.out.println(sd.getShopByAccountID(1).get(0).getName());
    }

}
