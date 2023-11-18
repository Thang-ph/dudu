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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="CRUDProduct", urlPatterns={"/crud"})
public class CRUDProduct extends HttpServlet {
   
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
            out.println("<title>Servlet CRUDProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CRUDProduct at " + request.getContextPath () + "</h1>");
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
        String raw_shop_id = request.getParameter("shopID");
        String search = request.getParameter("search");
        if(search == null){
            search = "";
        }
        String xpage = request.getParameter("page");
        int shop_id = Integer.parseInt(raw_shop_id);
        ProductDAO pd = new ProductDAO();
        List<Product> rlist = pd.searchProductInShop(search, shop_id);
        int count = 0;
        List<Product> list = new ArrayList<>();
        for (int i = rlist.size() - 1; i >= 0; i--) {
            list.add(rlist.get(i));
        }
        for(int i=0;i<list.size();i++){
            count++;
        }
        // phân trang
        int page = 1, numperpage = 5;
        int size = list.size();
        int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
        if (xpage == null) {
            page = 1;
        } else {
            try {
                page = Integer.parseInt(xpage);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> p1 = pd.getListByPage(list, start, end);
        int count2 = 0;
        for(int i=0;i<p1.size();i++){
            count2++;
        }
        int[] allpage = new int[num];
        for(int i=1;i<=num;i++){
            allpage[i-1]=i;
        }
        request.setAttribute("p", p1);
        request.setAttribute("product", list);
        request.setAttribute("count", count);
        request.setAttribute("count2", count2);
        request.setAttribute("shopID", shop_id);
        request.setAttribute("num", allpage);
        request.setAttribute("nummax", num);
        request.setAttribute("page", page);
        request.setAttribute("search", search);
        request.getRequestDispatcher("ProductManager.jsp").forward(request, response);
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
