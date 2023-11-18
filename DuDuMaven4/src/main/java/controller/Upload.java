/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.auth.oauth2.ServiceAccountCredentials;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import dal.videoDAO;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Part;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 100,maxRequestSize = 1024 * 1024 * 100 * 5)


@WebServlet(name = "Upload", urlPatterns = {"/Upload"})
public class Upload extends HttpServlet {

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
            out.println("<title>Servlet Upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Upload at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String pathToJSON = getServletContext().getRealPath("/jsonkey/influential-rex-392710-94e82db3dc76.json");

        Storage storage = StorageOptions.newBuilder()
                
        .setCredentials(ServiceAccountCredentials.fromStream(new FileInputStream(pathToJSON)))
                .build().getService();

        Part filePart = request.getPart("file");

        String gcsBucketName = "dudu-bucket"; // Thay your-bucket-name bằng tên bucket của bạn
        String originalFileName = filePart.getSubmittedFileName();
        String gcsObjectKey = "video/" + UUID.randomUUID() + "_" + originalFileName;

        BlobInfo blobInfo = BlobInfo.newBuilder(gcsBucketName, gcsObjectKey).build();
        storage.create(blobInfo, filePart.getInputStream());
        // Lấy thêm thông tin từ yêu cầu HTTP
        String uid = request.getParameter("userID");
        String title = request.getParameter("title");
        String hashtag = request.getParameter("hashtag");
        String checkpid = request.getParameter("pidcheck");
        String productID = request.getParameter("selectedProduct");
        int uID = Integer.parseInt(uid);

        // Lấy URL của video vừa upload
        String videoURL = storage.get(blobInfo.getBlobId()).getMediaLink();

        videoDAO vd = new videoDAO();

        // Kiểm tra nếu checkpid khác null thì có productID
        if (checkpid != null) {
            int pID = Integer.parseInt(productID);
            vd.uploadwithlink(title, videoURL, hashtag, uID, pID);
        } else {
            vd.upload(title, videoURL, hashtag, uID);
        }

        response.sendRedirect("sv");
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
