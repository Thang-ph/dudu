
<%-- 
    Document   : upload
    Created on : Sep 19, 2023, 10:39:15 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %> 
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>DUDU - Do Shop, Do Share</title>
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/froala-editor@latest/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
        <link rel="stylesheet" href="css/upload.css"/>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@latest/js/froala_editor.pkgd.min.js"></script>

        <div class="uploadheader">
            <a href="home">
                <div>
                    <img class="icon" src="img/icon.png" alt="alt"/>
                </div>
            </a>
            <p>
                DUDU
            </p>

            <p>
                CREATOR CENTER
            </p>

        </div>
        <hr>
        <div class="body" >
            <div class="uploadsidebar">
                <div>
                    <a href="us" style="text-decoration: none;">
                        <button class="btn" type="button" > 
                            <strong>UPLOAD</strong>
                            <div id="container-stars">
                                <div id="stars"></div>
                            </div>

                            <div id="glow">
                                <div class="circle"></div>
                                <div class="circle"></div>
                            </div>
                        </button>
                    </a>
                    <a href="uhs" style="text-decoration: none;">
                        <div class="sidebutton"  >
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                            <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
                            </svg>
                            HOME
                        </div>
                    </a>
                    <a href="um" style="text-decoration: none;">
                        <div class="sidebutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                            </svg>
                            POST
                        </div>
                    </a>
                    <a href="ufs" style="text-decoration: none;">
                        <div class="sidebutton">

                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                            <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
                            </svg>
                            FOLOWER
                        </div>
                    </a>
                    <div class="sidebutton">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-left-dots-fill" viewBox="0 0 16 16">
                        <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm5 4a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                        </svg>
                        FEEDBACK
                    </div>
                </div>

            </div>

            <div class="uploadmain" style="justify-content: center">
                <div>Upload</div>
                <form action="Upload" method="post" enctype="multipart/form-data">
                    <div class="input-box">
                        <span class="details">Tiltle</span>
                        <input type="text" name="title" required>
                    </div>
                    <div class="input-box">Video
                        <input type="file" name="file">
                        
                    </div>
                    <div class="input-box">
                        <span class="details">HASTAG</span>
                        <input type="text" name="hashtag" required>
                    </div>
                    <input type="hidden" name="userID" value="${sessionScope.account.userID}">
                    <%
                        User account = (User) session.getAttribute("account");
                        if (account != null && account.getRole() == 2) {
                    %>
                    <input type="checkbox" name="pidcheck" value="yes" style="margin: 10px" >Add Product Link to this video
                    <select id="productID" onchange="getSelectedProductID()">
                        <option value="">Chọn sản phẩm</option>
                        <c:forEach items="${requestScope.p}" var="p">
                            <option name="productID" value="${p.productID}">
                                ${p.productID}.${p.name}
                            </option>
                        </c:forEach>
                    </select>
                    <input type="hidden" id="selectedProduct" name="selectedProduct">

                    <%
                        }
                    %>

                    <%
                        if (account != null && account.getRole() == 0) {
                    %>
                    <%-- Your code for role 0 --%>
                    <%
                        }
                    %>
                    <input type="submit" value="Upload">
                </form>
                <div>

                </div>

            </div>

        </div>
        <script>
            function getSelectedProductID() {
                var select = document.getElementById("productID");
                var productID = select.options[select.selectedIndex].value;
                document.getElementById("selectedProduct").value = productID;
            }
        </script>
    </body>
</html>
