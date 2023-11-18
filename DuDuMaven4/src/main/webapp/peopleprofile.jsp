<%-- 
Document   : main
Created on : Sep 20, 2023, 1:39:01 AM
Author     : PC
--%>
<%@ page import="model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>DuDu - OthersUser</title>

        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/profile.css"/>
        <link rel="stylesheet" href="css/peopleprofile.css"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.7);
                border-radius: 10px; /* Điều này sẽ làm tròn viền của khung div */

            }

            .popup-content {
                background-color: #fff;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 20%;
                height: 55%;
                border-radius: 10px; /* Điều này sẽ làm tròn viền của nội dung bên trong */

            }

            .scroll
            {
                background-color: #fff;
                height: 80%;
                overflow-x:hidden;
                overflow-y:auto;

            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
            }

            ul {
                list-style: none;
                padding: 0;
            }

            li {
                margin-bottom: 10px;
            }
            ul li h5 {
                margin-left: 10px; /* Tạo khoảng cách giữa hình ảnh và h5 */
                overflow: hidden; /* Đảm bảo không vượt quá độ dài của ảnh */
                white-space: nowrap; /* Ngăn h5 xuống dòng nếu quá dài */
                text-overflow: ellipsis; /* Hiển thị dấu ba chấm (...) nếu quá dài */
            }





            /* CSS cho nút "Block" bên trong cửa sổ cảnh báo */


            .confirmation-box {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: white;
                border: 1px solid purple;
                padding: 20px;
                text-align: center;
                z-index: 999;
            }

            .cancel-button {
                margin: 10px;
                padding: 10px 20px;
                cursor: pointer;
                background-color: #ccc;
                color: #000;
                border: 1px solid #ccc;
            }
        </style>
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
                        <div class="search">
                            <input type="text" class="search_input form-control" placeholder="Search ">
                            <span class="search_icon">
                                <i class="fas fa-search"></i>
                            </span>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a  style="color: whitesmoke" href="us" class="upload btn btn-default">Upload</a>

                        <div class="btn btn-default" id="shopping-cart-btn">
                            <a href="shop"> <i style="color: lightpink;" class="fas fa-shopping-cart"></i></a> 
                        </div>

                        <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <a href="userprofile">
                            <div class="btn btn-default" id="profile-button">
                                <i class="fas fa-user"></i>
                            </div>
                        </a>
                        <div class="btn btn-danger login" >
                            <h6><a href="userprofile?userID=${sessionScope.account.userID}">${sessionScope.account.username}</a></h6>
                        </div>
                        <%
                        } else {
                        %>
                        <a href="login.jsp"><div class="btn btn-danger login" >Log In</div></a>
                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>

        <c:if test="${requestScope.mess==null}">               

                            <a href="sv" style="text-decoration: none; color: purple; padding-left: 100px">Home</a>/ <a href="userprofile" style="text-decoration: none; color: purple;padding-left: 5px">User Profile</a>
            <main>
                <div class="container">
                    <div class="row m-b-r m-t-3">
                        <div class="col-md-2 offset-md-1">
                            <img style="width: 150px; height: 150px; border-radius: 50%;" src="${requestScope.people.avatar}" alt="" class="img-circle img-fluid">
                        </div>
                        <div class="col-md-9 p-t-2">
                            <div style="display: flex">
                                <h2 class="h2-responsive" style="padding-right: 20px">${requestScope.people.username} </h2>
                                <%if (session.getAttribute("account") == null){}
                                else{%>
                                <form action="follow">
                                    <input type="hidden" name="follow1" value="${requestScope.followornot}"/>
                                    <input type="hidden" name="userID" value="${requestScope.people.userID}"/>
                                    <button style="color: purple;border: 1px solid purple;" type="submit" class="btn btn-info-outline waves-effect" value="">${requestScope.followornot}</button>
                                </form>
                                 

                                <button id="blockButton" class="btn btn-info-outline waves-effect" onclick="showConfirmation()">${requestScope.blockstatus}</button>
                                <div id="confirmationBox" class="confirmation-box">
                                    <p>Are you sure you want to ${requestScope.blockstatus} this user?</p>
                                    <form id="blockForm" action="block">
                                        <input type="hidden" name="blockstatus" value="${requestScope.blockstatus}">
                                        <input type="hidden" name="userID" value="${requestScope.people.userID}" />
                                        <button type="submit" class="btn btn-info-outline waves-effect" style="color: red;">${requestScope.blockstatus}</button>
                                    </form>
                                    <button class="cancel-button" onclick="cancelBlock()">Cancel</button>
                                </div>
                            <%}%>

                            </div>
                            <p>${requestScope.people.firstname } ${requestScope.people.lastname}</p>

                            <ul class="flex-menu">
                                <h6 style="margin-top: 8px; margin-right: 10px"><strong>${requestScope.videosize}</strong> Videos</h6>
                                <button type="button" class="btn btn-info-outline waves-effect" id="showFollowersButton" ><strong>${requestScope.tottalfollowers}</strong> followers</button>
                                <button type="button" class="btn btn-info-outline waves-effect" id="showFollowingButton"><strong>${requestScope.tottalfollowing}</strong> following</button>
                            </ul>
                        </div>
                    </div>
                    <hr>  

                    <div class="row">
                        <c:if test="${requestScope.videosize==0}">
                            <h3 style="text-align: center; color: gray">This User Haven't Upload Any Video!</h3>
                        </c:if>
                        <c:forEach items="${requestScope.listVideo}" var="v">
                            <div class="col-sm-12 col-md-6 col-lg-4">
                                <div class="view overlay hm-black-light m-b-2" >
                                    <div style="align-items: center">
                                        <div >
                                            <div >
                                                <!-- img class="suggestedAccountIcon" src="img/avatar.png">-->
                                                <h3 style="color: purple;text-align: center">${v.title}</h3>
    <!--                                        <small style="color:  #F5F5F5">${v.title} <span style="color: lightskyblue">#TRENDING</span></small>-->
                                            </div>
                                        </div>
                                        <div >
                                            <div>
                                                <video controls style="width: 420px; height: 420px">
                                                    <source src="${v.videourl}" type="video/mp4">
                                                </video>
                                            </div>

                                        </div>



                                        <c:if test="${not empty v.productname}">
                                            <div class="productbox" style="margin-top: 20px;background-color: #403F66;padding: 10px;border-radius: 20px;">
                                                Product In Video : 
                                                <a href="product?productID=${v.productID}" style="text-decoration: none;border-radius: 20px;">
                                                    <div style="background-color: #7291ac;border-radius: 20px;padding:10px 50px 10px 10px;">
                                                        <img src="${v.productimg}" width="50px" height="50px" style="border-radius:10px" />
                                                        ${v.productname}
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                        <hr >
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </main>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span class="close" id="closePopup">&times;</span>
                    <h2 style="text-align: center;">Following</h2>
                    <hr/>
                    <h4 style="color: gray; text-align: center;">${requestScope.nofollowing}</h4>
                    <div class="scroll">
                        <ul>
                            <c:forEach items="${requestScope.listoffollowing}"  var="ing">
                                <li style="display: flex;align-items: center;"> <img style=" border-radius: 50%;width: 44px; height: 44px" src="${ing.avatar}">
                                    <div class="info" style="margin-top: 17px; margin-left: 18px;">
                                        <c:if test="${ing.userID == sessionScope.account.userID}">
                                            <a href="userprofile?userID=${sessionScope.account.userID}" style="text-decoration: none;">
                                                <h6 style="margin-bottom: 0; color: #000">${ing.username}</h6>
                                            </a>
                                        </c:if>
                                        <c:if test="${ing.userID != sessionScope.account.userID}">
                                            <a href="peopleprofile?userID=${ing.userID}" style="text-decoration: none;">
                                                <h6 style="margin-bottom: 0; color: #000">${ing.username}</h6>
                                            </a>
                                        </c:if>
                                        <p style="color: gray"> ${ing.firstname} ${ing.lastname }</p>
                                    </div>
                                </li>
                            </c:forEach>    
                        </ul>
                    </div>
                </div>
            </div>


            <div id="popup2" class="popup">
                <div class="popup-content">
                    <span class="close" id="closePopup2">&times;</span>
                    <h2 style="text-align: center;">Followers</h2>
                    <hr/>
                    <h4 style="color: gray; text-align: center;">${requestScope.nofollowers}</h4>
                    <div class="scroll">
                        <ul>
                            <c:forEach items="${requestScope.listoffollowers}" var="ers">
                                <li style="display: flex; align-items: center;">
                                    <img style="border-radius: 50%; width: 44px; height: 44px" src="${ers.avatar}">
                                    <div class="info" style="margin-top: 17px; margin-left: 18px;">
                                        <c:if test="${ers.userID == sessionScope.account.userID}">
                                            <a href="userprofile?userID=${sessionScope.account.userID}" style="text-decoration: none;">
                                                <h6 style="margin-bottom: 0; color: #000">${ers.username}</h6>
                                            </a>
                                        </c:if>
                                        <c:if test="${ers.userID != sessionScope.account.userID}">
                                            <a href="peopleprofile?userID=${ers.userID}" style="text-decoration: none;">
                                                <h6 style="margin-bottom: 0; color: #000">${ers.username}</h6>
                                            </a>
                                        </c:if>
                                        <p style="color: gray;">${ers.firstname} ${ers.lastname}</p>
                                    </div>
                                </li>
                            </c:forEach>
                            <!-- Thêm các mục trong danh sách followers ở đây -->
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${requestScope.mess!=null}">
            <a href="sv" style="text-decoration: none; color: purple; padding-left: 100px">Home</a>/ <a href="userprofile" style="text-decoration: none; color: purple;padding-left: 5px">User Profile</a>
            <div style=" align-content: center;">
                <h3 style="text-align: center; color: gray">${requestScope.mess}</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button id="blockButton" class="btn btn-info-outline waves-effect" onclick="showConfirmation()" style="display: block; margin: 0 auto; text-align: center; border: 1px solid purple; color: purple">${requestScope.blockstatus}</button>
           </div>
            <div id="confirmationBox" class="confirmation-box">
                <p>Are you sure you want to ${requestScope.blockstatus} this user?</p>
                <form id="blockForm" action="block" >
                     <input type="hidden" name="follow1" value="${requestScope.followornot}"/>                    
                    <input type="hidden" name="blockstatus" value="${requestScope.blockstatus}">
                    <input type="hidden" name="userID" value="${requestScope.people.userID}" />
                    <button type="submit" class="btn btn-info-outline waves-effect" style="color: red;">${requestScope.blockstatus}</button>
                </form>
                <button class="cancel-button" onclick="cancelBlock()">Cancel</button>
            </div>
        </c:if>
    </body>
    <script>
        const showFollowersButton = document.getElementById("showFollowersButton");
        const showFollowingButton = document.getElementById("showFollowingButton");

        const popup = document.getElementById("popup");
        const popup2 = document.getElementById("popup2");

        const closePopup = document.getElementById("closePopup");
        const closePopup2 = document.getElementById("closePopup2");

        showFollowersButton.addEventListener("click", function () {
            popup2.style.display = "block";
        });

        showFollowingButton.addEventListener("click", function () {
            popup.style.display = "block";
        });

        closePopup2.addEventListener("click", function () {
            popup2.style.display = "none";
        });

        closePopup.addEventListener("click", function () {
            popup.style.display = "none";
        });

        window.addEventListener("click", function (event) {
            if (event.target == popup) {
                popup.style.display = "none";
            }
        });



        function showConfirmation() {
            var confirmationBox = document.getElementById("confirmationBox");
            confirmationBox.style.display = "block";
        }

        function cancelBlock() {
            var confirmationBox = document.getElementById("confirmationBox");
            confirmationBox.style.display = "none";
        }
    </script>
</html>