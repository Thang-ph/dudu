/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.User;

/**
 *
 * @author PC
 */
public class BlockDAO extends DBContext{
    public void insertBlock(int userID, int blockID) {
        String sql = "INSERT INTO [dbo].[Block]\n"
                + "           ([userID]\n"
                + "           ,[blockID])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, blockID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteBlock(int userID, int blockID) {
        String sql = "DELETE FROM [dbo].[Block]\n"
                + "      WHERE userID =?\n"
                + "	  AND blockID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, blockID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public boolean checkBlock(int userID, int blockID)
    {
        String sql="Select userID, blockID from Block where userID = ? And blockID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, blockID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
            return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<User> getBlockListFromUserID(int userID)
    {
        List<User> list = new ArrayList<>();
        String sql = "Select u.*\n"
                + "from [User] u, Block b\n"
                + "where u.userID = b.blockID\n"
                + "And b.userID = " + userID;
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
    
    public Map<Integer, Integer> getBlockCountToUserID() {
        String sql = "SELECT blockID,COUNT(*) as count FROM Block group by blockID";
        Map<Integer, Integer> blockCountMap = new HashMap<>();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int blockID = rs.getInt("blockID");
                int count = rs.getInt("count");
                blockCountMap.put(blockID, count);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return blockCountMap;
    }

    public static void main(String[] args) {
        // Create an instance of BlockDAO
        BlockDAO blockDAO = new BlockDAO();

        // Assuming you have the necessary setup for the 'connection' variable
        // For demonstration purposes, you might want to replace it with your actual connection logic

        // Call the getBlockCountToUserID method
        Map<Integer, Integer> countMap = blockDAO.getBlockCountToUserID();

        // Print the results
        for (Map.Entry<Integer, Integer> entry : countMap.entrySet()) {
            int blockID = entry.getKey();
            int count = entry.getValue();
            System.out.println("BlockID: " + blockID + ", Count: " + count);
        }
    }
}

