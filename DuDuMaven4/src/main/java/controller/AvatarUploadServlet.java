/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import model.User;
import util.EncodePasswork;

/**
 *
 * @author PC
 */
@WebServlet(name = "AvatarUploadServlet", urlPatterns = {"/avatarupload"})
@MultipartConfig()

public class AvatarUploadServlet extends HttpServlet {

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
            out.println("<title>Servlet AvatarUploadServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AvatarUploadServlet at " + request.getContextPath() + "</h1>");
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
        String user_id = request.getParameter("userID");
        int userID;
        try {
            userID = Integer.parseInt(user_id);
        } catch (Exception e) {
        }
        request.getRequestDispatcher("editprofile.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user_id = request.getParameter("userID");
        int userID = 0;
        UserDAO ud = new UserDAO();
        try {
            userID = Integer.parseInt(user_id);
        } catch (Exception e) {
        }
        User u = ud.getUserbyID(userID);
        Part part = request.getPart("avatar");
        String fileName = part.getSubmittedFileName();
        if (!fileName.endsWith(".png") &&    !fileName.endsWith(".jpg")) {
            // Nếu kích thước của tệp là 0, người dùng không chọn tệp, xử lý ngoại lệ tại đây
            request.setAttribute("er", "only '.png' and '.jpg' can be set");
            request.getRequestDispatcher("editprofile.jsp").forward(request, response);
        } else {

            String realPath = request.getServletContext().getRealPath("/avataruploads");
            String avatar = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            part.write(realPath + "/" + avatar);
            User uNew = new User(u.getUserID(), u.getUsername(), u.getFirstname(), u.getLastname(), u.getGender(), u.getEmail(), u.getAddress(), u.getDescribe(), u.getDob(), u.getPhone(), u.getRole(), "avataruploads/" + avatar);
            ud.updateAvatar(uNew);
            request.setAttribute("warning", "upload profile avatar successful");
            session.setAttribute("account", uNew);
            request.getRequestDispatcher("editprofile.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
//public static void main(String[] args) {
//        User u = new User(1, "hello", "first", "lastname", "Male", "email@gmail.com", "address", "describe", "2023-03-03", "03123123",1, "concac");
//        User uNew = new User(u.getUserID(), u.getUsername(), u.getFirstname(), u.getLastname(), u.getGender(), u.getEmail(), u.getAddress(), u.getDescribe(), u.getDob(), u.getPhone(), u.getRole(), "vailon");
//        UserDAO ud =new UserDAO();
//        ud.updateAvatar(uNew);
//        System.out.println(uNew.getAvatar());
//    }
}
