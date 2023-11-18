/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Category;
import model.Item;
import model.Order;
import model.Order_List;
import model.Product;
import model.User;

/**
 *
 * @author Pham Thang
 */
public class OrderDAO extends DBContext {

    public void createOrder(User a, String address, String note, List<Item> selectedItem, String ship, double total, String phone,double discount) {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String date = now.format(formatter);
        try {
            String sql = "insert into [Order] (userID,total,date,address,note,ship,discount) values(?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getUserID());
            st.setDouble(2, total);
            st.setString(3, date);
            st.setNString(4, address);
            st.setNString(5, note);
            st.setNString(6, ship);
            st.setDouble(7, discount);
            st.executeUpdate();
            String sql1 = "select top 1 orderID from [Order] order by orderID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int orderID = rs.getInt("orderID");
                for (Item i : selectedItem) {
                    String sql2 = "insert into Order_List (productID,quantity,type,size,orderID,status) values(?,?,?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, i.getProduct().getProductID());
                    st2.setInt(2, i.getQuantity());
                    st2.setNString(3, i.getType());
                    st2.setNString(4, i.getSize());
                    st2.setInt(5, orderID);
                     st2.setString(6, "Pending");
                    st2.executeUpdate();
                }
            }
            // cap nhat lai so luong san pham trong kho
            for (Item item : selectedItem) {
                String sql3 = "update Warehouse set quantity=quantity - ? where productID = ? ";

                if (!item.getType().equals("")) {
                    sql3 += " and type='"+item.getType()+"'";
                }
                if (!item.getSize().equals("")) {
                    sql3 += " and size= '" + item.getSize()+"'";
                }
                PreparedStatement st3 = connection.prepareStatement(sql3);

                st3.setInt(1, item.getQuantity());
                st3.setInt(2, item.getProduct().getProductID());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    

    public Order getOrderByOrderID(int orderID) {
         String sql = "select * from [Order] where orderID =?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                UserDAO ud=new UserDAO();
                Order o=new Order(orderID, ud.getUserbyID(rs.getInt("userID")), rs.getDouble("total"), rs.getString("address"), rs.getString("note"), rs.getString("date"), rs.getString("ship"),rs.getDouble("discount"));
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public Order_List getOrderListByOrderListID(int listID) {
         String sql = "select * from [Order_List] where listID =?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, listID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                UserDAO ud=new UserDAO();
                ProductDAO pd=new ProductDAO();
                Product p=pd.getProductByProductID(rs.getInt("productID"));
                Order o=getOrderByOrderID(rs.getInt("orderID"));
                Order_List l=new Order_List(listID, p, rs.getNString("type"), rs.getNString("size"), rs.getInt("quantity"), o, rs.getNString("status"));
                return l;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Order_List> getDetailOrderByDetaiOrderID(int orderID) {
        String sql = "select * from Order_List where orderID =?";
        List<Order_List> list=new ArrayList<>();
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
           while (rs.next()) {
               ProductDAO pd=new ProductDAO();
                Order_List od=new Order_List(rs.getInt("listID"), pd.getProductByProductID(rs.getInt("productID")), rs.getString("type"), rs.getString("size"), rs.getInt("quantity"), getOrderByOrderID(rs.getInt("orderID")),rs.getString("status"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Order getLastOrder() {
         String sql = "select top 1 orderID from [Order] order by orderID desc";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order o=getOrderByOrderID(rs.getInt("orderID"));
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
        System.out.println(od.getItemByUserIDStatus(1, "Pending").get(0).getProduct().getName());
    }
    public List<Order> getOrderByUserID(int userID) {
          String sql = "select * from [Order] where userID=?";
          List<Order> list=new ArrayList<>();
        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order o=getOrderByOrderID(rs.getInt("orderID"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order_List> getItemByUserIDStatus(int userID,String status) {
         String sql = "select * from [Order] o,Order_List l where o.userID=? and l.status=? and o.orderID=l.orderID";
          List<Order_List> list=new ArrayList<>();
        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setNString(2, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order_List l=getOrderListByOrderListID(rs.getInt("listID"));
                list.add(l);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order_List> getOrderListByShopID(int shopID) {
         String sql = "select * from Order_List ol, Product p,Shop s where ol.productID=p.productID and p.shopID=s.shopID and s.shopID=?";
        List<Order_List> list=new ArrayList<>();
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, shopID);
            ResultSet rs = st.executeQuery();
           while (rs.next()) {
               ProductDAO pd=new ProductDAO();
                Order_List od=new Order_List(rs.getInt("listID"), pd.getProductByProductID(rs.getInt("productID")), rs.getString("type"), rs.getString("size"), rs.getInt("quantity"), getOrderByOrderID(rs.getInt("orderID")),rs.getString("status"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order_List> getItemByStatus(List<Order_List> ol, String status) {
        List<Order_List> list=new ArrayList<>();
        for(int i=0;i<ol.size();i++){
            if(ol.get(i).getStatus().equals(status)){
                list.add(ol.get(i));
            }
        }
        return list;
    }

    public void comeTo(int listID, String status) {
         String sql = "UPDATE Order_List SET status=? WHERE listID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, listID);
            st.executeUpdate();
          
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void complete(int listID) {
         String sql = "delete from Order_List where listID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, listID);
            st.executeUpdate();
          
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
