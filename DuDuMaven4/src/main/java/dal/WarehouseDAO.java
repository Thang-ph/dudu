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
import model.Warehouse;

/**
 *
 * @author Pham Thang
 */
public class WarehouseDAO extends DBContext {

    public int getQuantityByIDTypeSize(int productID, String type, String size) {
        String sql = "select * from Warehouse where productID=? and type=? and size=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setNString(2, type);
            st.setNString(3, size);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getQuantityByIDTypeSizeInCart(int productID, String type, String size) {
        String sql = "select * from Warehouse where productID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            if (type != null && !type.isEmpty()) {
                sql += " and type=" + type;
            }
            if (size != null && !size.isEmpty()) {
                sql += " and size=" + size;
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getQuantityByID(int productID) {
        String sql = "select sum(quantity) as [totalQuantity] from Warehouse where productID=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("totalQuantity");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public ArrayList<String> getTypeByID(int productID) {

        ArrayList<String> list = new ArrayList<>();

        String sql = "select distinct type from Warehouse where productID=?";

        try {

            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, productID);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                String type = rs.getString("type");

                if (type != null) {
                    list.add(type);
                }

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public ArrayList<String> getSizeByID(int productID) {

        ArrayList<String> list = new ArrayList<>();

        String sql = "select distinct size from Warehouse where productID=?";

        try {

            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, productID);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                String size = rs.getString("size");

                if (size != null) {
                    list.add(size);
                }

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

//    public boolean check(int id, String type, String size) {
//        String sql = "select *\n"
//                + "from Warehouse w\n"
//                + "where productID=?\n"
//                + "AND w.type = ?\n"
//                + "AND w.size = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id);
//            st.setNString(2, type);
//            st.setNString(3, size);
//            ResultSet rs = st.executeQuery();
//            if(rs.next())
//            {
//                return true;
//            }
//        } catch (Exception e) {
//        }
//        return false;
//    }
    public int getQuantityByIDType(int productID, String type) {
        String sql = "select sum(quantity) as[quantity] from Warehouse where productID=? and type=? group by productID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setNString(2, type);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getQuantityByIDSize(int productID, String size) {
        String sql = "select sum(quantity) as[quantity] from Warehouse where productID=? and size=? group by productID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.setNString(2, size);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Warehouse> getListOfWareHouseByProductId(int id) {
        List<Warehouse> list = new ArrayList<>();
        String sql = "select warehouseID, [type], size , quantity\n"
                + "from Warehouse\n"
                + "where productID = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Warehouse w = new Warehouse(rs.getInt("warehouseID"), rs.getString("type"), rs.getString("size"), rs.getInt("quantity"));
                if (w.getSize() == null) {
                    w.setSize("None");
                }
                if (w.getType() == null) {
                    w.setType("None");
                }
                list.add(w);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void insert(Warehouse w) {
        String sql = "INSERT INTO [dbo].[Warehouse]\n"
                + "           ([productID]\n"
                + "           ,[type]\n"
                + "           ,[size]\n"
                + "           ,[quantity])\n"
                + "VALUES (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, w.getProduct().getProductID());
            st.setString(2, w.getType());
            st.setString(3, w.getSize());
            st.setInt(4, w.getQuantity());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void update(Warehouse w) {
        String sql = "UPDATE [dbo].[Warehouse]\n"
                + "   SET [productID] = ?\n"
                + "      ,[type] = ?\n"
                + "      ,[size] = ?\n"
                + "      ,[quantity] = ?\n"
                + " WHERE warehouseID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, w.getProduct().getProductID());
            st.setString(2, w.getType());
            st.setString(3, w.getSize());
            st.setInt(4, w.getQuantity());
            st.setInt(5, w.getWarehouseID());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

//    public int getWarehouseIDbyProductIDTypeSize(int productID, String type, String size) {
//        String sql = "select w.quantity\n"
//                + "from Warehouse w\n"
//                + "where productID=?\n"
//                + "AND w.type = ?\n"
//                + "AND w.size = ?";
//        try {
//             PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, productID);
//            st.setNString(2, type);
//            st.setNString(3, size);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                return rs.getInt("warehouseID");
//            }
//        } catch (Exception e) {
//        }
//        return 0;
//    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Warehouse]\n"
                + "      WHERE warehouseID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

   public int check(String type, String size, int id) {
    String sql = "SELECT warehouseID\n"
            + "FROM Warehouse\n"
            + "WHERE [type] = ?\n"
            + "AND size = ?\n"
            + "AND productID = ?";

    ProductDAO pd = new ProductDAO();

    try (PreparedStatement st = connection.prepareStatement(sql)) {
        // Set parameters using prepared statement to avoid SQL injection
        st.setString(1, type);
        st.setString(2, size);
        st.setInt(3, id);

        try (ResultSet rs = st.executeQuery()) {
            // If there is at least one result, return the warehouseID
            if (rs.next()) {
                return rs.getInt("warehouseID");
            } else {
                // Handle the case where no result is found
                // You might want to throw an exception or return a sentinel value
                throw new RuntimeException("No warehouse found for the given criteria.");
            }
        }
    } catch (Exception e) {

    }
    return 0;
}

    public static void main(String[] args) {
        WarehouseDAO wd = new WarehouseDAO();
        List<Warehouse> list = wd.getListOfWareHouseByProductId(1);
        System.out.println("Hello");
    }
}
