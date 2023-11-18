/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ShopDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Shop;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="UpdateShop", urlPatterns={"/UpdateShop"})
public class UppdateShop extends HttpServlet {
   
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
            out.println("<title>Servlet UppdateShop</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UppdateShop at " + request.getContextPath () + "</h1>");
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
        ShopDAO sd = new ShopDAO();
        String userID = request.getParameter("userID");
        String shopID = request.getParameter("shopID");
        request.setAttribute("userID", userID);
        request.setAttribute("shop", sd.getShopByID(Integer.parseInt(shopID)));
        request.getRequestDispatcher("UpdateShop.jsp").forward(request, response);
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
        ShopDAO sd = new ShopDAO();
        String raw_shopID = request.getParameter("shopID");
        String raw_userID = request.getParameter("userID");
        String name = request.getParameter("shop-name");
        int userID = Integer.parseInt(raw_userID);
        int shopID = Integer.parseInt(raw_shopID);
        if(name.trim().isEmpty()){
            request.setAttribute("userID", userID);
            request.setAttribute("validate", "please enter the shop name");
            request.getRequestDispatcher("UpdateShop.jsp").forward(request, response);
        }else{
            Shop s = sd.getShopByID(shopID);
            s.setName(name);
            sd.UpdateShop(s);
            response.sendRedirect("shopManage?userID="+userID);
        }
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
