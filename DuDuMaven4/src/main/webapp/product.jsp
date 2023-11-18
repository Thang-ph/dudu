<%-- 
    Document   : product
    Created on : 26-Oct-2023, 22:42:44
    Author     : Pham Thang
--%>
<%-- 
    Document   : product
    Created on : 21-Sep-2023, 13:20:53
    Author     : Pham Thang
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DuDu</title>

        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">
        <link rel="stylesheet" href="css/product.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
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

            /* Thiết lập kích thước cho thanh chọn ảnh */
            .image-selector {
                text-align: center;
            }

            /* Kích thước ảnh chính trong thanh chọn ảnh */
            .image-selector img {
                max-width: 100%;
                max-height: 100vh;
                display: block;
                border: 2px solid #ccc; /* Hiển thị khung viền */
                border-radius: 8px; /* Làm tròn góc */
            }

            /* Thiết lập kích thước và kiểu hiển thị cho các ảnh thu nhỏ */
            .image-thumbnails {
                padding-left: 25px;
                padding-bottom: 5px;
                display: flex;
                gap: 10px; /* Khoảng cách giữa các ảnh thu nhỏ */
                margin-top: 10px;
            }

            .image-thumbnails img {
                width: 90px; /* Kích thước của các ảnh thu nhỏ */
                height: auto;
                cursor: pointer;
                border: 1px solid #ccc; /* Hiển thị khung viền cho ảnh thu nhỏ */
            }

            .image-thumbnails img:hover {
                border-color: #333; /* Đổi màu khung viền khi rê chuột qua */
            }

            /* CSS cho nút "Trước" */
            /* CSS cho nút "Trước" */
            #prevButton {
                position: absolute;
                top: 90%; /* Đặt nút ở giữa chiều cao */
                left: 0; /* Đặt nút ở bên trái */
                transform: translateY(-50%); /* Để nút hiển thị chính giữa theo chiều dọc */
                z-index: 2; /* Đảm bảo nút nằm trên các ảnh */
                opacity: 0.6; /* Độ mờ của nút */
                background-color: rgba(200, 200, 200, 0.5); /* Nền xám nhạt */
                border: none;
                outline: none;
                cursor: pointer;
                padding: 10px 15px; /* Tăng kích thước của nút */
                color: white; /* Màu chữ trắng */
                font-size: 18px; /* Kích thước chữ */
            }

            /* CSS cho nút "Sau" */
            #nextButton {
                position: absolute;
                top: 90%; /* Đặt nút ở giữa chiều cao */
                right: 0; /* Đặt nút ở bên phải */
                transform: translateY(-50%); /* Để nút hiển thị chính giữa theo chiều dọc */
                z-index: 2; /* Đảm bảo nút nằm trên các ảnh */
                opacity: 0.6; /* Độ mờ của nút */
                background-color: rgba(200, 200, 200, 0.5); /* Nền xám nhạt */
                border: none;
                outline: none;
                cursor: pointer;
                padding: 10px 15px; /* Tăng kích thước của nút */
                color: white; /* Màu chữ trắng */
                font-size: 18px; /* Kích thước chữ */
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

        <!-- content -->
        <section class="py-5">
            <div class="container">
                <div class="breadcrumb">

                    <a href="home"><i class="fas fa-home"></i> &nbsp; Home</a> &nbsp; > &nbsp; <a href="shop">  Shop</a> &nbsp; > &nbsp; <a href="shop?categoryID=${requestScope.product.category.categoryID}">  ${requestScope.product.category.name}</a>&nbsp; >&nbsp; <span class="gray">${requestScope.product.name}</span>
                </div>

                <div class="row gx-5">
                    <aside class="col-lg-6">
                        <div class="border rounded-4 mb-3 d-flex justify-content-center">
                            <!-- Thanh chọn ảnh -->
                            <div class="image-selector">
                                <img src="${requestScope.product.image}" alt="Selected Image" class="selected-image" />
                                <!-- Danh sách các ảnh để chọn -->
                                <button id="prevButton" class="btn btn-outline-secondary m-2"><</button>

                                <div class="image-thumbnails">
                                    <c:forEach items="${requestScope.listImage}" var="image">
                                        <img src="${image.image}" alt="Thumbnail" class="thumbnail" data-src="${image.image}" />
                                    </c:forEach>
                                </div>
                                <button id="nextButton" class="btn btn-outline-secondary m-2">></button>
                            </div>
                        </div>




                        <!--
                        <!-- thumbs-wrap.// -->
                        <!-- gallery-wrap .end// -->
                    </aside>
                    <main class="col-lg-6">
                        <div class="ps-lg-3">
                            <h4 class="title text-dark">
                                ${requestScope.product.name} <br />
                                ${requestScope.product.category.name}
                            </h4>
                            <div class="d-flex flex-row my-3">
                                <div class="text-warning mb-1 me-2">
                                    <!--                                    <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>-->
                                    <span class="ms-1">
                                        ${product.rate}                                  <i class="fa fa-star"></i>

                                    </span>
                                </div>
                                <!--                                <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>154 orders</span>-->
                                &nbsp; <span class="text-success ms-2">${requestScope.product.shop.name}</span>
                            </div>

                            <div class="mb-3">
                                <span class="h5"><fmt:formatNumber pattern="###,### ₫">${requestScope.product.price}</fmt:formatNumber></span>
                                </div>



                                <div  id="select"  class="row">
                                    <dt class="col-3"><div ${requestScope.type.isEmpty() ? 'hidden' : ''}>Type:</div></dt>
                                <dd class="col-9">
                                    <c:forEach items="${requestScope.type}" var="t" varStatus="i">
                                        <button  ${requestScope.t[i.index]==false?"disabled style= 'opacity: 0.8;  background-color: rgb(235, 235, 235);cursor: not-allowed;'":""} class="typeButton button" id="${t}"> ${t}</button> 
                                    </c:forEach>
                                </dd>

                                <dt  class="col-3"><div ${requestScope.size.isEmpty() ? 'hidden' : ''}>Size:</div ></dt>
                                <dd class="col-9">
                                    <c:forEach items="${requestScope.size}" var="s" varStatus="i">
                                        <button  ${requestScope.s[i.index]==false?"disabled style= 'opacity: 0.8;  background-color: rgb(235, 235, 235);cursor: not-allowed;'":""} class="sizeButton button" id="${s}">      ${s}</button> 
                                    </c:forEach>
                                </dd>
                                <p id="notice" hidden style="color: red;font-size: 90%; padding-left: 20px;padding-top: 20px">Vui lòng nhập phân loại hàng</p>

                            </div>

                            <hr />

                            <div class="row mb-4">
                                <!--                                <div class="col-md-4 col-6">
                                                                    <label class="mb-2">Size</label>
                                                                    <select class="form-select border border-secondary" style="height: 35px;">
                                                                        <option>Small</option>
                                                                        <option>Medium</option>
                                                                        <option>Large</option>
                                                                    </select>
                                                                </div>-->
                                <!-- col.// -->
                                <div class="col-md-4 col-6 mb-3">
                                    <label id="quantity" class="mb-2 d-block"><span>Quantity in stock: ${requestScope.quantity}</span> </label>
                                    <div class="input-group mb-3" style="width: 170px;">
                                        <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon1" data-mdb-ripple-color="dark">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <input readonly name="quantity" id="quantityInput" value="1" type="number" class="form-control text-center border border-secondary no-spinner" placeholder="1" />
                                        <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon2" data-mdb-ripple-color="dark">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <a href="#" id="buyButton" class="btn btn-warning shadow-0"> Buy now </a>
                            <a href="#" id="cartButton" class="btn btn-primary shadow-0"> <i class="me-1 fa fa-shopping-basket"></i> Add to cart </a>
                        </div>
                    </main>
                </div>
            </div>
        </section>
        <!-- content -->

        <section class="bg-light border-top py-4">
            <div class="container">
                <div class="row gx-4">
                    <div class="col-lg-8 mb-4">
                        <div class="border rounded-2 px-3 py-2 bg-white">
                            <!-- Pills navs -->
                            <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                                <li class="nav-item d-flex" role="presentation">
                                    <a class="nav-link d-flex align-items-center justify-content-center w-100 active" id="ex1-tab-1" data-toggle="pill" href="#ex1-pills-1" role="tab" aria-controls="ex1-pills-1" aria-selected="true">Detail</a>
                                </li>
                                <li class="nav-item d-flex" role="presentation">
                                    <a class="nav-link d-flex align-items-center justify-content-center w-100" id="ex1-tab-2" data-toggle="pill" href="#ex1-pills-2" role="tab" aria-controls="ex1-pills-2" aria-selected="false">Review</a>
                                </li>
                            </ul>
                            <!-- Pills navs -->

                            <!-- Pills content -->
                            <div class="tab-content" id="ex1-content">
                                <div style="background-color: white; color: black" class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel" aria-labelledby="ex1-tab-1">
                                    ${requestScope.product.detail}
                                </div>
                                <div style="background-color: white; color: black"  class="tab-pane fade mb-2" id="ex1-pills-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                                    1 chiếc review sương sương
                                </div>

                            </div>
                            <!-- Pills content -->

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="px-0 border rounded-2 shadow-0">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Maybe You Also Like</h5>
                                    <c:forEach var="r" items="${requestScope.related}">
                                        <div class="d-flex mb-3">
                                            <a href="product?productID=${r.productID}" class="me-3">
                                                <img src="${r.image}" style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                            </a>
                                            <div class="info">
                                                <a href="product?productID=${r.productID}" class="nav-link mb-1">
                                                    ${r.name} <br />
                                                </a>
                                                &nbsp;      &nbsp;   <strong class="text-dark"> <fmt:formatNumber pattern="###,### ₫">${r.price}</fmt:formatNumber></strong>
                                                </div>
                                            </div>
                                    </c:forEach>

                                    <!--                   <div class="d-flex mb-3">
                                                           <a href="#" class="me-3">
                                                               <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/9.webp" style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                                           </a>
                                                           <div class="info">
                                                               <a href="#" class="nav-link mb-1">
                                                                   Summer New Men's Denim <br />
                                                                   Jeans Shorts
                                                               </a>
                                                               <strong class="text-dark"> $29.50</strong>
                                                           </div>
                                                       </div>
                   
                                                       <div class="d-flex mb-3">
                                                           <a href="#" class="me-3">
                                                               <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/10.webp" style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                                           </a>
                                                           <div class="info">
                                                               <a href="#" class="nav-link mb-1"> T-shirts with multiple colors, for men and lady </a>
                                                               <strong class="text-dark"> $120.00</strong>
                                                           </div>
                                                       </div>
                   
                                                       <div class="d-flex">
                                                           <a href="#" class="me-3">
                                                               <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/11.webp" style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                                           </a>
                                                           <div class="info">
                                                               <a href="#" class="nav-link mb-1"> Blazer Suit Dress Jacket for Men, Blue color </a>
                                                               <strong class="text-dark"> $339.90</strong>
                                                           </div>
                                                       </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer -->
        <div  class="instagram">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/bia1.png')">
                            <div class="instagram__text">
                                <i class="fab fa-facebook"></i>

                                <a href="https://www.facebook.com/profile.php?id=100014046042231">Thắng Phạm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/bia2.png')">
                            <div class="instagram__text">
                                <i class="fab fa-instagram"></i>

                                <a href="https://www.instagram.com/thangph_2312/">thangph_2312</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/bia3.png')">
                            <div class="instagram__text">
                                <i class="fab fa-youtube"></i>

                                <a href="https://www.youtube.com/watch?v=SDnpEqK7EBQ&ab_channel=dreamscape">@Sidejob</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/bia4.png')">
                            <div class="instagram__text">
                                <i class="fab fa-twitter"></i>

                                <a href="https://twitter.com/APieceOfPeaceee">@APieceOfPeace</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/bia5.png')">
                            <div class="instagram__text">
                                <i class="fab fa-snapchat-ghost"></i>

                                <a href="https://www.snapchat.com/">@LittleGuyWithBigDream</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/bia6.png')">
                            <div class="instagram__text">
                                <i class="fab fa-pinterest"></i>

                                <a href="https://www.pinterest.com/">@TheWorldInMyPhone</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                                                

        <div style="padding-top: 50px" class="container">
            <div class="row">
                <div class="col-lg-5 col-md-6 col-sm-7">
                    <div class="footer__about">

                        <p style=" display: flex; color: #999;font-size: 80%;
                           justify-content: center;">“The best customer service is if the customer doesn't need to call you, doesn't need to talk to you. It just works.”
                        </p>

                        <p style=" display: flex; color: #999; font-size: 80%;
                           justify-content: center;">
                            - Jeff Bezos -
                        </p>
                        <!--                            <div class="footer__payment">
                                                        <a href="#"><img src="img/payment/payment-1.png" alt=""></a>
                                                        <a href="#"><img src="img/payment/payment-2.png" alt=""></a>
                                                        <a href="#"><img src="img/payment/payment-3.png" alt=""></a>
                                                        <a href="#"><img src="img/payment/payment-4.png" alt=""></a>
                                                        <a href="#"><img src="img/payment/payment-5.png" alt=""></a>
                                                    </div>-->
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-5">

                </div>
                <div class="col-lg-2 col-md-3 col-sm-4">
                </div>
                <div class="col-lg-4 col-md-8 col-sm-8">

                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <div class="footer__copyright__text">
                        <p style="color: #999; font-size: 80%;">Copyright 2003 &copy; by  DuDu &#x2122;  </p>
                    </div>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </div>
            </div>
        </div>

        <footer class="text-center text-lg-start text-muted bg-primary mt-3">
            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start pt-4 pb-4">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-12 col-lg-3 col-sm-12 mb-2">
                            <!-- Content -->

                            <p class="mt-1 text-white">
                                © 2023 Copyright: DuDu
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-6 col-sm-4 col-lg-2">
                            <!-- Links -->
                            <h6 class="text-uppercase text-white fw-bold mb-2">
                                Store
                            </h6>
                            <ul class="list-unstyled mb-4">
                                <li><a class="text-white-50" href="#">About us</a></li>
                                <li><a class="text-white-50" href="#">Find store</a></li>
                                <li><a class="text-white-50" href="#">Categories</a></li>
                                <li><a class="text-white-50" href="#">Blogs</a></li>
                            </ul>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-6 col-sm-4 col-lg-2">
                            <!-- Links -->
                            <h6 class="text-uppercase text-white fw-bold mb-2">
                                Information
                            </h6>
                            <ul class="list-unstyled mb-4">
                                <li><a class="text-white-50" href="#">Help center</a></li>
                                <li><a class="text-white-50" href="#">Money refund</a></li>
                                <li><a class="text-white-50" href="#">Shipping info</a></li>
                                <li><a class="text-white-50" href="#">Refunds</a></li>
                            </ul>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-6 col-sm-4 col-lg-2">
                            <!-- Links -->
                            <h6 class="text-uppercase text-white fw-bold mb-2">
                                Support
                            </h6>
                            <ul class="list-unstyled mb-4">
                                <li><a class="text-white-50" href="#">Help center</a></li>
                                <li><a class="text-white-50" href="#">Documents</a></li>
                                <li><a class="text-white-50" href="#">Account restore</a></li>
                                <li><a class="text-white-50" href="#">My orders</a></li>
                            </ul>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-12 col-sm-12 col-lg-3">
                            <!-- Links -->
                            <h6 class="text-uppercase text-white fw-bold mb-2">Newsletter</h6>
                            <p class="text-white">Stay in touch with latest updates about our products and offers</p>
                            <div class="input-group mb-3">
                                <input type="email" class="form-control border" placeholder="Email" aria-label="Email" aria-describedby="button-addon2" />
                                <button class="btn btn-light border shadow-0" type="button" id="button-addon2" data-mdb-ripple-color="dark">
                                    Join
                                </button>
                            </div>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <div >
                <div class="container">
                    <div class="d-flex justify-content-between py-4 border-top">
                        <!--- payment --->
                        <div>
                            <i class="fab fa-lg fa-cc-visa text-white"></i>
                            <i class="fab fa-lg fa-cc-amex text-white"></i>
                            <i class="fab fa-lg fa-cc-mastercard text-white"></i>
                            <i class="fab fa-lg fa-cc-paypal text-white"></i>
                        </div>
                        <!--- payment --->

                        <!--- language selector --->
                        <div class="dropdown dropup">
                            <a class="dropdown-toggle text-white" href="#" id="Dropdown" role="button" data-mdb-toggle="dropdown" aria-expanded="false"> <i class="flag-united-kingdom flag m-0 me-1"></i>English </a>

                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="Dropdown">
                                <li>
                                    <a class="dropdown-item" href="#"><i class="flag-united-kingdom flag"></i>English <i class="fa fa-check text-success ms-2"></i></a>
                                </li>
                                <li><hr class="dropdown-divider" /></li>
                                <li>
                                    <a class="dropdown-item" href="#"><i class="flag-poland flag"></i>Polski</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#"><i class="flag-china flag"></i>中文</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#"><i class="flag-japan flag"></i>日本語</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#"><i class="flag-germany flag"></i>Deutsch</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#"><i class="flag-france flag"></i>Français</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#"><i class="flag-spain flag"></i>Español</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#"><i class="flag-russia flag"></i>Русский</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#"><i class="flag-portugal flag"></i>Português</a>
                                </li>
                            </ul>
                        </div>
                        <!--- language selector --->
                    </div>
                </div>
            </div>
        </footer>
        <%
            boolean checkType = (boolean) request.getAttribute("checkType");
            boolean checkSize = (boolean) request.getAttribute("checkSize");
        %>
        <input hidden value="${requestScope.quantity}" name="number"/>
        <input hidden value="<%= checkType%>" name="checkType"/> 
        <input hidden value="<%= checkSize%>" name="checkSize"/>
        <input hidden value="${requestScope.product.productID}" name="productID"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const typeButtons = document.querySelectorAll('.typeButton');
                const sizeButtons = document.querySelectorAll('.sizeButton');
                let selectedType = null;
                let selectedSize = null;
                let productID = document.querySelector('input[name="productID"]').value;
                let number = document.querySelector('input[name="number"]').value;
                var stock = 0;
                var quantityInput = document.getElementById("quantityInput");
                let checkSize = document.querySelector('input[name="checkSize"]').value;
                let checkType = document.querySelector('input[name="checkType"]').value;
                if (checkType === "false" && checkSize === "false") {
                    updateQuantity();
                }
               

                const typeButtonStatus = {};

                typeButtons.forEach(button => {
                    button.addEventListener('click', () => {
                        typeButtons.forEach(btn => {
                            if (btn !== button) {
                                btn.classList.remove('active');
                                typeButtonStatus[btn.id] = false;
                            }
                        });

                        if (!typeButtonStatus[button.id]) {
                            button.classList.add('active');
                            selectedType = button.id;
                            typeButtonStatus[button.id] = true;
                        } else {
                            button.classList.remove('active');
                            selectedType = null;
                            typeButtonStatus[button.id] = false;
                        }

                        if (selectedSize !== null || checkSize === "false") {
                            var selectElement = document.getElementById("select");
                            selectElement.removeAttribute("style");

                            var noticeElement = document.getElementById("notice");
                            noticeElement.setAttribute("hidden", "true");
                        }
                        updateQuantity();
                        quantityInput.value = 1;
                    });
                });




                const sizeButtonStatus = {};

                sizeButtons.forEach(button => {
                    button.addEventListener('click', () => {
                        sizeButtons.forEach(btn => {
                            if (btn !== button) {
                                btn.classList.remove('active');
                                sizeButtonStatus[btn.id] = false;
                            }
                        });

                        if (!sizeButtonStatus[button.id]) {
                            button.classList.add('active');
                            selectedSize = button.id;
                            sizeButtonStatus[button.id] = true;
                        } else {
                            button.classList.remove('active');
                            selectedSize = null;
                            sizeButtonStatus[button.id] = false;
                        }

                        if (selectedType !== null || checkType === "false") {
                            var selectElement = document.getElementById("select");
                            selectElement.removeAttribute("style");

                            var noticeElement = document.getElementById("notice");
                            noticeElement.setAttribute("hidden", "true");
                        }
                        updateQuantity();
                        quantityInput.value = 1;
                    });
                });


                function updateButtons(buttons, data) {
                    buttons.forEach(function (button, index) {
                        if (data[index] === false) {
                            button.disabled = true;
                            button.style.opacity = "0.8";
                            button.style.backgroundColor = "rgb(235, 235, 235)";
                            button.style.cursor = "not-allowed";
                        } else {
                            button.disabled = false;
                            button.style.opacity = "";
                            button.style.backgroundColor = "";
                            button.style.cursor = "";
                        }
                    });
                }
                function updateQuantity() {
                    $.ajax({
                        url: "/DuDuMaven4/quantity",
                        type: "get",
                        data: {
                            size: selectedSize,
                            type: selectedType,
                            productID: productID
                        },
                        success: function (data) {
                            stock = data.stock;
                            var avaiable = data.avaiable;
                            var row = document.getElementById("quantity");
                            row.innerHTML = "Quantity in stock: " + number;


                            if ((checkType === "true" && checkSize === "false" && selectedType !== null) || (checkType === "false" && checkSize === "true" && selectedSize !== null) ||
                                    (checkType === "true" && checkSize === "true" && (selectedSize !== null && selectedType !== null)) || (checkType === "false" && checkSize === "false")) {
                                row.innerHTML = "Quantity in stock: " + avaiable;
                                row.innerHTML += "<br>Avaiable for you: " + stock;

                            }
                            updateButtons(typeButtons, data.t);
                            updateButtons(sizeButtons, data.s);
                        },
                        error: function (xhr) {
                        }
                    });
                }
