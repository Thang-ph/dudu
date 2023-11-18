<%-- 
    Document   : home
    Created on : Sep 19, 2023, 10:20:43 PM
    Author     : Pham Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.User" %>
<%@ page import="dal.CommentDAO" %>
<%@ page import="model.Comment" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Du Du - Do Shop, Do Share</title>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
        <link rel="stylesheet" href="css/home.css"/>

        <style>
            body{

            }
            .reactbutton{
                border-top-right-radius: 20px;
                border-bottom-right-radius: 20px;

            }
            .outboxmedia{
                background-color: #333251;
                padding:40px;
                border-radius:20px;
                margin: 20px;
            }
            .inboxmedia{
                display: flex;
                flex-direction: column;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body >

        <div class="pageHeader">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <a href="sv">
                            <img width="18%" src="img/new.png">
                        </a>
                    </div>
                    <div class="col-sm-6">
                        <div class="search">
                            <input type="text" class="search_input form-control" placeholder="Search ">
                            <span class="search_icon">
                                <i class="fas fa-search"></i>
                            </span>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <a href="us" class="upload btn btn-default">Upload</a>
                        <%
                        } else {
                        %>

                        <%
                            }
                        %>

                        <a href="shop">
                            <div class="btn btn-default" id="shopping-cart-btn">
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                        </a>
                        <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <a href="userprofile">
                            <div class="btn btn-default" id="profile-button">
                                <i class="fas fa-user"></i>
                            </div>
                        </a>
                        <%
                        } else {
                        %>

                        <%
                            }
                        %>


                        <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <div class="btn btn-danger login" >
                            <h6><a href="userprofile?userID=${sessionScope.account.userID}">${sessionScope.account.username}</a></h6>
                        </div>
                        <%
                        } else {
                        %>
                        <a href="login"><div class="btn btn-danger" ><div>Login</div></div></a>
                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-3" >
            <div class="row" style="flex-wrap: nowrap;padding:10px; ">
                <div class="col-sm-3" style="background-color: #333251;border-radius:20px;margin: 20px;padding: 20px;">
                    <div>  
                        <div class="button-container">
                            <a href="sv">
                                <button class="button" >
                                    <i class="fas fa-home"></i>
                                </button>
                            </a>
                            <button class="button">
                                <i  class="fas fa-user-friends"></i>
                            </button>
                            <button class="button">
                                <i class="fa fa-compass" aria-hidden="true"></i>
                            </button>
                            <%
                                User account = (User) session.getAttribute("account");
                                if (account != null && account.getRole() == 2) { %>
                            <a href="shopManage?userID=${sessionScope.account.userID}" >
                                <button class="button">
                                    <i class="fas fa-store-alt"></i>
                                </button>
                            </a>

                            <%
                                }
                            %>



                            <%
                                if (account != null && account.getRole() == 0) { %>
                            <a href="userlist">
                                <button class="button">
                                    <i class="fas fa-shopping-cart"></i>
                                </button>
                            </a>

                            <%}%>


                        </div>



                    </div>

                    <hr class="my-5">
                    <div>
                        <p>Log in to follow creators, like videos, and view comments.</p>


                        <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <b><a  href="logout" style="color: whitesmoke"><div  class="btn btn-outline-danger w-100 p-2">Logout</div></a> </b>
                        <%
                        } else {
                        %>
                        <b><a  href="login" style="color: whitesmoke"><div  class="btn btn-outline-danger w-100 p-2">Login</div></a></b>
                        <%
                            }
                        %>


                    </div>


                    <div>
                        <div class="d-flex align-items-center justify-content-between">
                            <span>Discover</span>
                        </div>
                        <div style="color: whitesmoke">
                            <span class="badge rounded-pill border border-secondary m-2"># messigoat</span>
                            <span class="badge rounded-pill border border-secondary  m-2"># T1vodich</span>
                            <span class="badge rounded-pill border border-secondary m-2"><i class="fas fa-music"></i> Để anh một mình - Rhyder</span>
                            <span class="badge rounded-pill border border-secondary  m-2"><i class="fas fa-music"></i> Vương - Nger </span>
                        </div>
                    </div>
                    <hr>
                    <div>
                        &copy; 2023 DuDu
                    </div>
                </div>

                <div class="outboxmeida" style="background-color: #333251;padding:40px 15px 40px 15px;border-radius:20px;margin: 20px;max-width: 800px ">
                    <div class="inboxmedia">

                        <c:forEach var="v" items="${listVideo}">
                            
                            
                                Hashtag: ${v.hashtag}
                                <div class="video-container" id="videoContainer_${v.hashtag}">
                                    <!-- Placeholder for videos -->
                                </div>
                            
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                            <script>
                                // JavaScript code to make AJAX request to the servlet
                                var hashtag = "${v.hashtag}";
                                var containerId = "videoContainer_" + hashtag;
                                var container = document.getElementById(containerId);
                                var xhr = new XMLHttpRequest();
                                xhr.open("POST", "ds?hashtag=" + hashtag, true);
                                xhr.onreadystatechange = function () {
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                        var response = JSON.parse(xhr.responseText);

                                        // Process the response to display videos
                                        for (var i = 0; i < response.length; i++) {
                                            var video = response[i];
                                            var videoElement = document.createElement("video");
                                            videoElement.controls = true;
                                            videoElement.style.maxWidth = "200px";
                                            videoElement.style.height = "auto";
                                            var sourceElement = document.createElement("source");
                                            sourceElement.src = video.videourl;
                                            sourceElement.type = "video/mp4";
                                            videoElement.appendChild(sourceElement);
                                            container.appendChild(videoElement);
                                        }
                                    }
                                };
                                xhr.send();
                            </script>
                        </c:forEach>
                    </div>
                </div>



            </div>
        </div>

    </div>
</div>









</body>
</html>