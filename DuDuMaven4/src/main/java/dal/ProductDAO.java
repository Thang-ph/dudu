/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Image;
import model.Product;
import model.Shop;
import model.User;

/**
 *
 * @author Pham Thang
 */
public class ProductDAO extends DBContext {

    public Category getCategoryByCategoryID(int categoryID) {
        String sql = "select * from Category where categoryID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(categoryID, rs.getNString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Shop getShopByShopID(int shopID) {
        UserDAO ud = new UserDAO();
        String sql = "select * from Shop where shopID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, shopID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = ud.getUserbyID(rs.getInt("userID"));
                Shop s = new Shop(shopID, rs.getNString("name"), u, rs.getDouble("rate"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductByProductID(int productID) {
        String sql = "select * from Product where productID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(productID, c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllProduct() {
        String sql = "select * from Product ";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCategoryID(int categoryID) {
        String sql = "select * from Product where categoryID = ?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> sort(int option, int categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product ";
        if (categoryID != 0) {
            sql += "where categoryID= " + categoryID;
        }
        if (option != 0) {
            if (option == 1) {
                sql += " order by rate desc";
            }
            if (option == 2) {
                sql += " order by rate ";
            }
            if (option == 3) {
                sql += " order by price desc";
            }
            if (option == 4) {
                sql += " order by price ";
            }

        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> filter(int option, int from, int to, double minRate, double maxRate, int categoryID, String search) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where rate >= " + minRate + " and rate <= " + maxRate;
        if (search != null) {
            sql += " and name like N'%" + search + "%'";
        }
        if (to != 0) {
            sql += " and price <=" + to;
        }
        if (from != 0) {
            sql += " and price>=" + from;
        }
        if (categoryID != 0) {
            sql += " and categoryID= " + categoryID;
        }
        if (option != 0) {
            if (option == 1) {
                sql += " order by rate desc";
            }
            if (option == 2) {
                sql += " order by rate";
            }
            if (option == 3) {
                sql += " order by price desc ";
            }
            if (option == 4) {
                sql += " order by price";
            }

        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> search(String search) {
        String sql = "select * from Product p,Shop s where p.shopID=s.shopID and (p.name like N'%" + search + "%'  or s.name like N'%" + search + "%')";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductByShopID(int id) {
        String sql = "select * from Product "
                + "where shopID = " + id + "";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductByUserID(int id) {
        String sql = "select * from Product p,Shop s where p.shopID = s.shopID and s.userID =  " + id + "";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int AddNewProduct(Product p) {
        int generatedId = 0;
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([categoryID]\n"
                + "           ,[image]\n"
                + "           ,[detail]\n"
                + "           ,[rate]\n"
                + "           ,[shopID]\n"
                + "           ,[price]\n"
                + "           ,[name])\n"
                + "     VALUES\n"
                + "           (" + p.getCategory().getCategoryID() + "\n"
                + "           ,'" + p.getImage() + "'\n"
                + "           ,'" + p.getDetail() + "'\n"
                + "           ," + p.getRate() + "\n"
                + "           ," + p.getShop().getShopID() + "\n"
                + "           ," + p.getPrice() + "\n"
                + "           ,'" + p.getName() + "')";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = st.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedId = generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return generatedId;
    }

    public void DeleteProductByID(int id) {
        String sql
                = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE productID = " + id + " ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateProduct(Product p) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [categoryID] = " + p.getCategory().getCategoryID() + "\n"
                + "      ,[image] = '" + p.getImage() + "'\n"
                + "      ,[detail] = '" + p.getDetail() + "'\n"
                + "      ,[rate] = " + p.getRate() + "\n"
                + "      ,[shopID] = " + p.getShop().getShopID() + "\n"
                + "      ,[price] = " + p.getPrice() + "\n"
                + "      ,[name] = '" + p.getName() + "'\n"
                + " WHERE productID = " + p.getProductID() + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> searchProductInShop(String search, int shopID) {
        String sql = "select * from Product p where p.name like N'%" + search + "%' and p.shopID like " + shopID + "";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getRelatedProduct(int shopID, int productID) {
        String sql = "select * from Product p,Shop s where p.shopID=s.shopID and s.shopID=? and p.productID<>?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, shopID);
            st.setInt(2, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
        System.out.println(pd.filter(0, 0, 10000000, 0, 3.6, 0, "a").size());
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Image> getImageByProductID(int productID) {
        List<Image> list = new ArrayList<>();
        String sql = "select * from Image where productID=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Product p = getProductByProductID(productID);
                Image i = new Image(rs.getInt("imageID"), rs.getNString("image"), p);
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void AddImage(Image i) {
        String sql = "INSERT INTO [dbo].[Image]\n"
                + "           ([image]\n"
                + "           ,[productID])\n"
                + "     VALUES\n"
                + "           ('" + i.getImage() + "'\n"
                + "           ," + i.getProduct().getProductID() + ")";
        try {
            if(i.getImage().endsWith(".png") || i.getImage().endsWith(".jpg")){
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeQuery();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateImage(Image i) {
        String sql = "UPDATE [dbo].[Image]\n"
                + "   SET [image] = '" + i.getImage() + "'\n"
                + "      ,[productID] = " + i.getProduct().getProductID() + "\n"
                + " WHERE imageID = " + i.getImageID();
        try {
            if(i.getImage().endsWith(".png") || i.getImage().endsWith(".jpg")){
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeQuery();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void DeleteImageByImageID(int i) {
        String sql = "DELETE FROM [dbo].[Image]\n"
                + "      WHERE imageID =" + i;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void DeleteImageByProductID(int i) {
        String sql = "DELETE FROM [dbo].[Image]\n"
                + "      WHERE productID =" + i;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Image GetImageByImageID(int imageID) {
        Image i = new Image();
        String sql = "select * from Image where imageID=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, imageID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Product p = getProductByProductID(imageID);
                i = new Image(rs.getInt("imageID"), rs.getNString("image"), p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return i;
    }

    public List<Product> filterShopHome(int option, int from, int to, double minRate, double maxRate, int categoryID, String search, List<Product> ph) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where rate >= " + minRate + " and rate <= " + maxRate;
        if (search != null) {
            sql += " and name like N'%" + search + "%'";
        }
        if (to != 0) {
            sql += " and price <=" + to;
        }
        if (from != 0) {
            sql += " and price>=" + from;
        }
        if (categoryID != 0) {
            sql += " and categoryID= " + categoryID;
        }
        if (option != 0) {
            if (option == 1) {
                sql += " order by price";
            }
            if (option == 2) {
                sql += " order by price DESC";
            }
            if (option == 3) {
                sql += " order by rate";
            }
            if (option == 4) {
                sql += " order by rate DESC";
            }

        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
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
        return list;
    }

    public void DeleteProductByShopID(int id) {
        String sql
                = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE shopID = " + id + " ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<Product> getRecentProduct() {
        String sql = "SELECT TOP 8 [productID]\n"
                + "      ,[categoryID]\n"
                + "      ,[image]\n"
                + "      ,[detail]\n"
                + "      ,[shopID]\n"
                + "      ,[price]\n"
                + "      ,[name]\n"
                + "      ,[rate]\n"
                + "FROM [DuDu].[dbo].[Product]\n"
                + "ORDER BY [productID] DESC;";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shop s = getShopByShopID(rs.getInt("shopID"));
                Category c = getCategoryByCategoryID(rs.getInt("categoryID"));
                Product p = new Product(rs.getInt("productID"), c, s, rs.getNString("image"), rs.getNString("detail"), rs.getDouble("rate"), rs.getNString("name"), rs.getDouble("price"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