// nút cart
                document.getElementById("cartButton").addEventListener("click", function (event) {

                    var quantity = quantityInput.value;
                    event.preventDefault();


                    if ((selectedType !== null && selectedSize !== null) || (selectedType !== null && checkSize === "false") || (selectedSize !== null && checkType === "false") || (checkType === "false" && checkSize === "false")) {

                        if (number < 1) {
                            var selectElement = document.getElementById("select");

                            selectElement.style.padding = "20px";
                            selectElement.style.background = "#fff0f0";

                            var noticeElement = document.getElementById("notice");

                            noticeElement.removeAttribute("hidden");
                            noticeElement.textContent = "Sản phẩm đã hết hàng";
                        } else {
                            window.location.href = "cart?productID=" + productID + "&type=" + selectedType + "&size=" + selectedSize + "&quantity=" + quantity;


                        }
                    } else {

                        var selectElement = document.getElementById("select");

                        selectElement.style.padding = "20px";
                        selectElement.style.background = "#fff0f0";

                        var noticeElement = document.getElementById("notice");

                        noticeElement.removeAttribute("hidden");

                    }
                });
                
                // nút mua
                document.getElementById("buyButton").addEventListener("click", function (event) {

                    var quantity = quantityInput.value;
                    event.preventDefault();


                    if ((selectedType !== null && selectedSize !== null) || (selectedType !== null && checkSize === "false") || (selectedSize !== null && checkType === "false") || (checkType === "false" && checkSize === "false")) {

                        if (number < 1) {
                            var selectElement = document.getElementById("select");

                            selectElement.style.padding = "20px";
                            selectElement.style.background = "#fff0f0";

                            var noticeElement = document.getElementById("notice");

                            noticeElement.removeAttribute("hidden");
                            noticeElement.textContent = "Sản phẩm đã hết hàng";
                        } else {
                            window.location.href = "buy?productID=" + productID + "&type=" + selectedType + "&size=" + selectedSize + "&quantity=" + quantity;


                        }
                    } else {

                        var selectElement = document.getElementById("select");

                        selectElement.style.padding = "20px";
                        selectElement.style.background = "#fff0f0";

                        var noticeElement = document.getElementById("notice");

                        noticeElement.removeAttribute("hidden");

                    }
                });
                
                
                var quantityInput = document.getElementById("quantityInput");
                var plusButton = document.getElementById("button-addon2");
                var minusButton = document.getElementById("button-addon1");

                plusButton.addEventListener("click", function () {
                    var currentValue = parseInt(quantityInput.value, 10);

                    if (currentValue < stock) {
                        var newValue = currentValue + 1;

                        quantityInput.value = newValue;
                    }
                });

                minusButton.addEventListener("click", function () {
                    var currentValue = parseInt(quantityInput.value, 10);

                    var newValue = Math.max(currentValue - 1, 1);

                    quantityInput.value = newValue;
                });


            });


        </script>

        <script>
            const thumbnailImages = document.querySelectorAll(".thumbnail");
            let currentThumbnailIndex = 0;

            const prevButton = document.getElementById("prevButton");
            const nextButton = document.getElementById("nextButton");
            if (thumbnailImages.length === 0) {
                prevButton.style.display = "none";
                nextButton.style.display = "none";
            }
