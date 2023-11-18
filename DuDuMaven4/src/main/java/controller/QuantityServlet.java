/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import java.util.List;
import model.Cart;
import model.Item;
import model.User;
import org.json.JSONObject;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "QuantityServlet", urlPatterns = {"/quantity"})
public class QuantityServlet extends HttpServlet {

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
            out.println("<title>Servlet QuantityServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuantityServlet at " + request.getContextPath() + "</h1>");
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
        String productID_raw = request.getParameter("productID");
        String type = request.getParameter("type");
        String size = request.getParameter("size");
        int productID = 0;
        try {
            productID = Integer.parseInt(productID_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        WarehouseDAO wd = new WarehouseDAO();
        List<String> typeList = wd.getTypeByID(productID);
        List<String> sizeList = wd.getSizeByID(productID);
        int stock = wd.getQuantityByIDTypeSize(productID, type, size);

        JSONObject jsonData = new JSONObject();
        boolean[] s = new boolean[sizeList.size()];
        boolean[] t = new boolean[typeList.size()];
        for (int i = 0; i < s.length; i++) {
            if (wd.getQuantityByIDSize(productID, sizeList.get(i)) == 0) {
                s[i] = false;
            } else {
                s[i] = true;
            }
        }

        for (int i = 0; i < t.length; i++) {
            if (wd.getQuantityByIDType(productID, typeList.get(i)) == 0) {
                t[i] = false;
            } else {
                t[i] = true;
            }
        }
        if (size.equals("") && !type.equals("")) {
            stock = wd.getQuantityByIDType(productID, type);
            for (int i = 0; i < sizeList.size(); i++) {
                if (wd.getQuantityByIDTypeSize(productID, type, sizeList.get(i)) == 0) {
                    s[i] = false;
                } else {
                    s[i] = true;
                }
            }
        }
        if (type.equals("") && !size.equals("")) {
            stock = wd.getQuantityByIDSize(productID, size);
            for (int i = 0; i < typeList.size(); i++) {
                if (wd.getQuantityByIDTypeSize(productID, typeList.get(i), size) == 0) {
                    t[i] = false;
                } else {
                    t[i] = true;
                }
            }
        }
        if (!size.equals("") && !type.equals("")) {
            for (int i = 0; i < sizeList.size(); i++) {
                if (wd.getQuantityByIDTypeSize(productID, type, sizeList.get(i)) == 0) {
                    s[i] = false;
                } else {
                    s[i] = true;
                }
            }
            for (int j = 0; j < typeList.size(); j++) {
                if (wd.getQuantityByIDTypeSize(productID, typeList.get(j), size) == 0) {
                    t[j] = false;
                } else {
                    t[j] = true;
                }
            }
        }

        if (size.equals("") && type.equals("")) {
            stock = wd.getQuantityByID(productID);

        }
        jsonData.put("s", s);
        jsonData.put("t", t);

        // lấy cart
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        if (size.equals("") && type.equals("")) {
            stock = wd.getQuantityByID(productID);
        }
        
        int avaiable = stock;

        if (account != null) {
            Cart cart = new Cart(txt, account.getUserID());
            List<Item> listItem = cart.getItems();
            int n = listItem.size();
            if (n > 0) {
                stock -= cart.getQuantityByIdTypeSizeUser(productID, type, size, account.getUserID());
            }
        }
        // gửi dữ liệu bằng json 
        jsonData.put("avaiable", avaiable);

        jsonData.put("stock", stock);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonData.toString());

//    PrintWriter out = response.getWriter();
//    out.println("<span>Quantity in stock: "+stock+"</span>");
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
