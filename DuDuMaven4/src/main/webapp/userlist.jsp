<%-- 
    Document   : home
    Created on : Sep 19, 2023, 10:20:43 PM
    Author     : Pham Thang
--%>

<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>DUDU- Do Shop, Do Share</title>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
        <!--        <link rel="stylesheet" href="css/userlist.css"/>-->

        <style>
            .pageHeader
            {
                display: flex;
                align-items: center;
                background-color: #333251;
                border-bottom: 1px solid gray;
                padding: 5px 0;
                color: whitesmoke;
            }
            a {
                text-decoration: none;
                color: black;
            }

            a:hover {
                text-decoration: none;
                color: lightpink;
            }
            .search
            {
                display: flex;
                align-items: center;
                border: 1px solid gray;
                border-radius: 20px;
                background-color: white;
                max-width: 50%;
                margin: auto;
            }

            .search_input
            {
                border: none;
                border-radius: 20px;
                background-color: white;
            }

            .search_input:hover, .search_input:active, .search_input:focus
            {
                border: none;
                box-shadow: none;
                background-color:white;
            }

            .search_icon
            {
                color: #967BB6;
                display: block;
                padding: 10px;
                border-left: 1px solid gray ;
            }
            .btn-default{
                color:lightpink ;
            }
            .btn-danger
            {
                background-color: pink !important;
                border-color: #333251 !important;
            }

            .upload{
                color: white;
            }
            .breadcrumb {
                color: black;
                text-decoration: none;
                background-color: white
            }

            .gray {
                color: gray;
            }

            .breadcrumb a {
                color: black;
            }

            .breadcrumb a:hover {
                color: blue;
                text-decoration: none;
            }
            .button {
                background-color: white;
                color: pink;
                border: 1px solid pink;
                cursor: pointer;
                border-radius: 3px;
            }

            .active {
                background-color: pink;
                color: white;
            }
            .no-spinner::-webkit-inner-spin-button,
            .no-spinner::-webkit-outer-spin-button {
                -webkit-appearance: none;
                appearance: none;
                margin: 0;
            }

            .fa-shopping-bag {
                position: relative;
            }

            .tip {
                position: absolute;
                top: -5px;
                right: -10px;
                background-color: white;
                color: lightpink;
                border-radius: 50%;
                padding: 0px 4px;
                font-size: 13px;
            }

            /* Add this CSS to your stylesheet */

            .body {
                display: flex;
            }

            .userlistsidebar {
                width: 20%;
                padding: 20px;
                background-color: #f0f0f0;
            }

            .form-select {
                width: 100%;
                margin-bottom: 10px;
            }

            .userlistmain {
                width: 80%;
                padding: 20px;
            }

            .discount {
                margin-top: 20px;
            }

            .user-profile {
                margin-bottom: 20px;
                border: 1px solid #ccc;
                padding: 10px;
                border-radius: 5px;
            }

            .user-image {
                max-width: 100%;
                height: auto;
                border-radius: 5px;
            }

            .user-text {
                margin-bottom: 5px;
            }




            .btn-ban {
                background-color: #ff4d4d; /* Change this to the desired background color for the BAN button */
                color: white; /* Text color for the BAN button */
            }

            .btn-unban {
                background-color: #4caf50; /* Change this to the desired background color for the UNBAN button */
                color: white; /* Text color for the UNBAN button */
            }


        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="pageHeader">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <a href="home">
                            <img style="width:  18%;height: auto" src="img/icon.png">
                        </a>
                    </div>
                    <div class="col-sm-6">

                    </div>
                    <div class="col-sm-3">
                        <a  style="color: whitesmoke" href="us" class="upload btn btn-default">Upload</a>

                        <div class="btn btn-default" id="shopping-cart-btn">
                            <a href="shop"> <i style="color: lightpink;" class="fas fa-shopping-cart"></i></a>
                        </div>

                        <%
                            if (session.getAttribute("account") != null) {
                        %>

                        <div class="btn btn-default" id="profile-button">
                            <a href="show"><i style="color: lightpink;" class="fas fa-shopping-bag">
                                    <span class="tip">${requestScope.sizeCart}</span>
                                </i>

                            </a>

                        </div>

                        <a href="userprofile">

                            <div class="btn btn-default" id="profile-button">
                                <i class="fas fa-user"></i>
                            </div>
                        </a>

                        <%
                        } else {
                        %>
                        <a href="login"><div class="btn btn-danger login" >Log In</div></a>
                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="body" >
            <div class="userlistsidebar">
                <form action="userlist" method="post">
                    <select  name="sort" class="form-select" aria-label="Default select example" onchange="this.form.submit()">
                        <c:forEach items="${requestScope.sortlist}" var="s">
                            <c:if test="${requestScope.sorting == s}">
                                <option class="sort" value="${s}" selected>${s}</option>
                            </c:if>
                            <c:if test="${requestScope.sorting != s}">
                                <option class="sort" value="${s}">${s}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <br>
                    <select name="ad" class="form-select" aria-label="Default select example" onchange="this.form.submit()">
                        <c:if test="${requestScope.ading == 'Ascending'}">
                            <option class="sort" value="Ascending" selected>Ascending</option>
                        </c:if>
                        <c:if test="${requestScope.ading != 'Ascending'}">
                            <option class="sort" value="Ascending">Ascending</option>
                        </c:if>
                        <c:if test="${requestScope.ading == 'Descending'}">
                            <option class="sort" value="Descending" selected>Descending</option>
                        </c:if>
                        <c:if test="${requestScope.ading != 'Descending'}">
                            <option class="sort" value="Descending">Descending</option>
                        </c:if>
                    </select>
                </form>
            </div>
            <div class="userlistmain">
                <c:if test = "${requestScope.searching != null}">
                    <h4 style="margin: 40px; color: whitesmoke ">Searching for: ${requestScope.searching}</h4>
                </c:if>
                <div class="discount">
                    <div><h2 class="userlist-header">User List</h2></div>
                    <c:forEach items="${requestScope.userlist}" var="u">
                        <div class="user-profile">
                            <div class="row" >
                                <div class="col-md-3"><img src="${u.avatar}" class="user-image d-block w-100" alt="..."></div>
                                <div class="col-md-5">
                                    <!--<p class="user-text">Full name: ${u.firstname} ${u.lastname}</p>-->
                                    <h3 class="user-text">User name: ${u.username}</h3>
                                    <%
                                        Map<Integer, Integer> count = (Map<Integer, Integer>) request.getAttribute("count");
                                    %>

                                    <c:forEach var="entry" items="${count}">
                                        <c:if test="${entry.key == u.userID}">
                                            <p>User ID ${entry.key} be blocked by ${entry.value}.</p>
                                        </c:if>
                                    </c:forEach>
                                <!--                                    <p class="user-text">Email: ${u.email}</p>
                                                                    <p class="user-text">Phone: ${u.phone}</p>
                                                                    <p class="user-text">Address: ${u.address}</p>
                                                                    <p class="user-text">Gender: ${u.gender}</p>-->
                                </div>
                                <div class="col-md-4">
                                    <c:if test="${u.role == 1 || u.role == 2}">
    <form id="banForm" action="ban" method="get" onsubmit="return confirmBan()">
        <div><input name="id" value="${u.userID}" style="visibility: hidden"></div>
        <button name="ban" value="ban" style="width: 150px; margin:30px 50px 100px" class="btn btn-ban" type="submit">
            <strong>BAN</strong>
            <div id="container-stars">
                <div id="stars"></div>
            </div>

            <div id="glow">
                <div class="circle"></div>
                <div class="circle"></div>
            </div>
        </button>
    </form>
</c:if>
<c:if test="${u.role == 3 || u.role == 4}">
    <form id="unbanForm" action="ban" method="get" onsubmit="return confirmUnban()">
        <div><input name="id" value="${u.userID}" style="visibility: hidden"></div>
        <button name="ban" value="unban" style="width: 150px; margin:30px 50px 100px" class="btn btn-unban" type="submit">
            <strong>UNBAN</strong>
            <div id="container-stars">
                <div id="stars"></div>
            </div>

            <div id="glow">
                <div class="circle"></div>
                <div class="circle"></div>
            </div>
        </button>
    </form>
</c:if>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
        <script>
    function confirmBan() {
        return confirm("Bạn có chắc chắn muốn ban người dùng này không?");
    }

    function confirmUnban() {
        return confirm("Bạn có chắc chắn muốn unban người dùng này không?");
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>

