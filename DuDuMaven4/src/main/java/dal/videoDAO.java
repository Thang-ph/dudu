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
import model.Video;
import model.VideoManage;

/**
 *
 * @author Admin
 */
public class videoDAO extends DBContext {

    public void upload(String title, String url, String hashtag, int userID) {
        String sql = "INSERT INTO [dbo].[Video]\n"
                + "([title], [code], [hastag], [UserID])\n"
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, url);
            st.setString(3, hashtag);
            st.setInt(4, userID);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void uploadwithlink(String title, String url, String hashtag, int userID, int productID) {
        String sql = "INSERT INTO [dbo].[Video]\n"
                + "([title], [code], [hastag], [UserID],[product_id])\n"
                + "VALUES (?, ?, ?, ?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, url);
            st.setString(3, hashtag);
            st.setInt(4, userID);
            st.setInt(5, productID);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        videoDAO vd = new videoDAO();

        System.out.println(vd.getVIdeoByHashtag("#shopping").get(0).getTitle());

    }

    public List<VideoManage> getAllVideo() {
        List<VideoManage> Videoinfolist = new ArrayList<>();
        String sql1 = "SELECT v.vidID, v.userID, v.code, v.hastag, v.firstname, v.lastname, v.title,\n"
                + "       v.product_id AS product_id, v.name AS product_name, v.image AS product_image,\n"
                + "       COALESCE(likeCounts.likeCount, 0) AS likeCount\n"
                + "FROM (\n"
                + "    SELECT v.vidID, v.userID, v.code, v.hastag, u.firstname, u.lastname, v.title, v.product_id, p.name, p.image\n"
                + "    FROM Video v\n"
                + "    JOIN [User] u ON v.UserID = u.userID\n"
                + "    LEFT JOIN Product p ON v.product_id = p.productID\n"
                + "    WHERE v.product_id IS NULL\n"
                + "    UNION ALL\n"
                + "    SELECT v.vidID, v.userID, v.code, v.hastag, u.firstname, u.lastname, v.title, v.product_id, p.name, p.image\n"
                + "    FROM Video v\n"
                + "    JOIN [User] u ON v.UserID = u.userID\n"
                + "    JOIN Product p ON v.product_id = p.productID\n"
                + ") AS v\n"
                + "LEFT JOIN (\n"
                + "    SELECT videoID, COUNT(userID) AS likeCount\n"
                + "    FROM [Like]\n"
                + "    GROUP BY videoID\n"
                + ") AS likeCounts ON v.vidID = likeCounts.videoID\n"
                + "ORDER BY v.vidID DESC;"; // Thay thế 'videourl' bằng tên cột chứa URL trong bảng của bạn
        try {
            PreparedStatement st = connection.prepareStatement(sql1);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                VideoManage videoManage = new VideoManage(
                        rs.getString("title"),
                        rs.getInt("UserID"),
                        rs.getString("code"),
                        rs.getString("hastag"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getInt("VidID"),
                        rs.getString("product_name"),
                        rs.getString("product_image"),
                        rs.getInt("product_id"),
                        rs.getInt("likeCount")
                );
                Videoinfolist.add(videoManage);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return Videoinfolist;
    }

    public void saveVideoURL(String videoURL) {
        String sql = "INSERT INTO [dbo].[Video]\n"
                + "([title], [code], [hastag], [UserID])\n"
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, videoURL);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<VideoManage> getVIdeoByUserID(int userID) {
        List<VideoManage> Videoinfolist = new ArrayList<>();
        String sql = "  SELECT v.vidID, v.userID, v.code, v.hastag, u.firstname, u.lastname, v.title, NULL AS product_id, NULL AS name, NULL AS image\n"
                + "  FROM Video v\n"
                + "  JOIN [User] u ON v.UserID = u.userID\n"
                + "  WHERE v.product_id IS NULL\n"
                + "  AND v.UserID = " + userID + "\n"
                + "  UNION ALL\n"
                + "  SELECT v.vidID, v.userID, v.code, v.hastag, u.firstname, u.lastname, v.title, p.productID AS product_id, p.name, p.image\n"
                + "  FROM Video v\n"
                + "  JOIN [User] u ON v.UserID = u.userID\n"
                + "  JOIN Product p ON v.product_id = p.productID\n"
                + "  AND v.UserID = " + userID + "\n"
                + "  ORDER BY vidID DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                VideoManage videoManage = new VideoManage(
                        rs.getString("title"),
                        rs.getInt("UserID"),
                        rs.getString("code"),
                        rs.getString("hastag"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getInt("VidID"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getInt("product_id")
                );
                Videoinfolist.add(videoManage);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return Videoinfolist;
    }

    public List<VideoManage> getVIdeoByHashtag(String hashtag) {
        List<VideoManage> Videoinfolist = new ArrayList<>();
        String sql = "  SELECT v.vidID, v.userID, v.code, v.hastag, u.firstname, u.lastname, v.title, NULL AS product_id, NULL AS name, NULL AS image\n"
                + "                  FROM Video v\n"
                + "                  JOIN [User] u ON v.UserID = u.userID\n"
                + "                 WHERE v.product_id IS NULL\n"
                + "                  AND v.hastag = " + hashtag + "\n"
                + "                  UNION ALL\n"
                + "                  SELECT v.vidID, v.userID, v.code, v.hastag, u.firstname, u.lastname, v.title, p.productID AS product_id, p.name, p.image\n"
                + "                  FROM Video v\n"
                + "                  JOIN [User] u ON v.UserID = u.userID\n"
                + "                  JOIN Product p ON v.product_id = p.productID\n"
                + "                  AND v.hastag = " + hashtag + "\n"
                + "                 ORDER BY vidID DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                VideoManage videoManage = new VideoManage(
                        rs.getString("title"),
                        rs.getInt("UserID"),
                        rs.getString("code"),
                        rs.getString("hastag"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getInt("VidID"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getInt("product_id")
                );
                Videoinfolist.add(videoManage);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return Videoinfolist;
    }

    public List<VideoManage> SearchVideo(String searchString) {
        List<VideoManage> Videoinfolist = new ArrayList<>();
        String sql = "SELECT v.vidID, v.userID, v.code, v.hastag, u.firstname, u.lastname, v.title, NULL AS product_id, NULL AS name, NULL AS image\n"
                + "FROM Video v\n"
                + "JOIN [User] u ON v.UserID = u.userID\n"
                + "WHERE v.product_id IS NULL\n"
                + "AND v.title LIKE ?\n" // Placeholder for search string
                + "UNION ALL\n"
                + "SELECT v.vidID, v.userID, v.code, v.hastag, u.firstname, u.lastname, v.title, p.productID AS product_id, p.name, p.image\n"
                + "FROM Video v\n"
                + "JOIN [User] u ON v.UserID = u.userID\n"
                + "JOIN Product p ON v.product_id = p.productID\n"
                + "WHERE v.title LIKE ?\n";  // Placeholder for search string
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchString + "%");  // Set the search string with wildcards
            st.setString(2, "%" + searchString + "%");  // Set the search string with wildcards
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                VideoManage videoManage = new VideoManage(
                        rs.getString("title"),
                        rs.getInt("UserID"),
                        rs.getString("code"),
                        rs.getString("hastag"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getInt("VidID"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getInt("product_id")
                );
                Videoinfolist.add(videoManage);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return Videoinfolist;
    }

}
