/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author PC
 */
@WebServlet(name="ChangeRoleServlet", urlPatterns={"/changerole"})
public class ChangeRoleServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeRoleServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeRoleServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDAO ud = new UserDAO();
        String user_id = request.getParameter("userID");
        String role_raw = request.getParameter("role");
        int userID,role;
        try {
            userID = Integer.parseInt(user_id);
            role = Integer.parseInt(role_raw);
                User u = ud.getUserbyID(userID);
                User uNew = new User(userID, u.getUsername(), u.getFirstname(), u.getLastname(), u.getGender(), u.getEmail(), u.getAddress(), u.getDescribe(), u.getDob(), u.getPhone(), role, u.getAvatar());
                ud.updateUser1(uNew);
                session.setAttribute("account", uNew);
                if(role == 2)
                {
                    request.setAttribute("message1", "Now You Can Create A Shop");
//                    request.setAttribute("userID", userID);
                    request.getRequestDispatcher("shopManage.jsp").forward(request, response);
                }
                else if (role == 8)
                {
                    request.getRequestDispatcher("shipper.jsp").forward(request, response);
                }
                else
                {
                    request.getRequestDispatcher("sv").forward(request, response);
                }
        } catch (Exception e) {
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
