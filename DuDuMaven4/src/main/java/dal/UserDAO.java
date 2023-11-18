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
import util.EncodePasswork;

/**
 *
 * @author PC
 */
public class UserDAO extends DBContext {

    public User getUserbyID(int userID) {
        String sql = "select * from [User] where userID=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("password"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("gender"), rs.getString("email"), rs.getString("address"), rs.getString("describe"), rs.getString("dob"), rs.getString("phone"), rs.getInt("role"), rs.getString("avatar"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updatePass(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + " WHERE userID = ?";
        EncodePasswork SHA1 = new EncodePasswork();
        String newPass = SHA1.toSHA1(u.getPassword());
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getPassword());
            st.setInt(2, u.getUserID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateUser(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [username] =?\n"
                + "      ,[password] = ?\n"
                + "      ,[firstname] = ?\n"
                + "      ,[lastname] = ?\n"
                + "      ,[dob] = ?\n"
                //                + "      ,[age] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[role] = ?\n"
                + "      ,[avatar] = ?\n"
                //                + "      ,[shopID] = ?\n"
                + "      ,[describe] = ?\n"
                + " WHERE userID = ?";
        EncodePasswork SHA1 = new EncodePasswork();
        String newPass = SHA1.toSHA1(u.getPassword());
        try {
            UserDAO ud = new UserDAO();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, newPass);
            st.setString(3, u.getFirstname());
            st.setString(4, u.getLastname());
            st.setString(5, u.getDob());
            st.setString(6, u.getGender());
            st.setString(7, u.getAddress());
            st.setString(8, u.getEmail());
            st.setString(9, u.getPhone());
            st.setInt(10, u.getRole());
            st.setString(11, u.getAvatar());
            st.setString(12, u.getDescribe());
            st.setInt(13, u.getUserID());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    
    
    public void updateUser1(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [username] =?\n"
                + "      ,[firstname] = ?\n"
                + "      ,[lastname] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[role] = ?\n"
                + "      ,[avatar] = ?\n"
                + "      ,[describe] = ?\n"
                + " WHERE userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getFirstname());
            st.setString(3, u.getLastname());
            st.setString(4, u.getDob());
            st.setString(5, u.getGender());
            st.setString(6, u.getAddress());
            st.setString(7, u.getEmail());
            st.setString(8, u.getPhone());
            st.setInt(9, u.getRole());
            st.setString(10, u.getAvatar());
            st.setString(11, u.getDescribe());
            st.setInt(12, u.getUserID());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    public void updateAvatar(User u) {
        String sql = "  UPDATE [User]\n"
                + "SET avatar = ?\n"
                + "where userID = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getAvatar());
            st.setInt(2, u.getUserID());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        int userid = 15;
        UserDAO ud = new UserDAO();
        int k = 15;
        User u = ud.getUserbyID(k);
//        int userid = 15;
//        UserDAO ud = new UserDAO();
//        int k = 15;
//        User u = ud.getUserbyID(k);
        User uNew = new User(k, "username", u.getPassword(), "firstname", "lastname", u.getGender(), "email", "address", "describe", "2003-03-30", "000000000", u.getRole(), u.getAvatar());
//        ud.updateUser(uNew);
//        System.out.println(uNew.getPhone());
        ud.updateUser(uNew);
        System.out.println(uNew.getPhone());
        User d = new User();
        for (int i = 0; i < 30; i++) {
            System.out.println(uNew.getAddress());
        }
    }

    public int getUserAgebyID(int id) {
        String sql = "SELECT\n"
                + "    u.userID,\n"
                + "    u.firstname,\n"
                + "	u.lastname,\n"
                + "    u.dob,\n"
                + "    YEAR(GETDATE()) - YEAR(u.dob) - \n"
                + "    CASE\n"
                + "        WHEN MONTH(GETDATE()) < MONTH(DOB) OR (MONTH(GETDATE()) = MONTH(DOB) AND DAY(GETDATE()) < DAY(DOB)) THEN 1\n"
                + "        ELSE 0\n"
                + "    END AS Age\n"
                + "FROM\n"
                + "    [User] u where userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int age = rs.getInt("Age");
                return age;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

//    
    public User check(String username, String password) {
        String sql = "SELECT * from [User] where username=? and password=?";
        EncodePasswork SHA1 = new EncodePasswork();
        String newPass = SHA1.toSHA1(password);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, newPass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User a = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("password"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("gender"), rs.getString("email"), rs.getString("address"), rs.getString("describe"), rs.getString("dob"), rs.getString("phone"), rs.getInt("role"), rs.getString("avatar"));

                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(User c) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[firstname]\n"
                + "           ,[lastname]\n"
                + "           ,[gender]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[describe]\n"
                + "           ,[dob]\n"
                + "           ,[phone]\n"
                + "           ,[role]\n"
                + "           ,[avatar])\n"
                + "     VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        EncodePasswork SHA1 = new EncodePasswork();
        String newPass = SHA1.toSHA1(c.getPassword());
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getUsername());
            st.setString(2, newPass);
            st.setNString(3, c.getFirstname());
            st.setNString(4, c.getLastname());
            st.setString(5, c.getGender());
            st.setString(6, c.getEmail());
            st.setString(7, c.getAddress());
            st.setString(8, c.getDescribe());
            st.setString(9, c.getDob());
            st.setString(10, c.getPhone());
            st.setInt(11, c.getRole());
            st.setString(12, c.getAvatar());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changePass(String randomString, String username) {
        EncodePasswork SHA1 = new EncodePasswork();
        String newPass = SHA1.toSHA1(randomString);
        String sql = "update [User] set password=? where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPass);
            st.setString(2, username);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User checkUserName(String username) {
        String sql = "select * from [User] where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("password"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("gender"), rs.getString("email"), rs.getString("address"), rs.getString("describe"), rs.getString("dob"), rs.getString("phone"), rs.getInt("role"), rs.getString("avatar"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> getAllCustomer() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User] where role != 0";
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

    public List<User> searchCustomerByUsernameOrEmailOrPhone(String key) {
        String sql = "select * from [User] where role!=0 AND (username like '%" + key + "%' or email like '%" + key + "%' or phone like '%" + key + "%')";
        List<User> list = new ArrayList<>();
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

    public List<User> sortAllCustomerAscending(String Columns) {
        String sql = "SELECT * FROM [dbo].[User] WHERE role != 0 \n"
                + "order by " + Columns + " asc";
        List<User> list = new ArrayList<>();
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

    public List<User> sortAllCustomerDescending(String Columns) {
        String sql = "SELECT * FROM [dbo].[User] WHERE role != 0 \n"
                + "order by " + Columns + " desc";
        List<User> list = new ArrayList<>();
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

    public void BanUser(int id) {
        int role = -1;
        String sql1 = "SELECT [role]\n"
                + "  FROM [dbo].[User]\n"
                + "  Where userID = " + id + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql1);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                role = rs.getInt("role");
            }
        } catch (SQLException e) {
        }
        if (role == 1) {
            role = 3;
        } else if (role == 2) {
            role = 4;
        }
        String sql2 = "UPDATE [dbo].[User]\n"
                + "   SET [role] = " + role + "\n"
                + " WHERE userID =" + id + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql2);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void UnBanUser(int id) {
        int role = -1;
        String sql1 = "SELECT [role]\n"
                + "  FROM [dbo].[User]\n"
                + "  Where userID = " + id + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql1);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                role = rs.getInt("role");
            }
        } catch (SQLException e) {
        }
        if (role == 3) {
            role = 1;
        } else if (role == 4) {
            role = 2;
        }
        String sql2 = "UPDATE [dbo].[User]\n"
                + "   SET [role] = " + role + "\n"
                + " WHERE userID =" + id + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql2);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
