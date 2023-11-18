<%-- 
    Document   : tracking
    Created on : 26-Oct-2023, 16:50:38
    Author     : Pham Thang
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DuDu- Do shop, Do Share</title>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link rel="stylesheet" href="css/tracking.css"/>
        <style>
            .product {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #000;
                padding: 10px 0;
            }

            .product img {
                width: 6%;
            }

            .product .details {
                flex: 1;
                padding-left: 10px;
            }

            .product .details .name {
                font-weight: bold;
            }

            .product .details .kind {
                font-size: smaller;
                color: gray;
            }


            .product .details .quantity {
                font-size: smaller;
            }

            .product .total {
                color: red;
            }
            .step-icon-wrap:hover .step-icon {
                background-color: lightpink !important;
                color: white !important;
                border: gray;
            }
            .base {
                color: red; /* Màu chữ đỏ */
                text-decoration: line-through; /* Gạch chèo ngang chữ */
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

                        <div class="btn btn-default" id="shopping-cart-btn">
                            <a href="shop"> <i style="color: lightpink;" class="fas fa-shopping-cart"></i></a>
                        </div>
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
        <div class="container padding-bottom-3x mb-1">
            <div class="card mb-3">
                <div class="p-4 text-center text-white text-lg bg-dark rounded-top"><span class="text-uppercase">Tracking Order</span><span class="text-medium"></span></div>
                <div class="d-flex flex-wrap flex-sm-nowrap justify-content-between py-3 px-2 bg-secondary">
                    <div class="w-100 text-center py-1 px-2"><span class="text-medium">Shipped Via:</span>Giaohangcucnhanh</div>
                    <div class="w-100 text-center py-1 px-2"><span class="text-medium">Status:</span> Checking Quality</div>
                    <!--<div class="w-100 text-center py-1 px-2"><span class="text-medium">Expected Date:</span> SEP 09, 2017</div>-->
                </div>
                <div class="card-body">
                    <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x">
                        <div class="step completed">
                            <div class="step-icon-wrap">
                                <div class="step-icon"><i class="pe-7s-clock"></i></div>
                            </div>
                            <h4 class="step-title">Confirmation Waiting</h4>
                        </div>
                        <div class="step">
                            <div class="step-icon-wrap">
                                <div class="step-icon"><i class="pe-7s-cart"></i></div>
                            </div>
                            <h4 class="step-title">Confirmed Order</h4>
                        </div>
                        <div class="step">
                            <div class="step-icon-wrap">
                                <div class="step-icon"><i class="pe-7s-config"></i></div>
                            </div>
                            <h4 class="step-title">Processing Order</h4>
                        </div>
                        <div class="step">
                            <div class="step-icon-wrap">
                                <div class="step-icon"><i class="pe-7s-car"></i></div>
                            </div>
                            <h4 class="step-title">Product Dispatched</h4>
                        </div>
                        <div class="step">
                            <div class="step-icon-wrap">
                                <div class="step-icon"><i class="pe-7s-home"></i></div>
                            </div>
                            <h4 class="step-title">Product Delivered</h4>
                        </div>
                    </div>
                    <div class="step-content">
                        <div>
                            <c:forEach items="${pending}" var="p">
                                <div class="product">

                                    <img src="${p.product.image}" />
                                    <div class="details">
                                        <div class="name">${p.product.name}</div>
                                        <div class="kind">Phân loại hàng: ${p.type} ${p.size}</div>
                                        <div class="quantity">x${p.quantity}</div>
                                    </div>
                                    <!--<div style="padding-right: 600px"><a href="trackingDetail?listID=${p.listID}"><h4>Detail</h4></a></div>-->
                                    <div class="total">
                                        <div class="base">
                                            <c:set value="${p.order.ship}" var="shipping" />
                                            <c:set var="ship" value="0" />

                                            <c:choose>
                                                <c:when test="${not empty shipping}">
                                                    <c:choose>
                                                        <c:when test="${shipping eq 'Standard-Delivery'}">
                                                            <c:set var="ship" value="20000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Fast-Delivery'}">
                                                            <c:set var="ship" value="30000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Express Delivery'}">
                                                            <c:set var="ship" value="40000" />
                                                        </c:when>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>


                                            <fmt:formatNumber pattern="###,### ₫">${p.product.price*p.quantity}</fmt:formatNumber>
                                            <div>+  <fmt:formatNumber pattern="###,### ₫">${ship}</fmt:formatNumber></div>      
                                            </div>
                                            <br/>

                                            <div class="after">
                                            <fmt:formatNumber pattern="###,### ₫">${(p.product.price*p.quantity+20000)*(1-p.order.discount)}</fmt:formatNumber></div>

                                        </div>
                                    </div>
                            </c:forEach>
                        </div>

                        <div>
                            <c:forEach items="${confirmed}" var="p">
                                <div class="product">

                                    <img src="${p.product.image}" />
                                    <div class="details">
                                        <div class="name">${p.product.name}</div>
                                        <div class="kind">Phân loại hàng: ${p.type} ${p.size}</div>
                                        <div class="quantity">x${p.quantity}</div>
                                    </div>
                                   <!--<div style="padding-right: 600px"><a href="trackingDetail?listID=${p.listID}"><h4>Detail</h4></a></div>-->
                                    <div class="total">
                                        <div class="base">
                                            <c:set value="${p.order.ship}" var="shipping" />
                                            <c:set var="ship" value="0" />

                                            <c:choose>
                                                <c:when test="${not empty shipping}">
                                                    <c:choose>
                                                        <c:when test="${shipping eq 'Standard-Delivery'}">
                                                            <c:set var="ship" value="20000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Fast-Delivery'}">
                                                            <c:set var="ship" value="30000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Express Delivery'}">
                                                            <c:set var="ship" value="40000" />
                                                        </c:when>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>


                                            <fmt:formatNumber pattern="###,### ₫">${p.product.price*p.quantity}</fmt:formatNumber>
                                            <div>+  <fmt:formatNumber pattern="###,### ₫">${ship}</fmt:formatNumber></div>      
                                            </div>
                                            <br/>

                                            <div class="after">
                                            <fmt:formatNumber pattern="###,### ₫">${(p.product.price*p.quantity+20000)*(1-p.order.discount)}</fmt:formatNumber></div>

                                        </div>
                                    </div>
                            </c:forEach>
                        </div>
                        <div>
                            <c:forEach items="${processing}" var="p">
                                <div class="product">

                                    <img src="${p.product.image}" />
                                    <div class="details">
                                        <div class="name">${p.product.name}</div>
                                        <div class="kind">Phân loại hàng: ${p.type} ${p.size}</div>
                                        <div class="quantity">x${p.quantity}</div>
                                    </div>
                                     <!--<div style="padding-right: 600px"><a href="trackingDetail?listID=${p.listID}"><h4>Detail</h4></a></div>-->
                                    <div class="total">
                                        <div class="base">
                                            <c:set value="${p.order.ship}" var="shipping" />
                                            <c:set var="ship" value="0" />

                                            <c:choose>
                                                <c:when test="${not empty shipping}">
                                                    <c:choose>
                                                        <c:when test="${shipping eq 'Standard-Delivery'}">
                                                            <c:set var="ship" value="20000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Fast-Delivery'}">
                                                            <c:set var="ship" value="30000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Express Delivery'}">
                                                            <c:set var="ship" value="40000" />
                                                        </c:when>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>


                                            <fmt:formatNumber pattern="###,### ₫">${p.product.price*p.quantity}</fmt:formatNumber>
                                            <div>+  <fmt:formatNumber pattern="###,### ₫">${ship}</fmt:formatNumber></div>      
                                            </div>
                                            <br/>

                                            <div class="after">
                                            <fmt:formatNumber pattern="###,### ₫">${(p.product.price*p.quantity+20000)*(1-p.order.discount)}</fmt:formatNumber></div>

                                        </div>
                                    </div>
                            </c:forEach>
                        </div>
                        <div>
                            <c:forEach items="${dispatched}" var="p">
                                <div class="product">

                                    <img src="${p.product.image}" />
                                    <div class="details">
                                        <div class="name">${p.product.name}</div>
                                        <div class="kind">Phân loại hàng: ${p.type} ${p.size}</div>
                                        <div class="quantity">x${p.quantity}</div>
                                    </div>
                                     <!--<div style="padding-right: 600px"><a href="trackingDetail?listID=${p.listID}"><h4>Detail</h4></a></div>-->
                                    <div class="total">
                                        <div class="base">
                                            <c:set value="${p.order.ship}" var="shipping" />
                                            <c:set var="ship" value="0" />

                                            <c:choose>
                                                <c:when test="${not empty shipping}">
                                                    <c:choose>
                                                        <c:when test="${shipping eq 'Standard-Delivery'}">
                                                            <c:set var="ship" value="20000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Fast-Delivery'}">
                                                            <c:set var="ship" value="30000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Express Delivery'}">
                                                            <c:set var="ship" value="40000" />
                                                        </c:when>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>


                                            <fmt:formatNumber pattern="###,### ₫">${p.product.price*p.quantity}</fmt:formatNumber>
                                            <div>+  <fmt:formatNumber pattern="###,### ₫">${ship}</fmt:formatNumber></div>      
                                            </div>
                                            <br/>

                                            <div class="after">
                                            <fmt:formatNumber pattern="###,### ₫">${(p.product.price*p.quantity+20000)*(1-p.order.discount)}</fmt:formatNumber></div>

                                        </div>
                                    </div>
                            </c:forEach>
                        </div>
                        <div>
                            <c:forEach items="${delivered}" var="p">
                                <div class="product">

                                    <img src="${p.product.image}" />
                                    <div class="details">
                                        <div class="name">${p.product.name}</div>
                                        <div class="kind">Phân loại hàng: ${p.type} ${p.size}</div>
                                        <div class="quantity">x${p.quantity}</div>
                                    </div>
                                    <div style="padding-right: 600px"><a href="complete?listID=${p.listID}"><h4>Received the products</h4></a></div>
                                    <div class="total">
                                        <div class="base">
                                            <c:set value="${p.order.ship}" var="shipping" />
                                            <c:set var="ship" value="0" />

                                            <c:choose>
                                                <c:when test="${not empty shipping}">
                                                    <c:choose>
                                                        <c:when test="${shipping eq 'Standard-Delivery'}">
                                                            <c:set var="ship" value="20000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Fast-Delivery'}">
                                                            <c:set var="ship" value="30000" />
                                                        </c:when>
                                                        <c:when test="${shipping eq 'Express Delivery'}">
                                                            <c:set var="ship" value="40000" />
                                                        </c:when>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>


                                            <fmt:formatNumber pattern="###,### ₫">${p.product.price*p.quantity}</fmt:formatNumber>
                                            <div>+  <fmt:formatNumber pattern="###,### ₫">${ship}</fmt:formatNumber></div>      
                                            </div>
                                            <br/>

                                            <div class="after">
                                            <fmt:formatNumber pattern="###,### ₫">${(p.product.price*p.quantity+20000)*(1-p.order.discount)}</fmt:formatNumber></div>

                                        </div>
                                    </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>
            <div class="d-flex flex-wrap flex-md-nowrap justify-content-center justify-content-sm-between align-items-center">
                <div class="custom-control custom-checkbox mr-3">
                    <input class="custom-control-input" type="checkbox" id="notify_me" checked="">
                    <label class="custom-control-label" for="notify_me">Notify me when order is delivered</label>
                </div>
                <div class="text-left text-sm-right"><a class="btn btn-outline-primary btn-rounded btn-sm" href="orderDetails" data-toggle="modal" data-target="#orderDetails">View Order Details</a></div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                const stepIcons = document.querySelectorAll(".step-icon");
                const stepContents = document.querySelectorAll(".step-content > div");

                stepIcons.forEach((icon, index) => {
                    icon.addEventListener("click", () => {
                        // Loại bỏ lớp "selected" từ tất cả các biểu tượng bước
                        stepIcons.forEach((icon) => {
                            icon.parentElement.parentElement.classList.remove("selected");
                        });

                        // Ẩn tất cả các nội dung
                        stepContents.forEach((content) => {
                            content.style.display = "none";
                        });

                        // Hiển thị nội dung tương ứng với biểu tượng được nhấn
                        stepContents[index].style.display = "block";

                        // Thêm lớp "completed" cho tất cả các bước từ đầu đến bước đã chọn (bao gồm bước đã chọn)
                        const steps = document.querySelectorAll(".step");
                        for (let i = 0; i <= index; i++) {
                            steps[i].classList.add("completed");
                        }

                        // Thêm lớp "selected" cho bước đã chọn
                        icon.parentElement.parentElement.classList.add("selected");

                        // Loại bỏ lớp "completed" từ tất cả các bước sau bước đã chọn
                        for (let i = index + 1; i < steps.length; i++) {
                            steps[i].classList.remove("completed");
                        }
                    });
                });
            });

        </script>
    </body>
</html>

