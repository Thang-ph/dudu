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
import java.text.DecimalFormat;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.Email;
import model.Order;
import model.Order_List;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "BillServlet", urlPatterns = {"/bill"})
public class BillServlet extends HttpServlet {

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
            out.println("<title>Servlet BillServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BillServlet at " + request.getContextPath() + "</h1>");
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
        OrderDAO od = new OrderDAO();

        int orderID = od.getLastOrder().getOrderID();
        String email = od.getLastOrder().getUser().getEmail();

        Order o = od.getOrderByOrderID(orderID);
        List<Order_List> list = od.getDetailOrderByDetaiOrderID(orderID);
        double bill = 0;

        Set<Integer> uniqueShopIDs = new HashSet<>();
        for (Order_List odl : list) {
             int shopID = odl.getProduct().getShop().getShopID();
        uniqueShopIDs.add(shopID);
            odl.getProduct().getShop().getShopID();
            bill += odl.getQuantity() * odl.getProduct().getPrice();
        }
          int count = uniqueShopIDs.size();
        double ship = 0;
        switch (o.getShip()) {
            case "Standard-Delivery": {
                ship = 20000;
                break;
            }
            case "Fast-Delivery": {
                ship = 30000;
                break;
            }
            case "Express Delivery": {
                ship = 40000;
                break;
            }

        }
        request.setAttribute("order", o);
        request.setAttribute("list", list);
        request.setAttribute("bill", bill);
        request.setAttribute("ship", ship);

        Email e = new Email();
        DecimalFormat decimalFormat = new DecimalFormat("##,###,###.#₫");

