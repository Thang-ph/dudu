<%-- 
    Document   : cart
    Created on : 07-Oct-2023, 14:48:40
    Author     : Pham Thang
--%>
<%@ page import="model.Shop" %>
<%@ page import="model.Item" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DuDu- Do shop, Do Share</title>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/show.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
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
        <!--        <div class="breadcrumb">
        
                    <a href="home"><i class="fas fa-home"></i> &nbsp; Home</a> &nbsp; > &nbsp; <span class="gray">Shop</span>
                </div>-->
        <div class="card">
            <div class="row">
                <div class="col-md-8 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col"><h4><b>Shopping Cart</b></h4></div>
                            <div class="col align-self-center text-right text-muted">${requestScope.sizeCart} items</div>
                        </div>
                    </div>    
                    <%
                        // Lấy Map itemsByShop từ request 
                        Map<Shop, List<Item>> itemsByShop = (Map<Shop, List<Item>>) request.getAttribute("itemsByShop");
                        int i = 0;
                        int j = -2;
                        // Duyệt qua các shop
                        for (Shop shop : itemsByShop.keySet()) {
                    %>

                    <h5><%= shop.getName()%></h5>

                    <%
                        List<Item> items = itemsByShop.get(shop);
                        // Duyệt danh sách items để in ra
                        for (Item item : items) {
                            i++;
                    %>

                    <div class="row border-top border-bottom">

                        <div class="row main align-items-center">

                            <div class="col-1">
                                <input <%
                                    String whatatype = (String) request.getAttribute("whatatype");
                                    String whatasize = (String) request.getAttribute("whatasize");
                                    int productID = -2;
                                    if (request.getAttribute("productID") != null) {
                                        productID = (int) request.getAttribute("productID");

                                    }
                                    if (item.getType().equals(whatatype) && item.getSize().equals(whatasize) && item.getProduct().getProductID() == productID) {
                                        j = i;
                                        }
                                    %>
                                    class="<%=shop.getName()%>" id="<%=i%>" type="checkbox" name="choice" value="<%= item.getProduct().getPrice() * item.getQuantity()%>"/>


                            </div>

                            <div class="col-2">
                                <img class="img-fluid" src="<%= item.getProduct().getImage()%>">
                            </div>

                            <div class="col-4">
                                <div class="row text-muted">
                                    Phân loại hàng:<br/>
                                    <%= item.getType()%>
                                    <% if (item.getSize() != null) {%>

                                    <%= item.getSize()%>
                                    <% }%>
                                </div>
                                <div class="row"><%= item.getProduct().getName()%></div>
                            </div>

                            <div class="col">
                                <a href="process?productID=<%= item.getProduct().getProductID()%>&type=<%= item.getType()%>&size=<%= item.getSize()%>&num=-1">-</a>
                                &nbsp; <%= item.getQuantity()%> &nbsp;
                                <a href="process?productID=<%= item.getProduct().getProductID()%>&type=<%= item.getType()%>&size=<%= item.getSize()%>&num=1">+</a>  
                            </div>

                            <div class="col">
                                <fmt:formatNumber pattern="###,### ₫"><%= item.getProduct().getPrice() * item.getQuantity()%></fmt:formatNumber>
                                <a href="deleteItem?productID=<%= item.getProduct().getProductID()%>&type=<%= item.getType()%>&size=<%= item.getSize()%>"> <span class="close">&#10005;</span></a> 
                            </div>

                        </div>  

                    </div>

                    <%
                        }
                    %>

                    <%
                        }
                    %>

                    <!--                    <div class="row">
                                            <div class="row main align-items-center">
                                                <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/ba3tvGm.jpg"></div>
                                                <div class="col">
                                                    <div class="row text-muted">Shirt</div>
                                                    <div class="row">Cotton T-shirt</div>
                                                </div>
                                                <div class="col">
                                                    <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                                                </div>
                                                <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                                            </div>
                                        </div>
                                        <div class="row border-top border-bottom">
                                            <div class="row main align-items-center">
                                                <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/pHQ3xT3.jpg"></div>
                                                <div class="col">
                                                    <div class="row text-muted">Shirt</div>
                                                    <div class="row">Cotton T-shirt</div>
                                                </div>
                                                <div class="col">
                                                    <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
                                                </div>
                                                <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                                            </div>
                                        </div>-->
                    <div class="back-to-shop"><a href="shop">&leftarrow;<span >&nbsp;Back to shop</span></a></div>
                </div>
                <div class="col-md-4 summary">
                    <div><h5><b>Summary</b></h5><a href="tracking"><h5><b>Tracking</b></h5></a></div>
                    <hr>
                    <div class="row">
                        <div class="col" style="padding-left:0;">ITEMS <span id="item">0</span></div>
                        <div class="col text-right"> </div>
                    </div>
                    <form>