// Hàm để cập nhật danh sách ảnh hiển thị
            function updateThumbnailDisplay() {
                // Ẩn tất cả các ảnh thu nhỏ
                thumbnailImages.forEach(thumbnail => {
                    thumbnail.style.display = "none";
                });

                // Hiển thị 5 ảnh liên tiếp bắt đầu từ currentThumbnailIndex
                for (let i = 0; i < 5; i++) {
                    const index = (currentThumbnailIndex + i) % thumbnailImages.length;
                    thumbnailImages[index].style.display = "block";
                }
                if (thumbnailImages.length !== 0) {

                    // Ẩn/hiện nút "Next" và "Prev" dựa trên vị trí của ảnh hiện tại
                    if (currentThumbnailIndex === 0) {
                        prevButton.style.display = "none";
                    } else {
                        prevButton.style.display = "block";
                    }

                    if (currentThumbnailIndex + 4 >= thumbnailImages.length - 1) {
                        nextButton.style.display = "none";
                    } else {
                        nextButton.style.display = "block";
                    }
                }
            }

            nextButton.addEventListener("click", () => {
                currentThumbnailIndex = (currentThumbnailIndex + 1) % thumbnailImages.length;
                updateThumbnailDisplay();
            });

            prevButton.addEventListener("click", () => {
                currentThumbnailIndex = (currentThumbnailIndex - 1 + thumbnailImages.length) % thumbnailImages.length;
                updateThumbnailDisplay();
            });




// phần ảnh của product
            updateThumbnailDisplay();




//-------------- chọn ảnh từ thanh nhỏ
            const selectedImage = document.querySelector(".selected-image");

            thumbnailImages.forEach(thumbnail => {
                thumbnail.addEventListener("click", () => {
                    // Lấy nguồn ảnh từ thuộc tính data-src
                    const newImageSrc = thumbnail.getAttribute("data-src");

                    // Đặt nguồn ảnh mới cho thẻ ảnh lớn
                    selectedImage.setAttribute("src", newImageSrc);
                });
            });
        </script>
    </body>
</html>

