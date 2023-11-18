<%-- 
    Document   : orderTracking
    Created on : 11-Nov-2023, 06:53:44
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


            .step-icon-wrap:hover .step-icon {
                background-color: lightpink !important;
                color: white !important;
                border: gray;
            }
            .base {
                color: red; /* Màu chữ đỏ */
                text-decoration: line-through; /* Gạch chèo ngang chữ */
            }

        </style>

    </head>
    <body>
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
                                        <div style="padding-right: 400px"><a href="trackingDetail?listID=${p.listID}"><h4>Detail</h4></a> &nbsp;<a href="come?listID=${p.listID}&status=Confirmed"><h4>Come to next step</h4></a> </div>
                                 
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
                                  <div style="padding-right: 400px"><a href="trackingDetail?listID=${p.listID}"><h4>Detail</h4></a> &nbsp;<a href="come?listID=${p.listID}&status=Processing"><h4>Come to next step</h4></a> </div>
                                  
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
                                          <div style="padding-right: 400px"><a href="trackingDetail?listID=${p.listID}"><h4>Detail</h4></a> &nbsp;<a href="come?listID=${p.listID}&status=Dispatched"><h4>Come to next step</h4></a> </div>
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
                                      <div style="padding-right: 400px"><a href="trackingDetail?listID=${p.listID}"><h4>Detail</h4></a> &nbsp;<a href="come?listID=${p.listID}&status=Delivered"><h4>Come to next step</h4></a> </div>
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
                                 <div style="padding-right: 600px"><a href="trackingDetail?listID=${p.listID}"><h4>Detail</h4></a></div>
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

