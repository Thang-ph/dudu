/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ShopDAO;
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

/**
 *
 * @author Pham Thang
 */
@WebServlet(name="DeleteItem", urlPatterns={"/deleteItem"})
public class DeleteItem extends HttpServlet {
   
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
            out.println("<title>Servlet DeleteItem</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteItem at " + request.getContextPath () + "</h1>");
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
         Cookie[] arr=request.getCookies();
        String txt="";
        if(arr!=null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt+=o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String productID=request.getParameter("productID");
        String type=request.getParameter("type");
        String size=request.getParameter("size");
        String[] ids=txt.split("/");
        String out="";
          HttpSession session=request.getSession();
        User account=(User)session.getAttribute("account");
        for(int i=0;i<ids.length;i++){
            String[] s=ids[i].split(":");
            if(s[0].equals(productID)==false||s[1].equals(type)==false||s[2].equals(size)==false||s[4].equals(account.getUserID())){
                if(out.isEmpty()){
                    out=ids[i];
                }else{
                    out+="/"+ids[i];
                }
            }
        }
        if(!out.isEmpty()){
            Cookie c=new Cookie("cart", out);
            c.setMaxAge(2*24*60*60);
            response.addCookie(c);
        } 
         Map<Shop, List<Item>> itemsByShop = new HashMap<>();
        int n=0;
        ShopDAO sd = new ShopDAO();
       Cart cart = new Cart(out, account.getUserID());
        List<Item> listItem = cart.getItems();
        n=listItem.size();
        // tạo 1 map chứa các item
        for (Item item : listItem) {
            Shop s = sd.getShopByID(item.getProduct().getShop().getShopID());

            if (!itemsByShop.containsKey(s)) {
                itemsByShop.put(s, new ArrayList<Item>());
            }

            itemsByShop.get(s).add(item);
        }
         request.setAttribute("sizeCart", n);
          request.setAttribute("itemsByShop", itemsByShop);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("show.jsp").forward(request, response);
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
        processRequest(request, response);
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
