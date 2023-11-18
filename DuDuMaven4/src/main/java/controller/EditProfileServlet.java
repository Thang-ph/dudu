/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;
import model.VideoManage;
import util.EncodePasswork;

/**
 *
 * @author PC
 */
@WebServlet(name = "EditProfileServlet", urlPatterns = {"/editprofile"})
public class EditProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileServlet at " + request.getContextPath() + "</h1>");
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
        String userid = request.getParameter("userID");
        HttpSession session = request.getSession();
        UserDAO ud = new UserDAO();
        int userID;
        try {
            userID = Integer.parseInt(userid);
            User u = ud.getUserbyID(userID);
            session.setAttribute("user", u);
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
        String userid = request.getParameter("userID");
        String username = request.getParameter("username");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String describe = request.getParameter("describe");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        HttpSession session = request.getSession();
        UserDAO ud = new UserDAO();
        boolean boo ;
        int userID;
        try {
//            PrintWriter out = response.getWriter();
//            System.out.println("hello");
            userID = Integer.parseInt(userid);
            User u = ud.getUserbyID(userID);
//            String password = u.getPassword();
            User k = ud.checkUserName(username);            
            if (k != null) //
            {
                if (k.getUsername().equals(u.getUsername())) {
                    boo = true;
                } else {
                    boo = false;
                }
            } else {
                boo = true;
            }
            
            if(boo==false)
            {
                    request.setAttribute("error", "The user " + username + " exitsed");
                    request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                    response.sendRedirect("editprofile");
            }
            
            if (username.trim().isEmpty() || firstname.trim().isEmpty() || lastname.trim().isEmpty()) {
                request.setAttribute("error", "Name invalid");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            }

            if (!isDateValid(dob)) {
                request.setAttribute("error", "Not a human birth or not old enough");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            }

            if (!checkPhone(phone)) {
                request.setAttribute("error", "Not a legit phone number");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            }

            if(address.trim().isEmpty())
            {
                request.setAttribute("error", "Where is your place");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            }
            
            if(describe.isEmpty())
            {
                describe="no bio yet.";
            }
            
            if (boo = true && !address.trim().isEmpty()  && !username.trim().isEmpty() && !firstname.trim().isEmpty() && !lastname.trim().isEmpty() && isDateValid(dob) && checkPhone(phone)) {
                videoDAO vd = new videoDAO();
                User uNew = new User(u.getUserID(), username, firstname, lastname, gender, email, address, describe, dob, phone, u.getRole(), u.getAvatar());
                ud.updateUser1(uNew);
                int age = ud.getUserAgebyID(userID);
                List<VideoManage> listVideo = vd.getVIdeoByUserID(userID);
                request.setAttribute("listVideo", listVideo);
                request.setAttribute("videosize", listVideo.size());
                session.setAttribute("age", age);
                session.setAttribute("account", uNew);
                request.setAttribute("error", "Update Successful");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    public boolean isDateValid(String date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        try {
            LocalDate inputDate = LocalDate.parse(date, formatter);
            LocalDate maxDate = LocalDate.now().minusYears(5); // Lấy ngày hiện tại
            LocalDate minDate = LocalDate.now().minusYears(150); // Lấy ngày hiện tại
            return !inputDate.isBefore(minDate) && !inputDate.isAfter(maxDate);
        } catch (DateTimeParseException e) {
            return false; // Trả về false nếu có lỗi phân tích chuỗi ngày
        }
    }

    public boolean checkPhone(String phone) {
        String regex = "^(0|84)\\d{9,11}$";
        Pattern p = Pattern.compile(regex);
        Matcher matcher = p.matcher(phone);
        return matcher.matches();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
