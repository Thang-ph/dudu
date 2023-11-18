/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order_List;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name="OrderTrackingServlet", urlPatterns={"/orderTracking"})
public class OrderTrackingServlet extends HttpServlet {
   
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
            out.println("<title>Servlet OrderTrackingServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderTrackingServlet at " + request.getContextPath () + "</h1>");
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
        OrderDAO od=new OrderDAO();
        String shopID_raw=request.getParameter("shopID");
        int shopID=0;
        try{
            shopID=Integer.parseInt(shopID_raw);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
    List<Order_List> ol=od.getOrderListByShopID(shopID);
    
       List<Order_List> pending = od.getItemByStatus(ol, "Pending");
        List<Order_List> confirmed = od.getItemByStatus(ol, "Confirmed");
        List<Order_List> processing = od.getItemByStatus(ol, "Processing");
        List<Order_List> delivered = od.getItemByStatus(ol, "Delivered");
        List<Order_List> dispatched = od.getItemByStatus(ol, "Dispatched");
        request.setAttribute("pending", pending);
        request.setAttribute("confirmed", confirmed);
        request.setAttribute("processing", processing);
        request.setAttribute("dispatched", dispatched);
        request.setAttribute("delivered", delivered);
        request.getRequestDispatcher("orderTracking.jsp").forward(request, response);
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
