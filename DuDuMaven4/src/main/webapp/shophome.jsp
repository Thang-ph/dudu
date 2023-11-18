<%-- 
    Document   : shophome
    Created on : Oct 13, 2023, 8:52:36 AM
    Author     : PC
--%>

<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dal.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DuDu - Home Shop</title>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <style>
            .pageHeader
            {
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

        <link href="css/shophome.css" rel="stylesheet">
    </head>

    <body>
        <!-- Navbar Start -->


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
                            
         <hr/>                   
                            
        <!-- Navbar End -->


        <!-- Carousel Start -->
        <div class="container-fluid mb-3">
            <div class="row px-xl-5">
                <div class="col-lg-8">
                    <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#header-carousel" data-slide-to="1"></li>
                            <li data-target="#header-carousel" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">

                            <div class="carousel-item position-relative active" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="img/bigdiscountimg20-11.png" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                  
                                </div>
                            </div>
                            <div class="carousel-item position-relative" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="img/bigdiscountimg1.png" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                  
                                </div>
                            </div>
                            <div class="carousel-item position-relative" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="img/bigdiscountimg3.png" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                   
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="img/salldiscountimg1.png" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 50%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="shop" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="img/smalldiscountimg.png" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 30%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="shop" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->




        <!-- Categories Start -->

        <div class="container-fluid pt-5">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categories</span></h2>

            <div class="row px-xl-5 pb-3">
                <c:forEach items="${requestScope.listofcat}" var="c">
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">

                        <a class="text-decoration-none" href="shop?option=0&grid=9&search=&page=&categoryID=${c.categoryID}&from=0&to=0&minRate=0.0&maxRate=5.0">
                            <div class="cat-item d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="img/cat-1.jpg" alt="">
                                </div>

                                <div class="flex-fill pl-3">

                                    <h6>${c.name}</h6>
                                    <small class="text-body">100 Products</small>

                                </div>

                            </div>

                        </a>

                    </div>
                </c:forEach>

            </div>

        </div>

        <!-- Categories End -->


        <!-- Products Start -->
        <div class="container-fluid pt-5 pb-3">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Featured Products</span></h2>
            <div class="row px-xl-5">
                <c:forEach items="${requestScope.listofratepro}" var="f">
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="${f.image}" alt="">
                                <div class="product-action">

                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="product?productID=${f.productID}">${f.name}</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>${f.price}</h5><h6 class="text-muted ml-2"><del>${f.price}</del></h6>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mb-1">
                                    ${f.rate} &nbsp;<small class="fa fa-star text-primary mr-1"></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Products End -->


        <!-- Offer Start -->
        <div class="container-fluid pt-5 pb-3">
            <div class="row px-xl-5">
                <div class="col-md-6">
                    <div class="product-offer mb-30" style="height: 300px;">
                        <img class="img-fluid" src="img/salldiscountimg1.png" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 50%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="shop" class="btn btn-primary" >Shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="product-offer mb-30" style="height: 300px;">
                        <img class="img-fluid" src="img/smalldiscountimg.png" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 30%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="shop" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Offer End -->


        <!-- Products Start -->
        <div class="container-fluid pt-5 pb-3">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Recent Products</span></h2>
            <div class="row px-xl-5">
                <c:forEach items="${requestScope.listofnewppro}" var="p">
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="${p.image}" alt="" >
                                <div class="product-action">

                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="product?productID=${p.productID}">${p.name}</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>${p.price}</h5><h6 class="text-muted ml-2"><del>${p.price}</del></h6>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mb-1">
                                    ${p.rate} &nbsp;<small class="fa fa-star text-primary mr-1"></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Products End -->


        <!-- Vendor Start -->
        <div class="container-fluid py-5">
            <div class="row px-xl-5"  >
                <div class="col"  >
                    <div class="owl-carousel vendor-carousel"style="display: flex; justify-content: space-between">
                        <div class="bg-light p-4" style="margin-right: 23px;">
                            <a href="https://shopee.vn/"><img src="img/shopee.png" alt="" style="width: 150px;height: 150px"></a>
                        </div>
                        <div class="bg-light p-4" style="margin-right: 23px;">
                            <a href="https://seller-vn.tiktok.com/"><img src="img/tiktokshop.png" alt="" style="width: 150px;height: 150px"></a>
                        </div>
                        <div class="bg-light p-4"style="margin-right: 23px ;">
                            <a href="https://tiki.vn/"><img src="img/tiki.png" alt="" style="width: 150px;height: 150px"></a>
                        </div>
                        <div class="bg-light p-4"style="margin-right: 23px ;">
                            <a href="https://www.chotot.com/"><img src="img/chotot.png" alt="" style="width: 150px;height: 150px"></a>
                        </div>
                        <div class="bg-light p-4"style="margin-right: 23px ;">
                            <a href="https://www.themessistore.com/"><img src="img/messi.png" alt="" style="width: 150px;height: 150px"></a>
                        </div>
                        <div class="bg-light p-4"style="margin-right: 23px ;">
                            <a href="https://fptshop.com.vn/"><img src="img/fptshop.png" alt="" style="width: 150px;height: 150px"></a>
                        </div>
                        <div class="bg-light p-4"style="margin-right: 23px ;">
                            <a href="https://www.amazon.com/"><img src="img/amazon.png" alt="" style="width: 150px;height: 150px"></a>
                        </div>
                        <div class="bg-light p-4">
                            <a href="https://www.lazada.vn/" ><img src="img/lazada.png" alt="" style="width: 150px;height: 150px"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Vendor End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
                    <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed clita kasd clita et et dolor sed dolor. Rebum tempor no vero est magna amet no</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                            <p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
                                                <%
                            if (session.getAttribute("account") == null) {
                        %>
                            <form action="register">
                                <div class="input-group">
                                    <input type="email" name="email" class="form-control" placeholder="Your Email Address">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary">Sign Up</button>
                                    </div>
                                </div>
                            </form>
                            <%
                                }
                            %>
                            <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                            <div class="d-flex">
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-secondary">
                        &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                        by
                        <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>