<!--                        <p>Address</p>
                        <input id="address" placeholder="Enter your address">-->
                        <p>SHIPPING</p>
                        <select name="ship" >
                            <option id="1" value="20000" class="text-muted">Standard-Delivery</option>
                            <option id="2" value="30000"  class="text-muted">Fast-Delivery</option>
                            <option id="3" value="40000"  class="text-muted">Express Delivery</option>
                        </select>
                        <p>GIVE CODE</p>
                        <input id="code" placeholder="Enter your code">
                    </form>
                    <form id="checkout" action="checkout">

                        <div id="totalPrice" class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                            <div class="row">
                                <div class="col-7">Price</div>
                                <input  style="padding-bottom: 8px; border: none; background-color: #ddd" readonly="" class="col-5 text-right" value="0₫"/>
                            </div>
                            <div class="row">
                                <div class="col-7">Shipping fee</div>
                                <input  style="padding-bottom: 8px; border: none; background-color: #ddd" readonly="" class="col-5 text-right" value="0₫"/>
                            </div>
                            <div class="row">
                                <div style="color: #de3a3a;" class="col-7">Discount</div>
                                <input  style="color: #de3a3a; padding-bottom: 8px; border: none; background-color: #ddd" readonly="" class="col-5 text-right" value="0%"/>
                            </div>
                            <div class="row">
                                <div class="col-7">Total Price</div>
                                <input  style="padding-bottom: 8px; border: none; background-color: #ddd" readonly="" class="col-5 text-right" value="0₫"/>
                            </div>
                        </div>
                        <input type="hidden" name="total" id="totalField" value="">
                        <input type="hidden" name="selectedIds" id="selectedIdsField" value="">
                        <input type="hidden" name="ship" id="shipField" value="">
                        <input type="hidden" name="code" id="codeField" value="">
                        <input type="hidden" name="item" id="itemField" value="">
                        <input type="submit" value="CHECKOUT" />
                    </form>
                    <p id="must" hidden style="color: red">You must choose product you want to buy</p>

                </div>
            </div>

        </div>
        <div  class="instagram">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/bia1.png')">
                            <div class="instagram__text">
                                <i class="fab fa-facebook"></i>

                                <a href="https://www.facebook.com/profile.php?id=100014046042231">Du Du</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/bia2.png')">
                            <div class="instagram__text">
                                <i class="fab fa-instagram"></i>

                                <a href="https://www.instagram.com/thangph_2312/">super_adudu</a>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>

            $(document).ready(function () {

                // Khởi tạo biến để lưu tổng giá trị
                var total = 0;
                var item = 0;
                var ship = 1;
                var code = "";
                var selectedIds = "";
//                var countShop = 0;
//                function countSelectedClasses() {
//                    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
//                    const selectedClasses = new Set();
//
//                    checkboxes.forEach(checkbox => {
//                        if (checkbox.checked) {
//                            const checkboxClass = checkbox.className;
//                            selectedClasses.add(checkboxClass);
//                        }
//                    });
//
//                    countShop = selectedClasses.size;
//                }
                $('#code').on('input', function () {
                    code = $(this).val();
                    update(ship, total, code, item);
                });
                $('select[name="ship"]').on('change', function () {
                    var selectedOption = $(this).find('option:selected');
                    ship = parseFloat(selectedOption.attr('id'));
                    update(ship, total, code,item);
                });

                $("#checkout").submit(validateForm);
                $('input[type="checkbox"]').on('click', function () {
                    var checkbox = $(this);
                    var checkboxValue = parseFloat(checkbox.val());
                    var checkboxId = checkbox.attr("id");
                    if (checkbox.is(":checked")) {
                        total += checkboxValue;
                        item++;
                        if (selectedIds) {
                            selectedIds += ":" + checkboxId; // Thêm ID và dấu : vào selectedIds
                        } else {
                            selectedIds = checkboxId; // Nếu selectedIds rỗng, gán ID trực tiếp
                        }

                    } else {
                        total -= checkboxValue;
                        item--;
                        selectedIds = selectedIds.split(":").filter(function (id) {
                            return id !== checkboxId;
                        }).join(":"); // Loại bỏ ID khỏi chuỗi selectedIds
                    }
                    update(ship, total, code, item);


                });
                                 document.getElementById(<%=j%>).click();

                function validateForm(event) {

                    if (item === 0) {
                        event.preventDefault();
                        document.getElementById("must").removeAttribute("hidden");
                    } else {
                        var selectedIdsField = document.getElementById("selectedIdsField");
                        selectedIdsField.value = selectedIds;
                        var totalField = document.getElementById("totalField");
                        totalField.value = total;
                         var totalField = document.getElementById("itemField");
                        itemField.value = item;
//                        var countField = document.getElementById("countField");
//                        countField.value = countShop;
                        var shipField = document.getElementById("shipField");
                        shipField.value = ship;
                        var codeField = document.getElementById("codeField");
                        codeField.value = code;
                    }
                }
                function update(ship, total, code, item) {
                    $.ajax({
                        url: "/DuDuMaven4/choice",
                        type: "get",
                        data: {
                            total: total,
                            ship: ship,
                            code: code,
                            item: item
                        },
                        success: function (data) {
                            var row = document.getElementById("totalPrice");
                            row.innerHTML = data;
                            document.getElementById("item").innerHTML = item;
                        },
                        error: function (xhr) {
                        }
                    });
                }




            });

        </script>
    </body>
</html>


