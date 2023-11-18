/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.VideoManage;

/**
 *
 * @author Admin
 */
public class CommentDAO extends DBContext {

    public void InputComment(int uid, int vid, String comment) {

        String sql = "insert into Comments(VidID,userID,Content) values (?,?,?)"; // Thay thế 'videourl' bằng tên cột chứa URL trong bảng của bạn
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, vid);
            st.setInt(2, uid);
            st.setString(3, comment);
            ResultSet rs = st.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CommentDAO cd = new CommentDAO();
       
        List<Comment> comments = cd.getAllComment();
        for (Comment c : comments) {
            out.println("<div > "+c.getContent()+"</div>");
        }
    }

    public List<Comment> getAllCommentById(int vid) {
        List<Comment> Comment = new ArrayList<>();
        String sql = "select u.firstname, c.Content from Comments c,[User] u where c.userID = u.userID and VidID = ? order by ID desc"; // Thay thế 'videourl' bằng tên cột chứa URL trong bảng của bạn
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, vid);
            ResultSet rs = st.executeQuery();

            // Set parameter sau khi execute
            while (rs.next()) {
                // Code xử lý kết quả

                Comment c = new Comment(
                        rs.getString("Content"),
                       rs.getString("firstname")
                        
                );
                Comment.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return Comment;
    }
        public List<Comment> getAllComment() {
        List<Comment> Comment = new ArrayList<>();
        String sql = "select u.firstname, c.Content from Comments c,[User] u where c.userID = u.userID order by ID desc"; // Thay thế 'videourl' bằng tên cột chứa URL trong bảng của bạn
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            // Set parameter sau khi execute
            while (rs.next()) {
                // Code xử lý kết quả

                Comment c = new Comment(
                        rs.getString("Content"),
                       rs.getString("firstname")
                        
                );
                Comment.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return Comment;
    }
}
