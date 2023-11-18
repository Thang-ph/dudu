/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlockDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserListServlet", urlPatterns = {"/userlist"})
public class UserListServlet extends HttpServlet {

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
            out.println("<title>Servlet UserListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserListServlet at " + request.getContextPath() + "</h1>");
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
        UserDAO cdb = new UserDAO();
        List<User> list = cdb.getAllCustomer();
        String [] sort = {"UserName"};
         BlockDAO bd=new BlockDAO();
        Map<Integer, Integer> count = bd.getBlockCountToUserID();
        request.setAttribute("count", count);
        request.setAttribute("sortlist", sort);
        request.setAttribute("userlist", list);
        request.setAttribute("sorting", sort);
        request.setAttribute("ading", "Ascending");
        request.getRequestDispatcher("userlist.jsp").forward(request, response);
        
        //User u = cdb.getUserbyID(1);
        //PrintWriter out = response.getWriter();
        //out.print(u.getUsername());
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
        UserDAO cdb = new UserDAO();
        List<User> list = new ArrayList<>();
        String sortby = request.getParameter("sort");
        String ad = request.getParameter("ad");
        String search = request.getParameter("search");
        String [] sort = {"UserName","FirstName","LastName","dob","email","gender","address","phone"};
        request.setAttribute("sortlist", sort);
        if (search == null) {
            if (ad.equals("Ascending")) {
                list = cdb.sortAllCustomerAscending(sortby);
            } else {
                list = cdb.sortAllCustomerDescending(sortby);
            }
        }else if (ad == null || sortby == null){
            list = cdb.searchCustomerByUsernameOrEmailOrPhone(search);
            request.setAttribute("searching", search);
        }else{
            list = cdb.getAllCustomer();
        }
        BlockDAO bd=new BlockDAO();
        Map<Integer, Integer> count = bd.getBlockCountToUserID();
        request.setAttribute("count", count);
        request.setAttribute("sorting", sortby);
        request.setAttribute("ading", ad);
        request.setAttribute("userlist", list);
        request.getRequestDispatcher("userlist.jsp").forward(request, response);
        //User u = cdb.getUserbyID(1);
        //PrintWriter out = response.getWriter();
        //out.print(u.getUsername());

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
