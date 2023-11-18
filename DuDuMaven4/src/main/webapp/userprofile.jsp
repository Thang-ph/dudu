<%-- 
Document   : main
Created on : Sep 20, 2023, 1:39:01 AM
Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>DuDu - Do Shop, Do Share</title>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/profile.css"/>

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
   .pageHeader
            {
                margin-top: -20px;
                margin-bottom: 20px;
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

                    </div>
                    <div class="col-sm-3">


                        <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <a  style="color: whitesmoke" href="us" class="upload btn btn-default">Upload</a>
 <%
                            }
                        %>
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


        <!-- ////////////////////////////////////////////////////////////////////////////////// -->


        <div class="container mt-3" style="background-color: #403F66">
            <div class="row">
                <div class="col-sm-4" style="max-height: 500px">

                    <!-- //////////////////////////// -->


                    <div>
                        <a class="d-flex align-items-center h5">
                            <i class="fas fa-user-friends"></i>
                            <span class="ms-2" style="color: whitesmoke">Home Page</span>
                        </a>
                        <a class="d-flex align-items-center h5" >
                            <i class="fas fa-user-friends" ></i>
                            <span class="ms-2" style="color: whitesmoke">Upload</span>
                        </a>
                        <a class="d-flex align-items-center h5">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                            </svg>
                            <span class="ms-2" style="color: whitesmoke">Shop</span>
                        </a>
                        <a class=" d-flex align-items-center text-pink h5">
                            <i class="fas fa-home" style="color: pink"></i>
                            <span class="ms-2" style="color: pink">Profile</span>
                        </a>
                    </div>

                    <!-- //////////////////////////// -->


                    <div>
                        <p style="color: whitesmoke" >Log in to follow creators, like videos, and view comments.</p>
                        <div class="btn btn-outline-danger w-100 p-2">
                            <%
                                if (session.getAttribute("account") != null) {
                            %>
                            <b><a  href="logout" style="color: whitesmoke">Logout</a> </b>
                            <%
                            } else {
                            %>
                            <b><a href="login">Log in</a></b>
                            <%
                                }
                            %>
                        </div>
                    </div>

                    <hr>
                    <div>
                        <div class="d-flex align-items-center justify-content-between">
                            <span style="color: whitesmoke" >Discover</span>
                        </div>
                        <div>
                            <span class="badge rounded-pill border border-secondary text-dark m-2" ><h7 style="color: whitesmoke"># Discover</h7></span>
                            <span class="badge rounded-pill border border-secondary text-dark m-2" ><h7 style="color: whitesmoke"># Discover</h7></span>
                            <span class="badge rounded-pill border border-secondary text-dark m-2" ><h7 style="color: whitesmoke"># Discover</h7></span>
                            <span class="badge rounded-pill border border-secondary text-dark m-2" ><i class="fas fa-music" style="color: whitesmoke"></i><h7 style="color: whitesmoke">Then Leave (feat. Queendom Come) - BeatKing</h7></span>
                            <span class="badge rounded-pill border border-secondary text-dark m-2" ><i class="fas fa-music" style="color: whitesmoke"></i><h7 style="color: whitesmoke">Then Leave (feat. Queendom Come) - BeatKing</h7></span>
                        </div>
                    </div>
                    <hr>
                    <div style="color: whitesmoke">
                        &copy; 2021 DuDu
                    </div>
                </div>



                <!-- /////////////////////////////////////////////////////////////////////// -->



                <div class="col-sm-8">
                    <div class="mb-5">

                        <!-- <hr class="my-5"> -->
                        <!-- /////////////////////////////---------------Profile User----------////////////////////////////////////////// -->
                        <div class="container">
                            <div class="main-body">

                                <!-- Breadcrumb -->
                               
                                <!-- /Breadcrumb -->

                                <div class="row gutters-sm">

                                    <div class="col-md-4 mb-3">
                                        <!-- //////////////////-----1/5------////////////////////////// -->
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="d-flex flex-column align-items-center text-center">
                                                    <img src="${sessionScope.account.avatar}" class="rounded-circle" width="160" height="160">
                                                    <div class="mt-3">
                                                        <h4>${sessionScope.account.username}</h4>
                                                        <p class="text-secondary mb-1">${sessionScope.account.describe}</p>
                                                        <p class="text-muted font-size-sm">Age: ${sessionScope.age}    |    Video: ${requestScope.videosize}</p>
                                                        <button class="btn btn-outline-primary" id="showFollowersButton">${requestScope.tottalfollowers} Follower</button>
                                                        <button class="btn btn-primary" id="showFollowingButton">${requestScope.tottalfollowing} Following</button>



                                                        <!-- //////////////////-----follower------////////////////////////// -->                                              






                                                        <!-- ////////////////////////////////////////////////////// -->                           

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /////////////////////////2/5////////////////////////////////////////////// -->
                                        </div>


                                    </div>

                                    <!-- ////////////////////////////////////3/5/////////////////////////////////// -->
                                    <div class="col-md-8">
                                        <div class="card mb-3">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Full Name</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        ${sessionScope.account.firstname} ${sessionScope.account.lastname}
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Email</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        ${sessionScope.account.email}
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Phone</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        ${sessionScope.account.phone}
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Date of Birth</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        ${sessionScope.account.dob}
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Address</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        ${sessionScope.account.address}
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <a class="btn btn-info " target="__blank" href="editprofile?userID=${sessionScope.account.userID}">Edit</a> &nbsp;&nbsp;&nbsp; <a class="btn btn-info " target="__blank" href="changepass?userID=${sessionScope.account.userID}">Change Password</a>  &nbsp;&nbsp;&nbsp;<button style="color: black;background-color: #0dcaf0;border-color: #0dcaf0" class="btn btn-primary" id="getBlockList">Block List</button>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>

                                        <div class="row gutters-sm">

                                            <!-- ////////////////////////////////////4/5//////////////////////////////////////////// -->    






                                            <!-- ////////////////////////////////////5/5
                                            
                                                                                    <div class="col-sm-6 mb-3">
                                                                                      <div class="card h-100">
                                                                                        <div class="card-body">
                                                                                          <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>Project Status</h6>
                                                                                          <small>Web Design</small>
                                                                                          <div class="progress mb-3" style="height: 5px">
                                                                                            <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                          </div>
                                                                                          <small>Website Markup</small>
                                                                                          <div class="progress mb-3" style="height: 5px">
                                                                                            <div class="progress-bar bg-primary" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                          </div>
                                                                                          <small>One Page</small>
                                                                                          <div class="progress mb-3" style="height: 5px">
                                                                                            <div class="progress-bar bg-primary" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                          </div>
                                                                                          <small>Mobile Template</small>
                                                                                          <div class="progress mb-3" style="height: 5px">
                                                                                            <div class="progress-bar bg-primary" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                          </div>
                                                                                          <small>Backend API</small>
                                                                                          <div class="progress mb-3" style="height: 5px">
                                                                                            <div class="progress-bar bg-primary" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                                                                                          </div>
                                                                                        </div>
                                                                                      </div>
                                                                                    </div>
                                                                                  </div>
                                            ////////////////////////////////////////// -->
                                            <!-- /////////////////////////////////////////////////////////////////////// -->

                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- /////////////////////////////////////////////////////////////////////// -->

                        </div>
                    </div>

                </div>
            </div>

        </div>
        <div class="container">
            <c:if test="${requestScope.videosize==0}">
                <div style="text-align: center;">
                    <h3 style="color: cyan;">U Haven't Upload Any Video <a href="us" style="text-decoration: none;">Upload Here</a> </h3> 
                </div>
            </c:if>
            <c:if test="${requestScope.videosize!=0}">
                <div class="row" style="background-color: #ffffff; padding-top: 20px;padding-left: 5px;padding-right: 5px">
                    <div style="text-align: center;">
                        <h3 style="color: gray;">User Videos</h3> 
                    </div>
                    <hr/>
                    <c:forEach items="${requestScope.listVideo}" var="v">
                        <div class="col-sm-12 col-md-6 col-lg-4">
                            <div class="view overlay hm-black-light m-b-2" >
                                <div style="align-items: center">

                                    <div >
                                        <div>
                                            <video controls style="width: 420px; height: 420px">
                                                <source src="${v.videourl}" type="video/mp4">
                                            </video>
                                        </div>
                                    </div>

                                    <div >
                                        <div >
                                            <h3 style="background-color: #ccffff    ;color: burlywood;text-align: center">${v.title}</h3>
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
            </c:if>
        </div>


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
                                    <a href="peopleprofile?userID=${ing.userID}"><h6 style="margin-bottom: 0;color: #000">${ing.username}</h6></a>
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
                        <c:forEach items="${requestScope.listoffollowers}" var="ers" >
                            <li style="display: flex;align-items: center;"> <img style=" border-radius: 50%;width: 44px; height: 44px" src="${ers.avatar}">
                                <div class="info" style="margin-top: 17px; margin-left: 18px;">
                                    <a href="peopleprofile?userID=${ers.userID}"><h6 style="margin-bottom: 0;color: #000">${ers.username}</h6></a>
                                    <p style="color: gray;"> ${ers.firstname} ${ers.lastname }</p>
                                </div>
                            </li>
                        </c:forEach>
                        <!-- Thêm các mục trong danh sách followers ở đây -->

                    </ul>

                </div>
            </div>

        </div>


        <div id="popup3" class="popup">
            <div class="popup-content">
                <span class="close" id="closePopup3">&times;</span>
                <h2 style="text-align: center;">Block List</h2>
                <hr/>
                <h4 style="color: gray; text-align: center;">${requestScope.noblock}</h4>
                <div class="scroll">
                    <ul>
                        <c:forEach items="${requestScope.listofblock}" var="bl" >
                            <li style="display: flex;align-items: center;"> <img style=" border-radius: 50%;width: 44px; height: 44px" src="${bl.avatar}">
                                <div class="info" style="margin-top: 17px; margin-left: 18px;">
                                    <a href="peopleprofile?userID=${bl.userID}"><h6 style="margin-bottom: 0;color: #000">${bl.username}</h6></a>
                                    <p style="color: gray;"> ${bl.firstname} ${bl.lastname }</p>
                                </div>
                            </li>
                        </c:forEach>
                        <!-- Thêm các mục trong danh sách followers ở đây -->

                    </ul>

                </div>
            </div>

        </div>        

    </body>
    <script>
        const showFollowersButton = document.getElementById("showFollowersButton");
        const showFollowingButton = document.getElementById("showFollowingButton");
        const getBlockList = document.getElementById("getBlockList");


        const popup = document.getElementById("popup");
        const popup2 = document.getElementById("popup2");
        const popup3 = document.getElementById("popup3");

        const closePopup = document.getElementById("closePopup");
        const closePopup2 = document.getElementById("closePopup2");
        const closePopup3 = document.getElementById("closePopup3");


        getBlockList.addEventListener("click", function () {
            popup3.style.display = "block";
        });
        showFollowersButton.addEventListener("click", function () {
            popup2.style.display = "block";
        });
        showFollowingButton.addEventListener("click", function () {
            popup.style.display = "block";
        });


        closePopup3.addEventListener("click", function () {
            popup3.style.display = "none";
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

    </script>
</html>