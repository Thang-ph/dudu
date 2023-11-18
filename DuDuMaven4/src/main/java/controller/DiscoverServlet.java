/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.BlockDAO;
import dal.videoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.User;
import model.VideoManage;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DiscoverServlet", urlPatterns = {"/ds"})
public class DiscoverServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DiscoverServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DiscoverServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        videoDAO vd = new videoDAO();
        BlockDAO bd = new BlockDAO();
        List<VideoManage> listVideo = vd.getAllVideo();
        User u = (User) session.getAttribute("account");
        if (u != null) {
            List<VideoManage> newList = new ArrayList<>();
            for (VideoManage video : listVideo) {
                if (bd.checkBlock(u.getUserID(), video.getUserID()) == false) {
                    newList.add(video);
                }
            }
            request.setAttribute("listVideo", newList);

        } //        List<String> htmlCodeList = vd.takeurl();
        //        request.setAttribute("videoOut", htmlCodeList);
        else {
            request.setAttribute("listVideo", listVideo);
        }
        request.getRequestDispatcher("Discover.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        videoDAO vd = new videoDAO();

        String hashtagg = request.getParameter("hashtag");
        List<VideoManage> listVideo = vd.getVIdeoByHashtag(hashtagg);

        // Chuyển danh sách thành dạng JSON
        Gson gson = new Gson(); // Sử dụng thư viện Gson để chuyển đổi đối tượng thành JSON
        String json = gson.toJson(listVideo);

        // Thiết lập loại nội dung là JSON
        response.setContentType("application/json");

        // Ghi dữ liệu JSON vào response
        response.getWriter().write(json);
    }

}