       String content = "<html>\n"
    + "    <head>\n"
    + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
    + "        <title>JSP Page</title>\n"
    + "        <style>\n"
    + "        .body-main {\n"
    + "            background: #ffffff;\n"
    + "            border-bottom: 15px solid #1E1F23;\n"
    + "            border-top: 15px solid #1E1F23;\n"
    + "            margin-top: 30px;\n"
    + "            margin-bottom: 30px;\n"
    + "            padding: 40px 30px !important;\n"
    + "            position: relative;\n"
    + "            box-shadow: 0 1px 21px #808080;\n"
    + "            font-size: 10px;\n"
    + "        }\n"
    + "        .main thead {\n"
    + "            background: #1E1F23;\n"
    + "            color: #fff;\n"
    + "        }\n"
    + "        .img {\n"
    + "            height: 100px;\n"
    + "        }\n"
    + "        h1 {\n"
    + "            text-align: center;\n"
    + "        }\n"
    + "        </style>\n"
    + "    </head>\n"
    + "    <body>\n"
    + "       <div class=\"container\">\n"
    + "           <div class=\"page-header\">\n"
    + "           </div>\n"
    + "           <div class=\"container\">\n"
    + "               <div class=\"row\">\n"
    + "                   <div class=\"col-md-2\"></div>\n"
    + "                   <div class=\"col-md-8 col-md-offset-3 body-main\">\n"
    + "                       <div class=\"col-md-12\">\n"
    + "                           <div class=\"row\">\n"
    + "                               <div class=\"col-md-4\">\n"
    + "                                   <img class=\"img\" alt=\"Invoce Template\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/394471391_718431580149040_2443833232315140634_n.png?_nc_cat=110&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=1xtFkCOO_1gAX-izVbQ&_nc_ht=scontent.fhan3-5.fna&oh=03_AdQb0HBoI07TIyTk4cyo3NVt8gLgz0sC9QX8fBc1L_l_gw&oe=656210A8&_nc_fr=fhan3c05\" />\n"
    + "                               </div>\n"
    + "                               <div class=\"col-md-8 text-right\">\n"
    + "                                   <h4 style=\"color: #F81D2D;\"><strong>DuDu Inc</strong></h4>\n"
    + "                                   <p>Wall Street, New York, NY 10005, America Đình</p>\n"
    + "                                   <p>0988666888</p>\n"
    + "                                   <p>DuDuShopCompany@gmail.com</p>\n"
    + "                               </div>\n"
    + "                           </div>\n"
    + "                           <br />\n"
    + "                           <div class=\"row\">\n"
    + "                               <div class=\"col-md-12 text-center\">\n"
    + "                                   <h2>INVOICE</h2>\n"
    + "                                   <h5>#"+orderID+"</h5>\n"
    + "                               </div>\n"
    + "                           </div>\n"
    + "                           <br />\n"
    + "                           <div>\n"
    + "                               <table class=\"table\">\n"
    + "                                   <thead>\n"
    + "                                       <tr>\n"
    + "                                           <th><h5>Product</h5></th>\n"
    + "                                           <th><h5>Quantity</h5></th>\n"
    + "                                           <th><h5>Amount</h5></th>\n"
    + "                                       </tr>\n"
    + "                                   </thead>\n"
    + "                                   <tbody>\n";

for (int i = 0; i < list.size(); i++) {
    content += "                                   <tr>\n"
        + "                                       <td class=\"col-md-6\">" + list.get(i).getProduct().getName() +"( "+ list.get(i).getType()+ list.get(i).getSize()+" )"+"</td>\n"
        + "                                       <td class=\"col-md-3\">" + list.get(i).getQuantity() + "</td>\n"
        + "                                       <td class=\"col-md-3\"> " + decimalFormat.format(list.get(i).getProduct().getPrice() * list.get(i).getQuantity()) + " </td>\n"
        + "                                   </tr>\n";
}

content += "                                   <tr >\n"
    + "                                       <td ></td>\n"
    + "                                       <td class=\"text-right\">\n"
    + "                                           <p>\n"
    + "                                               <strong>Bill: </strong>\n"
    + "                                           </p>\n"
    + "                                           <p>\n"
    + "                                               <strong>"+o.getShip()+":</strong>\n"
    + "                                           </p>\n"
    + "                                           <p>\n"
    + "                                               <strong>Discount: </strong>\n"
    + "                                           </p>\n"
    + "                                       </td>\n"
    + "                                       <td>\n"
    + "                                           <p>\n"
    + "                                               <strong> "+decimalFormat.format(bill)+" </strong>\n"
    + "                                           </p>\n"
    + "                                           <p>\n"
    + "                                               <strong> "+decimalFormat.format(ship*count)+"</strong>\n"
    + "                                           </p>\n"
    + "                                           <p>\n"
    + "                                               <strong> "+(o.getDiscount()*100)+"%"+" </strong>\n"
    + "                                           </p>\n"
    + "                                       </td>\n"
    + "                                   </tr>\n"
    + "                                       \n"
    + "                                   <tr style=\"color: #F81D2D;\">\n"
    + "                                       <td ></td>\n"
    + "                                       <td class=\"text-right\"><h4><strong>Total:</strong></h4></td>\n"
    + "                                       <td class=\"text-left\"><h4><strong> "+decimalFormat.format(o.getTotal())+" </strong></h4></td>\n"
    + "                                   </tr>\n"
    + "                               </tbody>\n"
    + "                           </table>\n"
    + "                       </div>\n"
    + "                       <div>\n"
    + "                           <div class=\"col-md-12\">\n"
    + "                               <p><b>Date :</b>"+o.getDate()+"</p>\n"
    + "                               <br />\n"
    + "                               <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Signature</b></p>\n"
    + "                               <img style=\"width:20%\" src=\"https://scontent.fhan4-1.fna.fbcdn.net/v/t1.15752-9/395125950_1707402199739840_8892491942324173147_n.png?_nc_cat=105&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=CdLVigAbAnwAX83-S2U&_nc_ht=scontent.fhan4-1.fna&oh=03_AdS6waQ2BBcFtbAisN7sEVURH6wt-KLZuV-NqrOJFbgkRQ&oe=656233B8\"/>\n"
    + "                           </div>\n"
    + "                       </div>\n"
    + "                   </div>\n"
    + "               </div>\n"
    + "           </div>\n"
    + "       </div>\n"
    + "    </body>\n"
    + "</html>\n"
    + "";
e.sendEmail(od.getOrderByOrderID(orderID).getUser().getEmail(), content, "Your purchase");

//        request.getRequestDispatcher("bill.jsp").forward(request, response);
        request.getRequestDispatcher("shop").forward(request, response);
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
