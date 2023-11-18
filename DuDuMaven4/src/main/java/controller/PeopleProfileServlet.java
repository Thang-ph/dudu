/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlockDAO;
import dal.FollowDAO;
import dal.UserDAO;
import dal.videoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;
import model.VideoManage;

/**
 *
 * @author PC
 */
@WebServlet(name = "PeopleProfileServlet", urlPatterns = {"/peopleprofile"})
public class PeopleProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet PeopleProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PeopleProfileServlet at " + request.getContextPath() + "</h1>");
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
         User k = (User)session.getAttribute("account");
         videoDAO vd = new videoDAO();
        
        String userid = request.getParameter("userID");
        UserDAO ud = new UserDAO();
        FollowDAO fd = new FollowDAO();
        BlockDAO bd = new BlockDAO();
        User u = new User();
        int userID;
        try {
            if(k!=null)
            {
            userID = Integer.parseInt(userid);
            u = ud.getUserbyID(userID);
            request.setAttribute("people", u);
            List<VideoManage> listVideo = vd.getVIdeoByUserID(userID);
            request.setAttribute("listVideo", listVideo);
            request.setAttribute("videosize", listVideo.size());
            List<User> listoffollowing = fd.getFollowingByUserId(userID);
            List<User> listoffollowers = fd.getFollowersByUserId(userID);
            if (listoffollowers.isEmpty()) {
                request.setAttribute("nofollowers", "No Followers");
            }
            if (listoffollowing.isEmpty()) {
                request.setAttribute("nofollowing", "No Following");
            }
            
            if(bd.checkBlock(k.getUserID(), userID))
            {
                request.setAttribute("blockstatus", "UnBlock");
                request.setAttribute("mess", "User has been Blocked");
            }
            else
            {
                request.setAttribute("blockstatus", "Block");
            }
            
            if (fd.checkFollow(k.getUserID(), userID)) {
                request.setAttribute("followornot", "Unfollow");
            } else {
                request.setAttribute("followornot", "Follow");

            }
            
            request.setAttribute("listoffollowing", listoffollowing);
            request.setAttribute("listoffollowers", listoffollowers);
            request.setAttribute("tottalfollowing", listoffollowing.size());
            request.setAttribute("tottalfollowers", listoffollowers.size());
            }
            else
            {
                userID = Integer.parseInt(userid);
            u = ud.getUserbyID(userID);
            request.setAttribute("people", u);
            List<VideoManage> listVideo = vd.getVIdeoByUserID(userID);
            request.setAttribute("listVideo", listVideo);
            request.setAttribute("videosize", listVideo.size());
            List<User> listoffollowing = fd.getFollowingByUserId(userID);
            List<User> listoffollowers = fd.getFollowersByUserId(userID);
            if (listoffollowers.isEmpty()) {
                request.setAttribute("nofollowers", "No Followers");
            }
            if (listoffollowing.isEmpty()) {
                request.setAttribute("nofollowing", "No Following");
            }
            request.setAttribute("listoffollowing", listoffollowing);
            request.setAttribute("listoffollowers", listoffollowers);
            request.setAttribute("tottalfollowing", listoffollowing.size());
            request.setAttribute("tottalfollowers", listoffollowers.size());
            }
        } catch (Exception e) {
        }

        request.getRequestDispatcher("peopleprofile.jsp").forward(request, response);
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
        processRequest(request, response);
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

}
