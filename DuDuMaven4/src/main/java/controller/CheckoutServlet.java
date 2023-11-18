/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.ShopDAO;
import dal.VoucherDAO;
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
import model.Voucher;

/**
 *
 * @author Pham Thang
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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
        String ship = request.getParameter("ship");
        String code = request.getParameter("code");
        String total = request.getParameter("total");
        String id = request.getParameter("selectedIds");
        String count_raw=request.getParameter("item");
        String[] idArray = id.split(":");
        
        int[] ids = new int[idArray.length];
        int count=0;
        for (int i = 0; i < idArray.length; i++) {
            try {
                ids[i] = Integer.parseInt(idArray[i]);
                count=Integer.parseInt(count_raw);
            } catch (NumberFormatException e) {
            }
        }
        
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
        Map<Shop, List<Item>> itemsByShop = new HashMap<>();
        
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
        int i = 0;
        List<Item> selectedItem = new ArrayList<>();
        for (Shop shop : itemsByShop.keySet()) {
            List<Item> items = itemsByShop.get(shop);
            for (Item item : items) {
                i++;
                for (int j = 0; j < ids.length; j++) {
                    if (i == ids[j]) {
                        selectedItem.add(item);
                    }
                }
            }
        }
//        PrintWriter out=response.getWriter();
//        out.print(selectedItem.get(0).getProduct().getName());
        double shipping = 0;
        String shipper = "";
        switch (ship) {
            case "1": {
                shipping = 20000*count;
                shipper = "Standard-Delivery";
                break;
            }
            case "2": {
                shipping = 30000*count;
                shipper = "Fast-Delivery";
                break;
            }
            case "3": {
                shipping = 40000*count;
                shipper = "Express Delivery";
                break;
            }
        }
        request.setAttribute("id", id);
        VoucherDAO vd = new VoucherDAO();
        Voucher voucher = vd.getVoucherByCode(code);
        int total1 = 0;
        try {
            total1 = Integer.parseInt(total);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        double bill=0;
        if(voucher!=null){
                  bill   = (total1 + shipping) * (1 - voucher.getDiscount());

        }else{
                    bill=total1+shipping;

        }
        request.setAttribute("bill", bill);
        request.setAttribute("shipper", shipper);
        request.setAttribute("voucher", voucher);
        request.setAttribute("code",code);
        request.setAttribute("total", total);
        request.setAttribute("selectedItem", selectedItem);
        request.setAttribute("shipping", shipping);
        request.setAttribute("count", count);
//        PrintWriter out = response.getWriter();
//        out.print(bill);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
