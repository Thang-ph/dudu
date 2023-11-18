/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FollowDAO;
import dal.ShopDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Shop;
import model.User;

/**
 *
 * @author PC
 */
@WebServlet(name = "OTPServlet", urlPatterns = {"/otp"})
public class OTPServlet extends HttpServlet {

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
            out.println("<title>Servlet OTPServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OTPServlet at " + request.getContextPath() + "</h1>");
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
        String shopname = request.getParameter("shopname");
         String username = request.getParameter("username");
        String lastname = request.getParameter("lastname");
        String firstname = request.getParameter("firstname");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String role_raw = request.getParameter("role");
        String describe = request.getParameter("describe");
        String avatar = request.getParameter("avatar");
        String otpcode = request.getParameter("otpcode");
        int role;
        try {
            role = Integer.parseInt(role_raw);
            User cNew = new User(username, pass, firstname, lastname, gender, email, address, describe, dob, phone, role, avatar);
             request.setAttribute("cNew", cNew);
             request.setAttribute("shopname", shopname);
             request.setAttribute("otpcode", otpcode);
        } catch (Exception e) {
        }
        
       request.getRequestDispatcher("otp.jsp").forward(request, response);
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
        String shopname = request.getParameter("shopname");
        String username = request.getParameter("username");
        String lastname = request.getParameter("lastname");
        String firstname = request.getParameter("firstname");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String role_raw = request.getParameter("role");
        String describe = request.getParameter("describe");
        String avatar = request.getParameter("avatar");

        String otpcode = request.getParameter("otpcode");
        String otpinput = request.getParameter("otpinput");
        HttpSession session = request.getSession();
        UserDAO d = new UserDAO();
        int role;
        
        if(otpcode.isEmpty()) 
        {
            request.setAttribute("error", "access denied");
            request.getRequestDispatcher("otp.jsp").forward(request, response);
        }
        
        try {
            role = Integer.parseInt(role_raw);
            
            if (otpinput.trim().equals(otpcode)) {
                User cNew = new User(username, pass, firstname, lastname, gender, email, address, describe, dob, phone, role, avatar);
                d.insert(cNew);              

                if(role==2)
                {
                    FollowDAO sd = new FollowDAO();
                    sd.insertShop(shopname, d.checkUserName(username).getUserID(), 0);
                }
                cNew.setUserID(d.checkUserName(username).getUserID());
                session.setAttribute("account", cNew);
                response.sendRedirect("sv");
                //request.getRequestDispatcher("home.jsp").forward(request, response);
                
            } else {
                User cNew = new User(username, pass, firstname, lastname, gender, email, address, describe, dob, phone, role, avatar);
                request.setAttribute("cNew", cNew);
                request.setAttribute("shopname", shopname);
                request.setAttribute("error", "access denied");
                request.setAttribute("otpcode", otpcode);
                request.getRequestDispatcher("otp.jsp").forward(request, response);
            }
        } catch (Exception e) {
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

}
