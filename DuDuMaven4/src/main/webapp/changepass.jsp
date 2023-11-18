<%-- 
Document   : main
Created on : Sep 20, 2023, 1:39:01 AM
Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>DuDu - Change PassWord</title>
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/profile.css"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <div class="pageHeader_duDu" style="background-color: #333251; position: relative; top: -20px; ">


            <!-- ////////////////////////////////////////////////////////////////////////////////// -->

            <div class="container">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <a href="home">
                            <img class="logo-container" src="img/logo.png">
                        </a>
                    </div>
                    <div class="flex-fill">
                        <div class="search_duDu">
                            <input type="text" class="search_duDu_input form-control" placeholder="Search accounts">
                            <span class="search_duDu_icon">
                                <i class="fas fa-search"></i>
                            </span>
                        </div>
                    </div>
                    <div class="d-flex align-items-center" >
                        <a href="#" class="btn btn-default" style="color: white">Upload</a>

                        <div class="btn btn-default">
                            <i class="fas fa-ellipsis-v"></i>
                        </div>
                        <div class="btn btn-default">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="btn btn-danger" >

                            <%
                            if(session.getAttribute("account")!=null)
                            {
                            %>
                            ${sessionScope.account.username}
                            <%
                            }else
                            {
                            
                            %>
                            Login
                            <%
                            }
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ////////////////////////////////////////////////////////////////////////////////// -->


        <div class="container mt-3" style="background-color: #403F66">
            <div class="row">
                <div class="col-sm-4">

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
                               if(session.getAttribute("account")!=null)
                                 {
                            %>
                            <b><a  href="logout" style="color: whitesmoke">Logout</a> </b>
                            <%
                          }else
                          {
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
                                <nav aria-label="breadcrumb" class="main-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="home" style="color: whitesmoke">Home</a></li>
                                        <li class="breadcrumb-item"><a href="userprofile" style="color: whitesmoke">User Profile</a></li>                                  
                                        <li class="breadcrumb-item active" aria-current="page" style="color: pink">Change Pass</li>
                                    </ol>
                                </nav>
                                <!-- /Breadcrumb -->



                                <div class="col-md-4 mb-3">



                                </div>

                                <!-- ////////////////////////////////////3/5/////////////////////////////////// -->
                                <div class="col-md-8">
                                    <div class="card mb-3">
                                        <form action="changepass" method="post">

                                            <input type="hidden" name="userID" value="${sessionScope.account.userID}"/>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Old Pass</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input class="form-control" id="inputFirstName" type="text" name="oldpass" placeholder="Enter your old password" value="" required>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">New Pass</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input class="form-control" id="inputFirstName" type="text" name="pass1" placeholder="Enter your new password" value="" >
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Confirm New Pass</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input class="form-control" id="inputFirstName" type="password" name="pass2" placeholder="Confirm your new password" value="" >
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div style="display: flex; align-items: center;">
                                                        <input style="background-color: #007BFF; margin-right: 10px;" type="submit" />
                                                        <h6 style="margin-top: 0; color: ${requestScope.color}"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div>${requestScope.warning}</h6> </div>
                                                </div>
                                            </div>
                                    </div>
                                    </form>       
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
                        <!-- /////////////////////////////////////////////////////////////////////// -->

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>