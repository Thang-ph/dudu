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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;
import util.EncodePasswork;

/**
 *
 * @author PC
 */
@WebServlet(name = "ChangePassServlet", urlPatterns = {"/changepass"})
public class ChangePassServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangePassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("changepass.jsp").forward(request, response);

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
        String userid = request.getParameter("userID");
        String oldpass = request.getParameter("oldpass");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        UserDAO ud = new UserDAO();
        int userID;
        try {
            userID = Integer.parseInt(userid);
            User u = ud.getUserbyID(userID);
            EncodePasswork SHA1=new EncodePasswork();
            oldpass=SHA1.toSHA1(oldpass);
            if (checkoldpassword(oldpass, u.getPassword())) {
                if (!pass1.trim().isEmpty() && pass1.equals(pass2)) {
                    if(checkdPassword(pass1))
                    {
                    pass1=SHA1.toSHA1(pass1);
                    User uNew = new User(u.getUserID(), u.getUsername(), pass1 , u.getFirstname(), u.getLastname(), u.getGender(), u.getEmail(), u.getAddress(), u.getDescribe(), u.getDob(), u.getPhone(), u.getRole(), u.getAvatar());
                    ud.updatePass(uNew);
                    request.setAttribute("warning", "Baby u did it");
                    request.setAttribute("color", "green");
                    request.getRequestDispatcher("changepass.jsp").forward(request, response);                       
                    }
                    else
                    {
                        request.setAttribute("warning", "The password length must longer than 8 and at least 1 UpperCase, 1 digit number");
                        request.setAttribute("color", "red");
                        request.getRequestDispatcher("changepass.jsp").forward(request, response);
                    }
                }
                else
                {
                    request.setAttribute("warning", "The confirmation was wrong");
                    request.setAttribute("color", "red");
                    request.getRequestDispatcher("changepass.jsp").forward(request, response);
                }
            }
            else
            {
                request.setAttribute("warning", "The old pass do not match");
                request.setAttribute("color", "red");
                request.getRequestDispatcher("changepass.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }

    }

    public boolean checkoldpassword(String pass1, String pass2) {
        if (pass1.equals(pass2)) {
            return true;
        }
        return false;
    }
    
    public static boolean checkdPassword(String password) {
        // Kiểm tra ít nhất một kí tự hoa
        Pattern uppercasePattern = Pattern.compile("[A-Z]");
        Matcher uppercaseMatcher = uppercasePattern.matcher(password);
        boolean hasUppercase = uppercaseMatcher.find();

        // Kiểm tra ít nhất một chữ số
        Pattern digitPattern = Pattern.compile("\\d");
        Matcher digitMatcher = digitPattern.matcher(password);
        boolean hasDigit = digitMatcher.find();

        // Kiểm tra dài ít nhất 10 kí tự
        boolean isLengthValid = password.length() >= 8;

        // Kiểm tra có ít nhất một kí tự đặc biệt
//        Pattern specialCharPattern = Pattern.compile("[!@#$%^&*()_+//-={};':\"\\\\|,.<>/?]");
//        Matcher specialCharMatcher = specialCharPattern.matcher(password);
//        boolean hasSpecialChar = specialCharMatcher.find();

        // Trả về true nếu tất cả các yêu cầu đều được đáp ứng
        return hasUppercase && hasDigit && isLengthValid;
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
