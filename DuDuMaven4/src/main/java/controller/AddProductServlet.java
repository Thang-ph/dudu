/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.ShopDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Image;
import model.Product;
import model.Shop;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddProductServlet", urlPatterns = {"/addp"})
@MultipartConfig()
public class AddProductServlet extends HttpServlet {

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
            out.println("<title>Servlet AddProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductServlet at " + request.getContextPath() + "</h1>");
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
        String raw_shop_id = request.getParameter("shopID");
        int shop_id = Integer.parseInt(raw_shop_id);
        ShopDAO s = new ShopDAO();
        CategoryDAO c = new CategoryDAO();
        List<Shop> shoplist = s.getAllShop();
        List<Category> category = c.getAllCategory();
        request.setAttribute("shopID", shop_id);
        request.setAttribute("shoplist", shoplist);
        request.setAttribute("category", category);
        request.getRequestDispatcher("AddProduct.jsp").forward(request, response);

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
        CategoryDAO cd = new CategoryDAO();
        ShopDAO sd = new ShopDAO();
        ProductDAO pd = new ProductDAO();
        Product p = new Product();
        String raw_category_id = request.getParameter("category");
        String raw_shop_id = request.getParameter("shop");
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");
        String raw_price = request.getParameter("price");
        Part part = request.getPart("image");
         int category_id, shop_id, price;
        try {
            String realPath = request.getServletContext().getRealPath("/img");
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            if (!filename.isEmpty()) {
                if (check(part) == false) {
                    ShopDAO s = new ShopDAO();
                    CategoryDAO c = new CategoryDAO();
                    List<Category> category = c.getAllCategory();
                    List shoplist = s.getAllShop();
                    request.setAttribute("shopID", raw_shop_id);
                    request.setAttribute("shoplist", shoplist);
                    request.setAttribute("category", category);
                    request.setAttribute("validateimg", "image must be .jpg or .png");
                    request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
                } else {
                    p.setImage("img/" + filename);
                    part.write(realPath + "/" + filename);
                }
            }
            //////////////

            category_id = Integer.parseInt(raw_category_id);

            shop_id = Integer.parseInt(raw_shop_id);


            price = Integer.parseInt(raw_price);

        p.setCategory(cd.getCategoryByID(category_id));
        p.setShop(sd.getShopByID(shop_id));
        p.setName(name);
        p.setPrice(price);
        p.setDetail(detail);
        int newid = pd.AddNewProduct(p);
        for (int i = 2; i <= 10; i++) {
            try {
                Image img = new Image();
                Part subpart = request.getPart("subimage" + i);
                 realPath = request.getServletContext().getRealPath("/img");
                filename = Paths.get(subpart.getSubmittedFileName()).getFileName().toString();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectory(Paths.get(realPath));
                }
                //out.print(realPath);
                if (!filename.isEmpty()) {
                        img.setProduct(pd.getProductByProductID(newid));
                        img.setImage("img/" + filename);
                        subpart.write(realPath + "/" + filename);
                        pd.AddImage(img);
                }
            } catch (ServletException | IOException e) {
            }
        }  
            
            
        } catch (Exception e) {
        }
        
        response.sendRedirect("crud?shopID=" + raw_shop_id);
    }

    public boolean check(Part p) {
        String check = p.getSubmittedFileName();
        if (!check.endsWith(".png") && !check.endsWith(".jpg")) {
            return false;
        } else {
            return true;
        }
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