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
import model.User;

public class FollowDAO extends DBContext {

    public List<User> getFollowersByUserId(int userID) {
        List<User> list = new ArrayList<>();
        String sql = "Select u.*\n"
                + "from [User] u, Follow f\n"
                + "where u.userID = f.userID\n"
                + "And f.followID = " + userID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("password"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("gender"), rs.getString("email"), rs.getString("address"), rs.getString("describe"), rs.getString("dob"), rs.getString("phone"), rs.getInt("role"), rs.getString("avatar"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getFollowingByUserId(int userID) {
        List<User> list = new ArrayList<>();
        String sql = "Select u.*\n"
                + "from [User] u, Follow f\n"
                + "where u.userID = f.followID\n"
                + "And f.userID = " + userID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("password"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("gender"), rs.getString("email"), rs.getString("address"), rs.getString("describe"), rs.getString("dob"), rs.getString("phone"), rs.getInt("role"), rs.getString("avatar"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertFollow(int userID, int followID) {
        String sql = "INSERT INTO [dbo].[Follow]\n"
                + "           ([userID]\n"
                + "           ,[followID])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, followID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteFollw(int userID, int followID) {
        String sql = "DELETE FROM [dbo].[Follow]\n"
                + "      WHERE userID =?\n"
                + "	  AND followID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, followID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public boolean checkFollow(int userID, int followID)
    {
        String sql="Select userID, followID from Follow where userID = ? And followID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, followID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
            return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    
     public void insertShop(String shopname,int userID ,double rate)
     {
         UserDAO ud = new UserDAO();
         String sql="INSERT INTO [dbo].[Shop]\n" +
"           ([name]\n" +
"           ,[userID]\n" +
"           ,[rate])\n" +
"     VALUES\n" +
"           (?,?,?)";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
             st.setString(1, shopname);
             st.setInt(2, userID);
             st.setDouble(3, rate);
             st.executeUpdate();   
         } catch (Exception e) {
         }
     }
             
    public static void main(String[] args) {
//        System.out.println("Follower");

        FollowDAO fd = new FollowDAO();
//        List<User> u = fd.getFollowersByUserId(7);
//        System.out.println(u.size());
//        for (User k : u) {
//            System.out.println(k.getUsername());
//        }
//        System.out.println("Following");
//        u = fd.getFollowingByUserId(5);
//        System.out.println(u.size());
//        for (User k : u) {
//            System.out.println(k.getUsername());
//        }
       if(fd.checkFollow(1, 22))
       {
           System.out.println("unfollow");
       }
       else
       {
           System.out.println("follow");
       }
        
    }
}
