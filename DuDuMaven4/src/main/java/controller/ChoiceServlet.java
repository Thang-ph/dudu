/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.VoucherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.List;
import model.Product;
import model.Voucher;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "ChoiceServlet", urlPatterns = {"/choice"})
public class ChoiceServlet extends HttpServlet {

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
            out.println("<title>Servlet ChoiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChoiceServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        String total_raw = request.getParameter("total");
        String ship_raw = request.getParameter("ship");
        String code = request.getParameter("code");
        String item_raw =request.getParameter("item");
        double total = 0,item=0;
        int ship = 0;
        try {
            total = Double.parseDouble(total_raw);
            ship = Integer.parseInt(ship_raw);
            item =Integer.parseInt(item_raw);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        VoucherDAO vd = new VoucherDAO();
        Voucher v = vd.getVoucherByCode(code);

        PrintWriter out = response.getWriter();
        double shipping = 0;
        if (total != 0) {
            switch (ship) {
                case 1: {
                    shipping = 20000*item;
                    break;
                }
                case 2: {
                    shipping = 30000*item;
                    break;
                }
                case 3: {
                    shipping = 40000*item;
                    break;
                }
            }

        }
        DecimalFormat decimalFormat = new DecimalFormat("##,###,###.#");
        double finalPrice = total + shipping;
        double discount = 0;
        if (v != null) {
            finalPrice *= (1 - v.getDiscount());
            discount = v.getDiscount() * 100;
        }
        DecimalFormat decimalFormat1 = new DecimalFormat("##.#");
        String discountString = decimalFormat1.format(discount);
        String shippingfee = decimalFormat.format(shipping);
        String totalPrice = decimalFormat.format(total);
        String finalPriceString = decimalFormat.format(finalPrice);
        out.println("<div  class=\"row\">\n"
                + "                            <div class=\"col-7\">Price</div>\n"
                + "                            <input   style=\"padding-bottom: 8px;border: none;background-color: #ddd\" readonly=\"\" class=\"col-5 text-right\" value=\"" + totalPrice + "₫\"/>\n"
                + "\n"
                + "                            </div>\n"
                + "                            <div class=\"row\">\n"
                + "                                <div class=\"col-7\">Shipping fee</div>\n"
                + "                                <input  style=\"padding-bottom: 8px;border: none;background-color: #ddd\" readonly=\"\" class=\"col-5 text-right\" value=\"" + shippingfee + "₫\"/>\n"
                + "                            </div>\n"
                + "                             <div class=\"row\">\n"
                + "                                <div  style=\"color: #de3a3a;\" class=\"col-7\">Discount</div>\n"
                + "                                <input  style=\"color: #de3a3a;;padding-bottom: 8px;border: none;background-color: #ddd\" readonly=\"\" class=\"col-5 text-right\" value=\"" + discountString + "%\"/>\n"
                + "                            </div>\n"
                + "                            <div  class=\"row\">\n"
                + "                                <div   class=\"col-7\">Total Price</div>\n"
                + "                                <input   style=\"padding-bottom: 8px;border: none;background-color: #ddd\" readonly=\"\" class=\"col-5 text-right\" value=\"" + finalPriceString + "₫\"/>\n"
                + "                        </div>");

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
