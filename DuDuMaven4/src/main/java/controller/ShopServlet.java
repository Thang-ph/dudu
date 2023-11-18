/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;
import model.User;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "ShopServlet", urlPatterns = {"/shop"})
public class ShopServlet extends HttpServlet {

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
            out.println("<title>Servlet ShopServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServlet at " + request.getContextPath() + "</h1>");
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
        // giá trị truyền về
        PrintWriter out = response.getWriter();
        String grid_raw = request.getParameter("grid");
        String search = request.getParameter("search");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String minRate_raw = request.getParameter("minRate");
        String maxRate_raw = request.getParameter("maxRate");
        String categoryID_raw = request.getParameter("categoryID");
        String option_raw = request.getParameter("option");
        String xpage = request.getParameter("page");

        // giá trị mặc định
        int categoryID = 0;
        int option = 0;
        int from = 0;
        int to = 0;
        double minRate = 0;
        double maxRate = 5;
        int grid = 9;

        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        List<Product> p = pd.getAllProduct();
        List<Category> c = cd.getAllCategory();
        // số lượng sản phẩm mỗi category
        int countProduct = p.size();
        int[] count = new int[c.size()];
        for (int i = 1; i <= c.size(); i++) {
            count[i - 1] = cd.countCategory(i);
        }

        // ép kiểu
        try {
            grid = Integer.parseInt(grid_raw);
            categoryID = Integer.parseInt(categoryID_raw);
            option = Integer.parseInt(option_raw);
            from = Integer.parseInt(from_raw);
            to = Integer.parseInt(to_raw);
            minRate = Double.parseDouble(minRate_raw);
            maxRate = Double.parseDouble(maxRate_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        // filter
        p = pd.filter(option, from, to, minRate, maxRate, categoryID, search);

        // phân trang
        int page = 1, numperpage = grid;
        int size = p.size();
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
        List<Product> p1 = pd.getListByPage(p, start, end);
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        int n = 0;
        Cart cart = null;
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        if (account != null) {
            cart = new Cart(txt, account.getUserID());
            List<Item> listItem = cart.getItems();
          

            n = listItem.size();
        }

        request.setAttribute("sizeCart", n);
        // truyền giá trị
        request.setAttribute("c", c);
        request.setAttribute("grid", grid);
        request.setAttribute("num", num);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("minRate", minRate);
        request.setAttribute("maxRate", maxRate);
        request.setAttribute("option", option);
        request.setAttribute("p", p1);
        request.setAttribute("countCate", count);
        request.setAttribute("countProduct", countProduct);
        request.setAttribute("page", page);
        request.setAttribute("categoryID", categoryID);
        request.setAttribute("search", search);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
//               out.print(grid);
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

        request.getRequestDispatcher("shop.jsp").forward(request, response);
//PrintWriter out=response.getWriter();
//out.print(from_raw);
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
