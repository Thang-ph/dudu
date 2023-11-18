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
import model.Category;
import model.Product;
import model.Shop;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {

        List<Category> list = new ArrayList<>();
        String sql
                = "SELECT [CategoryID]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category s = new Category();
                s.setCategoryID(rs.getInt("CategoryID"));
                s.setName(rs.getString("name"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Category getCategoryByID(int CategoryID) {
        Category s = new Category();
        String sql
                = "SELECT [CategoryID]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Category]"
                + "Where  CategoryID =" + CategoryID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                s.setCategoryID(rs.getInt("CategoryID"));
                s.setName(rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return s;
    }

    public void addCategory(Category Category) {
        String sql
                = "INSERT INTO [dbo].[Category]\n"
                + "           ([CategoryID]\n"
                + "           ,[name])\n"
                + "     VALUES\n"
                + "           (" + Category.getCategoryID() + "\n"
                + "           ," + Category.getName() + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateCategory(Category Category) {
        String sql
                = "UPDATE [dbo].[Category]\n"
                + "   SET [CategoryID] = " + Category.getCategoryID() + "\n"
                + "      ,[name] = '" + Category.getName() + "'\n"
                + " WHERE CategoryID = " + Category.getCategoryID() + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void DeleteCategoryID(int id) {
        String sql
                = "DELETE FROM [dbo].[Category]\n"
                + "      WHERE CategoryID = " + id + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public int countCategory(int categoryID) {
        int count=0;
        String sql= "select count(categoryID) as a from Product where categoryID=? group by categoryID ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
          if(rs.next()){
              count=rs.getInt("a");
          }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return count;
    }

    public int countCategoryShopHome(int categoryID, List<Product> ph) {
        List<Product> list = new ArrayList<>();
        ProductDAO pd = new ProductDAO();
        String sql= "select * from Product where categoryID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
          while (rs.next()) {
                Shop s = pd.getShopByShopID(rs.getInt("shopID"));
                Category c = pd.getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                for (Product product : ph) {
                    if(p.getProductID()==product.getProductID()){
                        list.add(p);
                    }
                }
                
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list.size();
    }
    
    public static void main(String[] args) {
        CategoryDAO cd=new CategoryDAO();
        System.out.println(cd.countCategory(0));
    }
}
