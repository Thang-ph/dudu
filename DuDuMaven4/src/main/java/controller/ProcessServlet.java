/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.ShopDAO;
import dal.WarehouseDAO;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;
import model.Item;
import model.Shop;
import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "ProcessServlet", urlPatterns = {"/process"})
public class ProcessServlet extends HttpServlet {

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
            out.println("<title>Servlet ProcessServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath() + "</h1>");
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
        List<Product> list = new ArrayList<>();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        Cart cart = new Cart(txt, account.getUserID());
        String num_raw = request.getParameter("num");
        String productID_raw = request.getParameter("productID");
        String type = request.getParameter("type");
        String size = request.getParameter("size");
        int num = 0, productID = 0;
        ProductDAO pd = new ProductDAO();
        WarehouseDAO wd = new WarehouseDAO();

        try {
            productID = Integer.parseInt(productID_raw);
            num = Integer.parseInt(num_raw);
            Product p = pd.getProductByProductID(productID);
            int numStore = wd.getQuantityByIDTypeSizeInCart(productID, type, size);

            if (num == -1 && (cart.getQuantityByIdTypeSizeUser(productID, type, size, account.getUserID()) == 1)) {
                cart.removeItem(productID, type, size, account.getUserID());
            } else {
                if (num == 1 && cart.getQuantityByIdTypeSizeUser(productID, type, size, account.getUserID()) == numStore) {
                    num = 0;
                }
                Item t = new Item(p, type, size, num, account);
                cart.addItem(t);
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        List<Item> items = cart.getItems();
        txt = "";
        if (items.size() > 0) {
            txt = items.get(0).getProduct().getProductID() + ":"
                    + items.get(0).getType() + ":" + items.get(0).getSize() + ":"
                    + items.get(0).getQuantity() + ":" + account.getUserID();
            for (int i = 1; i < items.size(); i++) {
                txt += "/" + items.get(i).getProduct().getProductID() + ":"
                        + items.get(i).getType() + ":" + items.get(i).getSize() + ":"
                        + items.get(i).getQuantity() + ":" + account.getUserID();
            }

        }
        Map<Shop, List<Item>> itemsByShop = new HashMap<>();
        int n = 0;
        ShopDAO sd = new ShopDAO();
        cart = new Cart(txt, account.getUserID());
        List<Item> listItem = cart.getItems();

        // tạo 1 map chứa các item
        for (Item item : listItem) {
            Shop s = sd.getShopByID(item.getProduct().getShop().getShopID());

            if (!itemsByShop.containsKey(s)) {
                itemsByShop.put(s, new ArrayList<Item>());
            }

            itemsByShop.get(s).add(item);
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);
        n = listItem.size();
        request.setAttribute("itemsByShop", itemsByShop);
        request.setAttribute("sizeCart", n);
        request.setAttribute("cart", cart);
        PrintWriter out = response.getWriter();
        request.getRequestDispatcher("show.jsp").forward(request, response);

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
