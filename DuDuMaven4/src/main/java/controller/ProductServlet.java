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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Image;
import model.Item;
import model.Product;
import model.User;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
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
        String productID_raw = request.getParameter("productID");
        int productID = 0;
        try {
            productID = Integer.parseInt(productID_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        ProductDAO pd = new ProductDAO();
        Product p = pd.getProductByProductID(productID);
        List<Product> related = pd.getRelatedProduct(p.getShop().getShopID(), productID);
        WarehouseDAO wd = new WarehouseDAO();
        int quantity = wd.getQuantityByID(productID);
        List<String> type = wd.getTypeByID(productID);
        List<String> size = wd.getSizeByID(productID);
        boolean[] t = new boolean[type.size()];
        boolean[] s = new boolean[size.size()];
        for (int i = 0; i < type.size(); i++) {
            if (wd.getQuantityByIDType(productID, type.get(i)) == 0) {
                t[i] = false;
            } else {
                t[i] = true;
            }
        }
        for (int i = 0; i < size.size(); i++) {
            if (wd.getQuantityByIDSize(productID, size.get(i)) == 0) {
                s[i] = false;
            } else {
                s[i] = true;
            }
        }
        // lấy cart
        HttpSession session=request.getSession();
        User account=(User)session.getAttribute("account");
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
        boolean checkType =false;
        boolean checkSize=false;
        if(type.size()!=0){
            checkType=true;
        }
        if(size.size()!=0){
            checkSize=true;
        }
        
        
        
        request.setAttribute("checkType", checkType);
        request.setAttribute("checkSize", checkSize);
        List<Image> listImage=pd.getImageByProductID(productID);
        request.setAttribute("listImage", listImage);
        request.setAttribute("sizeCart", n);
        request.setAttribute("t", t);
        request.setAttribute("s", s);
        request.setAttribute("type", type);
        request.setAttribute("size", size);
        request.setAttribute("quantity", quantity);
        request.setAttribute("related", related);
        request.setAttribute("product", p);
        PrintWriter out = response.getWriter();
//        out.print(checkType+" "+checkSize);
        request.getRequestDispatcher("product.jsp").forward(request, response);

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
