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
@WebServlet(name = "PayServlet", urlPatterns = {"/pay"})
public class PayServlet extends HttpServlet {

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
            out.println("<title>Servlet PayServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");
        String shipper = request.getParameter("shipper");
        String code=request.getParameter("code");
        String count_raw=request.getParameter("count");
        String bill_raw = request.getParameter("bill");
        double bill = 0,count=0;
        try {
            count=Integer.parseInt(count_raw);
            bill = Double.parseDouble(bill_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        String[] idArray = id.split(":");

        int[] ids = new int[idArray.length];

        for (int i = 0; i < idArray.length; i++) {
            try {
                ids[i] = Integer.parseInt(idArray[i]);
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
            // Duyệt danh sách items để in ra
            for (Item item : items) {
                i++;
                for (int j = 0; j < ids.length; j++) {
                    if (i == ids[j]) {
                        selectedItem.add(item);
                    }
                }
            }
        }
        OrderDAO od = new OrderDAO();
//        PrintWriter out=response.getWriter();
//        out.print(selectedItem.get(0).getProduct().getName()+" "+selectedItem.get(0).getQuantity()+" "+selectedItem.get(0).getType()+" "+selectedItem.get(0).getSize());
       VoucherDAO vd=new VoucherDAO();
       Voucher v=vd.getVoucherByCode(code);
       double discount=0;
       if(v!=null){
           discount=v.getDiscount();
       }
od.createOrder(account, address, note, selectedItem, shipper, bill, phone,discount);
//        PrintWriter out = response.getWriter();
//        out.print(account.getUserID()+"-"+address+"-"+note+"-"+selectedItem.get(0).getProduct().getName()+"-"+shipper+"-"+bill+"-"+phone);
        // xóa item đi ở trong cart
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        List<Item> items = cart.getItems();
        txt = "";
        if (items.size() > 0) {
            txt = items.get(0).getProduct().getProductID() + ":"
                    + items.get(0).getType() + ":" + items.get(0).getSize() + ":"
                    + items.get(0).getQuantity() + ":" + account.getUserID();
            for (int j = 1; j < items.size(); j++) {
                txt += "/" + items.get(j).getProduct().getProductID() + ":"
                        + items.get(j).getType() + ":" + items.get(j).getSize() + ":"
                        + items.get(j).getQuantity() + ":" + account.getUserID();
            }

        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);

        for (Item item : selectedItem) {
            String delete = item.getProduct().getProductID() + ":";
            if (item.getType() == null || item.getType().equals("")) {
                delete += ":";
            } else {
                delete += item.getType() + ":";
            }
            if (item.getSize() == null || item.getSize().equals("")) {
                delete += ":";
            } else {
                delete += item.getSize() + ":";
            }
            delete += item.getQuantity() + ":" + account.getUserID();
            int index = txt.indexOf(delete);
            if (index != -1) {
                if (index > 0 && txt.charAt(index - 1) == '/') {
                    txt = txt.substring(0, index - 1) + txt.substring(index + delete.length());
                } else {
                    txt = txt.substring(0, index) + txt.substring(index + delete.length());
                }
                if (txt.startsWith("/")) {
                    txt = txt.substring(1);
                }

                if (txt.endsWith("/")) {
                    txt = txt.substring(0, txt.length() - 1);
                }
            }
        }
        Cookie c1 = new Cookie("cart", txt);
        c1.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c1);
        response.sendRedirect("bill");

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
