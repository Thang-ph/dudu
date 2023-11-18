/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "SearchAjaxServlet", urlPatterns = {"/searchAjax"})
public class SearchAjaxServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchAjaxServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchAjaxServlet at " + request.getContextPath() + "</h1>");
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
       String search= request.getParameter("search");
        ProductDAO pd = new ProductDAO();
        List<Product> list = pd.search(search);
        PrintWriter out = response.getWriter();
        for (Product o : list) {
            out.println(" <div style=\"padding-bottom: 30px;\" class=\"col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 custom-card\">\n"
                    + "                                    <div class=\"card\"> <img class=\"card-img-top\" src=\""+o.getImage()+"\">\n"
                    + "                                        <div class=\"card-body\">\n"
                    + "                                            <h6 class=\"font-weight-bold pt-1\">"+o.getName()+"</h6>\n"
                    + "                                            <div class=\"text-muted description\">"+o.getShop().getName()+"</div>\n"
                    + "                                            <div class=\"d-flex align-items-center product\"> "+o.getRate()+"<span class=\"fas fa-star\"> </span></div>\n"
                    + "                                            <div class=\"d-flex align-items-center justify-content-between pt-3\">\n"
                    + "                                                <div class=\"d-flex flex-column\">\n"
                    + "\n"
                    + "                                                    <div class=\"h6 font-weight-bold\"><fmt:formatNumber pattern=\"###,### ₫\">"+o.getPrice()+"</fmt:formatNumber></div>\n"
                    + "                                                        <!--<div class=\"text-muted rebate\">48.56</div>-->\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"btn btn-primary\"><a href=\"product?productID="+o.getProductID()+"\">Buy now</a></div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "                                </div>");
        }
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
