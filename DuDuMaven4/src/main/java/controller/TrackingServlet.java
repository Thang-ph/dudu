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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Order;
import model.Order_List;
import model.User;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "TrackingServlet", urlPatterns = {"/tracking"})
public class TrackingServlet extends HttpServlet {

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
            out.println("<title>Servlet TrackingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TrackingServlet at " + request.getContextPath() + "</h1>");
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
        User account = (User) session.getAttribute("account");
        OrderDAO od = new OrderDAO();
        
                int userID=account.getUserID();
               
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }

        int n=0;
        Cart cart=null;
     
        if(account!=null){
        cart=new Cart(txt,account.getUserID());
         List<Item> listItem = cart.getItems();
        
        
            n=listItem.size();
        }
          request.setAttribute("sizeCart", n);
        List<Order_List> pending = od.getItemByUserIDStatus(userID, "Pending");
        List<Order_List> confirmed = od.getItemByUserIDStatus(userID, "confirmed");
        List<Order_List> processing = od.getItemByUserIDStatus(userID, "processing");
        List<Order_List> delivered = od.getItemByUserIDStatus(userID, "delivered");
        List<Order_List> dispatched = od.getItemByUserIDStatus(userID, "dispatched");
        request.setAttribute("pending", pending);
        request.setAttribute("confirmed", confirmed);
        request.setAttribute("processing", processing);
        request.setAttribute("dispatched", dispatched);
        request.setAttribute("delivered", delivered);
        PrintWriter out=response.getWriter();
//        out.print(pending.get(0).getQuantity());
        request.getRequestDispatcher("tracking.jsp").forward(request, response);
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
