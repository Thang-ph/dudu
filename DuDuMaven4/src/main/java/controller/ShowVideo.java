/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlockDAO;
import dal.videoDAO;
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
import model.Item;
import model.User;
import model.Video;
import model.VideoManage;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ShowVideo", urlPatterns = {"/sv"})
public class ShowVideo extends HttpServlet {

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
            out.println("<title>Servlet ShowVideo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowVideo at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        videoDAO vd = new videoDAO();
        BlockDAO bd = new BlockDAO();
        List<VideoManage> listVideo = vd.getAllVideo();
        User u = (User) session.getAttribute("account");
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
        request.setAttribute("sizeCart", n);
        if (u != null) {
            List<VideoManage> newList = new ArrayList<>();
            for (VideoManage video : listVideo) {
                if(bd.checkBlock(u.getUserID(), video.getUserID())==false) newList.add(video);
            }
            request.setAttribute("listVideo", newList);
            
        }
//        List<String> htmlCodeList = vd.takeurl();
//        request.setAttribute("videoOut", htmlCodeList);
    else
        {
            request.setAttribute("listVideo", listVideo);
        }       
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        videoDAO vd = new videoDAO();
        BlockDAO bd = new BlockDAO();
        List<VideoManage> listVideo = vd.getAllVideo();
        User u = (User) session.getAttribute("account");
        if (u != null) {
            List<VideoManage> newList = new ArrayList<>();
            for (VideoManage video : listVideo) {
                if(bd.checkBlock(u.getUserID(), video.getUserID())==false) newList.add(video);
            }
            request.setAttribute("listVideo", newList);
            
        }
//        List<String> htmlCodeList = vd.takeurl();
//        request.setAttribute("videoOut", htmlCodeList);
    else
        {
            request.setAttribute("listVideo", listVideo);
        }       
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
