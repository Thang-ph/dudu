/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.VideoReact;

/**
 *
 * @author Admin
 */
public class LikeDAO extends DBContext{
    public void Like(int userID, int videoid) {
    String sql = "INSERT INTO [dbo].[Like]([userID],[videoId]) VALUES (?,?)";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, userID);
        st.setInt(2, videoid);
        // Thực thi câu lệnh SQL để thêm bản ghi vào cơ sở dữ liệu
        int rowsAffected = st.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("Bản ghi đã được thêm thành công.");
        } else {
            System.out.println("Không thể thêm bản ghi.");
        }
    } catch (SQLException e) {
        System.out.println("Lỗi: " + e.getMessage());
    }
}

    public static  void main(String[] args) {
            LikeDAO sd=new LikeDAO();
            sd.Like(1,2);

    }
}
