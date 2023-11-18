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
import java.text.DecimalFormat;
import java.util.List;
import model.Category;
import model.Image;
import model.Shop;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/updatep"})
@MultipartConfig()
public class UpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet UpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath() + "</h1>");
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
        String raw_product_id = request.getParameter("id");
        String page = request.getParameter("page");
        int product_id = Integer.parseInt(raw_product_id);
        ProductDAO pd = new ProductDAO();
        ShopDAO s = new ShopDAO();
        CategoryDAO c = new CategoryDAO();
        List<Shop> shoplist = s.getAllShop();
        List<Category> category = c.getAllCategory();
        List<Image> image = pd.getImageByProductID(product_id);
        Product p = pd.getProductByProductID(product_id);
        request.setAttribute("image", image);
        request.setAttribute("imagenum", image.size());
        request.setAttribute("product", p);
        request.setAttribute("shopID", p.getShop().getShopID());
        request.setAttribute("shoplist", shoplist);
        request.setAttribute("page", page);
        request.setAttribute("category", category);
        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
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
        String page = request.getParameter("page");
        String raw_product_id = request.getParameter("id");
        String raw_category_id = request.getParameter("category");
        String raw_shop_id = request.getParameter("shop");
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");
        String raw_price = request.getParameter("price");
        Part part = request.getPart("image");
        int product_id = Integer.parseInt(raw_product_id);

        Product p = pd.getProductByProductID(product_id);
        String validate = "";
        if (detail.trim().isEmpty() || name.trim().isEmpty() || raw_price.trim().isEmpty()) {
            validate += "can not updated because ";
        }
        if (name.trim().isEmpty()) {
            validate += "name";
        }
        if (detail.trim().isEmpty()) {
            validate += " detail";
        }
        if (raw_price.trim().isEmpty()) {
            validate += " price";
        }
        if (detail.trim().isEmpty() || name.trim().isEmpty() || raw_price.trim().isEmpty()) {
            validate += " was empty";
            ShopDAO s = new ShopDAO();
            CategoryDAO c = new CategoryDAO();
            List<Shop> shoplist = s.getAllShop();
            List<Category> category = c.getAllCategory();
            List<Image> image = pd.getImageByProductID(product_id);
            request.setAttribute("image", image);
            request.setAttribute("imagenum", image.size());
            request.setAttribute("product", p);
            request.setAttribute("page", page);
            request.setAttribute("shopID", raw_shop_id);
            request.setAttribute("shoplist", shoplist);
            request.setAttribute("category", category);
            request.setAttribute("validate", validate);
            request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
        }
        try {
            String realPath = request.getServletContext().getRealPath("/img");
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            if (!filename.isEmpty()) {
                p.setImage("img/" + filename);
                part.write(realPath + "/" + filename);
            } else {
                //PrintWriter out = response.getWriter()
                //out.print(realPath);
            }
        } catch (Exception e) {
        }
        int category_id = 0;
        if (raw_category_id != null) {
            category_id = Integer.parseInt(raw_category_id);
        }
        double price = 0;
        if (raw_price != null) {
            price = Double.parseDouble(raw_price);
        }
        int shop_id = 0;
        if (raw_shop_id != null) {
            shop_id = Integer.parseInt(raw_shop_id);
        }

        p.setCategory(cd.getCategoryByID(category_id));
        p.setShop(sd.getShopByID(shop_id));
        p.setName(name);
        p.setPrice(price);
        p.setDetail(detail);
        p.setProductID(product_id);
        pd.UpdateProduct(p);

        String raw_imagenum = request.getParameter("imagenum");
        int imagenum = Integer.parseInt(raw_imagenum);
        String[] raw_delete_old_image = request.getParameterValues("oldimgID");
        List<Image> old_image = pd.getImageByProductID(product_id);
        if (raw_delete_old_image != null) {
            int[] delete_old_image = new int[raw_delete_old_image.length];
            for (int i = 0; i < raw_delete_old_image.length; i++) {
                delete_old_image[i] = Integer.parseInt(raw_delete_old_image[i]);
            }
            for (int i = 0; i < old_image.size(); i++) {
                int found = 0;
                for (int j = 0; j < delete_old_image.length; j++) {
                    if (delete_old_image[j] == old_image.get(i).getImageID()) {
                        found = 1;
                        break;
                    }
                }
                if (found == 0) {
                    pd.DeleteImageByImageID(old_image.get(i).getImageID());
                }
            }
        } else {
            pd.DeleteImageByProductID(product_id);
        }
        for (int i = 2; i <= imagenum + 1; i++) {
            try {
                String oldsubimageID = request.getParameter("oldimgID" + i);
                Image img = pd.GetImageByImageID(Integer.parseInt(oldsubimageID));
                Part subpart = request.getPart("newsubimage" + i);
                String realPath = request.getServletContext().getRealPath("/img");
                String filename = Paths.get(subpart.getSubmittedFileName()).getFileName().toString();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectory(Paths.get(realPath));
                }
                //out.print(realPath);
                if (!filename.isEmpty()) {
                    img.setProduct(p);
                    img.setImage("img/" + filename);
                    subpart.write(realPath + "/" + filename);
                    pd.UpdateImage(img);
                } else {

                }
            } catch (Exception e) {
            }
        }

        for (int i = 2; i <= 10; i++) {
            try {
                Image img = new Image();
                Part subpart = request.getPart("subimage" + i);
                String realPath = request.getServletContext().getRealPath("/img");
                String filename = Paths.get(subpart.getSubmittedFileName()).getFileName().toString();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectory(Paths.get(realPath));
                }
                //out.print(realPath);
                if (!filename.isEmpty()) {
                    img.setProduct(p);
                    img.setImage("img/" + filename);
                    subpart.write(realPath + "/" + filename);
                    pd.AddImage(img);
                }
            } catch (Exception e) {
            }
        }
        response.sendRedirect("crud?shopID=" + raw_shop_id + "&page=" + page);
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
