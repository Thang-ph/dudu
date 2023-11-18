/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.WarehouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Warehouse;

/**
 *
 * @author PC
 */
@WebServlet(name = "UpdateWareHouseServlet", urlPatterns = {"/updatewarehouse"})
public class UpdateWareHouseServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateWareHouseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateWareHouseServlet at " + request.getContextPath() + "</h1>");
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
        String wareID = request.getParameter("warehouseID");
        String proID = request.getParameter("productID");
        int wID, pID;
        try {
            pID = Integer.parseInt(proID);
            wID = Integer.parseInt(wareID);
            request.setAttribute("pID", pID);
            request.setAttribute("wID", wID);
        } catch (Exception e) {
        }
        request.getRequestDispatcher("updatewarehouse.jsp").forward(request, response);
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
        String type = request.getParameter("type");
        String size = request.getParameter("size");
        String quan = request.getParameter("quantity");
        String wareID = request.getParameter("wID");
        String proID = request.getParameter("pID");
        int quantity, productID, warehouseID;
        WarehouseDAO wd = new WarehouseDAO();
        ProductDAO pd = new ProductDAO();
        try {
            quantity = Integer.parseInt(quan);
            productID = Integer.parseInt(proID);
            warehouseID = Integer.parseInt(wareID);
            Warehouse w = new Warehouse(warehouseID, pd.getProductByProductID(productID), type, size, quantity);
                wd.update(w);
            response.sendRedirect("WarehouseManager?productID=" + productID + "");
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
