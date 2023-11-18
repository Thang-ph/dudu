<%-- 
    Document   : shop
    Created on : Sep 19, 2023, 10:39:15 AM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <title>DuDu- Do shop, Do Share</title>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link rel="stylesheet" href="css/shop.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.1/nouislider.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.1/nouislider.min.js"></script>
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
                            <i style="color: lightpink;" class="fas fa-shopping-cart"></i>
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
                        <div class="btn btn-default" id="profile-button">
                            <a href="userprofile?userID=${sessionScope.account.userID}">  <i style="color: lightpink;" class="fas fa-user"></i></a>
                        </div>

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
        <div class="wrapper">

            <div class="d-md-flex align-items-md-center ">
                <div class="breadcrumb">

                    <a href="home"><i class="fas fa-home"></i> &nbsp; Home</a> &nbsp; > &nbsp; <span class="gray">Shop</span>
                </div>
                <div style="padding-left: 150px" class="d-lg-flex align-items-lg-center pt-2">
                    <!--                <div class="form-inline d-flex align-items-center my-2 mr-lg-2 radio bg-light border">  <label class="options">Order by  </label> </div>
                                    <div class="form-inline d-flex align-items-center my-2 checkbox bg-light border mx-lg-2"> <label class="tick">Popular <input type="checkbox" checked="checked"> <span class="check"></span> </label>  </div>
                                    <div class="form-inline d-flex align-items-center my-2 checkbox bg-light border mx-lg-2"> <label class="tick">New <input type="checkbox"> <span class="check"></span> </label> </div>-->
                    <div class="form-inline d-flex align-items-center my-2 checkbox bg-light border mx-lg-2"> 
                        <select name="option" id="country" class="bg-light"  onchange="submitForm">
                            <option hidden value="0" ${requestScope.option == 0 ? 'selected' : ''}>Sort the shop</option>
                            <option value="1" ${requestScope.option == 1 ? 'selected' : ''}>Rate ↓</option>
                            <option value="2" ${requestScope.option == 2 ? 'selected' : ''}>Rate ↑</option>
                            <option value="3" ${requestScope.option == 3 ? 'selected' : ''}>Price ↓</option>
                            <option value="4" ${requestScope.option == 4 ? 'selected' : ''}>Price ↑</option>
                        </select>


                    </div>

                </div>
                <div class="search">
                    <input value="${requestScope.search}" type="text" id="search" name="search" class="search_input form-control" placeholder="Search">
                    <span class="search_icon">
                        <i class="fas fa-search"></i>
                    </span>
                </div>
                <div class="ml-auto d-flex align-items-center views">
                    <button  style="border: none;${requestScope.grid==9?'background-color: #FFC0CB;':'background-color: transparent;'} " id="grid1" onclick="submitForm(9)">
                        <span class="btn">
                            <span class="fas fa-th px-md-2 px-1"></span>
                            <span>Small grid</span>
                        </span>
                    </button>

                    <!-- Nút 2 -->
                    <button style="border: none; ${requestScope.grid==6?'background-color: #FFC0CB;':'background-color: transparent;'}" id="grid2" onclick="submitForm(6)">
                        <span class="btn">
                            <span class="fas fa-th-large"></span>
                            <span class="px-md-2 px-1">Big grid</span>
                        </span>
                    </button>
                    <span class="green-label px-md-2 px-1">${requestScope.countProduct}</span> <span class="text-muted">Products</span> </div>
            </div>

            <!--            <div class="d-sm-flex align-items-sm-center pt-2 clear">
                            <div class="text-muted filter-label">Applied Filters:</div>
                            <div class="green-label font-weight-bold p-0 px-1 mx-sm-1 mx-0 my-sm-0 my-2">Selected Filtre <span class=" px-1 close">&times;</span> </div>
                            <div class="green-label font-weight-bold p-0 px-1 mx-sm-1 mx-0">Selected Filtre <span class=" px-1 close">&times;</span> </div>
                        </div>-->
            <div class="filters"> <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#mobile-filter" aria-expanded="true" aria-controls="mobile-filter">Filter<span class="px-1 fas fa-filter"></span></button> </div>
            <!--            <div id="mobile-filter">
                            <div class="py-3">
                                <h5 class="font-weight-bold">Categories</h5>
                                <ul class="list-group">
            
            <c:forEach items="${requestScope.c}" var="c" varStatus="i">
                <a>
                    <li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category">
                ${c.name}
                <span class="badge badge-primary badge-pill">${requestScope.countCate[i.index]}</span>
            </li>
        </a>
            </c:forEach>

        </ul>
    </div>
                    <div class="py-3">
                        <h5 class="font-weight-bold">Brands</h5>
                        <form class="brand">
                            <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Royal Fields <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Crasmas Fields <input type="checkbox" checked> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Vegetarisma Farm <input type="checkbox" checked> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Farmar Field Eve <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-1"> <label class="tick">True Farmar Steve <input type="checkbox"> <span class="check"></span> </label> </div>
                        </form>
                    </div>
                    <div class="py-3">
                        <h5 class="font-weight-bold">Rating</h5>
                        <form class="rating">
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                            <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"> <span class="check"></span> </label> </div>
                        </form>
                    </div>
</div>-->
            <div class="content py-md-0 py-3 row">
                <section id="sidebar" class="col-lg-3 col-md-3">
                    <div class="py-3">
                        <h5 class="font-weight-bold">Categories</h5>
                        <ul class="list-group">
                            <ul class="list-group">
                                <li value="0" style="${requestScope.categoryID==0?'background-color: rgb(240, 240, 240)':''} "  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category" >Tất cả <span class="badge badge-primary badge-pill">${requestScope.countProduct}</span></li>
                                    <c:forEach items="${requestScope.c}" var="c" varStatus="i">
                                    <li style="${requestScope.categoryID==i.index+1?'background-color: rgb(240, 240, 240)':''} " value="${c.categoryID}" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category">
                                        ${c.name}
                                        <span class="badge badge-primary badge-pill">${requestScope.countCate[i.index]}</span>
                                    </li>
                                </c:forEach>

                            </ul>
                        </ul>
                    </div>
                    <div class="py-3">
                        <h5 style="padding-bottom: 20px"  class="font-weight-bold">Price</h5>
                        <ul class="list-group">
                            <ul class="list-group">

                                <div class="input-container">
                                    <label style="margin-top: 7px" for="from">From:</label>
                                    <input  <c:if test="${requestScope.from != 0}">value="${from}"</c:if> type="number" id="from" name="from" oninput="this.value = this.value.replace(/[^0-9]/g, '');" class="custom-input">
                                        <label style="margin-top: 7px;padding-left: 20px" for="to">To:</label>
                                        <input <c:if test="${requestScope.to != 0}">value="${to}"</c:if> type="number" id="to" name="to" class="custom-input" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                                    </div>
                                    <h6 id="error-msg" style="color: red; padding-top: 10px; display: none;">Hãy điền khoảng giá phù hợp</h6>



                                </ul>
                            </ul>
                        </div>
                        <div class="py-3">
                            <label class="custom-input">
                                <i style="margin-left: 5px" class="fas fa-filter"></i>
                                <input id="submit1" style="padding-left: 33px" type="submit" value="Filter" class="input-with-icon">
                            </label>
                        </div>
                        <div class="py-3">
                            <h5 style="padding-bottom: 20px" class="font-weight-bold">Rate</h5>
                            <ul class="list-group">
                                <ul class="list-group">

                                    <div id="slider"></div>
                                    <div  class="input-and-stars">
                                        <input  readonly type="text" name="minRate" id="min-input" value="${requestScope.minRate}">
                                    <i style="margin-top: 19px" class="fas fa-star text-warning"></i>
                                    <input style="margin-left: 80px;margin-top: 19px"  readonly type="text" name="maxRate" id="max-input" value="${requestScope.maxRate}">
                                    <i style="margin-top: 19px" class="fas fa-star text-warning"></i>
                                </div>





                            </ul>
                        </ul>
                    </div>
                    <div class="py-3">
                        <label class="custom-input">
                            <i style="margin-left: 5px" class="fas fa-filter"></i>
                            <input style="padding-left: 33px;" id="submit2"  type="submit" value="Filter" class="input-with-icon">
                        </label>
                    </div>
                    <form action="shop">
                        <div class="py-3" >
                            <label class="custom-input">
                                <input style="padding:10px 80px"  type="submit" value="Reset all" class="input-with-icon">
                            </label>
                        </div>
                    </form>
                    <!--                    <div class="py-3">
                                            <h5 class="font-weight-bold">Brands</h5>
                                            <form class="brand">
                                                <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Royal Fields <input type="checkbox"> <span class="check"></span> </label> </div>
                                                <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Crasmas Fields <input type="checkbox" checked> <span class="check"></span> </label> </div>
                                                <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Vegetarisma Farm <input type="checkbox" checked> <span class="check"></span> </label> </div>
                                                <div class="form-inline d-flex align-items-center py-1"> <label class="tick">Farmar Field Eve <input type="checkbox"> <span class="check"></span> </label> </div>
                                                <div class="form-inline d-flex align-items-center py-1"> <label class="tick">True Farmar Steve <input type="checkbox"> <span class="check"></span> </label> </div>
                                            </form>
                                        </div>-->
                    <!--                    <div class="py-3">
                                            <h5 class="font-weight-bold">Ratinggggggg</h5>
                                            <form class="rating">
                                                <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <input type="checkbox" id="rating1"> <span class="check"></span> </label> </div>
                                                <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox" id="rating2"> <span class="check"></span> </label> </div>
                                                <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"  id="rating3"> <span class="check"></span> </label> </div>
                                                <div class="form-inline d-flex align-items-center py-2"> <label class="tick"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"  id="rating4"> <span class="check"></span> </label> </div>
                                                <div class="form-inline d-flex align-items-center py-2"> <label class="tick"> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <input type="checkbox"  id="rating5"> <span class="check"></span> </label> </div>
                                            </form>
                                        </div>-->
                </section> <!-- Products Section -->
                <section id="products" class="col-lg-9 col-md-9">
                    <div class="container py-3">
                        <div id="content" class="row">
                            <c:forEach items="${requestScope.p}" var="p">
                                <div style="padding-bottom: 30px;" class="${requestScope.grid==9?"col-lg-4":"col-lg-6"} col-md-6 col-sm-10 offset-md-0 offset-sm-1 custom-card">
                                    <a href="product?productID=${p.productID}">
                                        <div class="card"> <img class="card-img-top" src="${p.image}">
                                            <div class="card-body">
                                                <h6 class="font-weight-bold pt-1">${p.name}</h6>
                                                <div class="text-muted description">${p.shop.name}</div>
                                                <div class="d-flex align-items-center product"> ${p.rate}<span class="fas fa-star"> </span></div>
                                                <div class="d-flex align-items-center justify-content-between pt-3">
                                                    <div class="d-flex flex-column">

                                                        <div class="h6 font-weight-bold"><fmt:formatNumber pattern="###,### ₫">${p.price}</fmt:formatNumber></div>
                                                            <!--<div class="text-muted rebate">48.56</div>-->
                                                        </div>
                                                        <div class="btn btn-primary">Buy now</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                            </c:forEach>
                            <!--                            <div class="col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 pt-md-0 pt-4">
                                                            <div class="card"> <img class="card-img-top" src="https://www.freepnglogos.com/uploads/carrot-png/carrot-mint-with-turmeric-chia-equine-pure-delights-12.png">
                                                                <div class="card-body">
                                                                    <h6 class="font-weight-bold pt-1">Product title</h6>
                                                                    <div class="text-muted description">Space for small product description</div>
                                                                    <div class="d-flex align-items-center product"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                                                                    <div class="d-flex align-items-center justify-content-between pt-3">
                                                                        <div class="d-flex flex-column">
                                                                            <div class="h6 font-weight-bold">36.99 USD</div>
                                                                            <div class="text-muted rebate">48.56</div>
                                                                        </div>
                                                                        <div class="btn btn-primary">Buy now</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 pt-lg-0 pt-4">
                                                            <div class="card"> <img class="card-img-top" src="https://www.freepnglogos.com/uploads/tomato-png/tomato-bunch-fresh-tomatoes-png-image-pngpix-24.png">
                                                                <div class="card-body">
                                                                    <h6 class="font-weight-bold pt-1">Product title</h6>
                                                                    <div class="text-muted description">Space for small product description</div>
                                                                    <div class="d-flex align-items-center product"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                                                                    <div class="d-flex align-items-center justify-content-between pt-3">
                                                                        <div class="d-flex flex-column">
                                                                            <div class="h6 font-weight-bold">36.99 USD</div>
                                                                            <div class="text-muted rebate">48.56</div>
                                                                        </div>
                                                                        <div class="btn btn-primary">Buy now</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 pt-lg-4 pt-4">
                                                            <div class="card"> <img class="card-img-top" src="https://www.freepnglogos.com/uploads/grapes-png/grapes-grape-red-transparent-png-stickpng-5.png">
                                                                <div class="card-body">
                                                                    <h6 class="font-weight-bold pt-1">Product title</h6>
                                                                    <div class="text-muted description">Space for small product description</div>
                                                                    <div class="d-flex align-items-center product"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                                                                    <div class="d-flex align-items-center justify-content-between pt-3">
                                                                        <div class="d-flex flex-column">
                                                                            <div class="h6 font-weight-bold">36.99 USD</div>
                                                                            <div class="text-muted rebate">48.56</div>
                                                                        </div>
                                                                        <div class="btn btn-primary">Buy now</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 pt-lg-4 pt-4">
                                                            <div class="card"> <img class="card-img-top" src="https://www.freepnglogos.com/uploads/cucumber-png/cucumber-png-image-purepng-transparent-png-26.png">
                                                                <div class="card-body">
                                                                    <h6 class="font-weight-bold pt-1">Product title</h6>
                                                                    <div class="text-muted description">Space for small product description</div>
                                                                    <div class="d-flex align-items-center product"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                                                                    <div class="d-flex align-items-center justify-content-between pt-3">
                                                                        <div class="d-flex flex-column">
                                                                            <div class="h6 font-weight-bold">36.99 USD</div>
                                                                            <div class="text-muted rebate">48.56</div>
                                                                        </div>
                                                                        <div class="btn btn-primary">Buy now</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1 pt-lg-4 pt-4">
                                                            <div class="card"> <img class="card-img-top" src="https://www.freepnglogos.com/uploads/watermelon-png/watermelon-gea-products-2.png">
                                                                <div class="card-body">
                                                                    <h6 class="font-weight-bold pt-1">Product title</h6>
                                                                    <div class="text-muted description">Space for small product description</div>
                                                                    <div class="d-flex align-items-center product"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                                                                    <div class="d-flex align-items-center justify-content-between pt-3">
                                                                        <div class="d-flex flex-column">
                                                                            <div class="h6 font-weight-bold">36.99 USD</div>
                                                                            <div class="text-muted rebate">48.56</div>
                                                                        </div>
                                                                        <div class="btn btn-primary">Buy now</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul  class="pagination">
                            <li class="page-item">
                                <a onclick="submitForm1(${requestScope.page-1})" ${requestScope.page<2?"hidden":""} class="page-link" href="#" aria-label="Previous">
                                    <span style="color: black;  " aria-hidden="true"><</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>


                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">

                                <li class="page-item"><a onclick="submitForm1(${i})" style="color: black; ${requestScope.page==i?"background-color: lightpink":""}  " class="page-link" >${i}</a></li>
                                </c:forEach>

                            <li class="page-item">
                                <a ${page>=num?"hidden":""} onclick="submitForm1(${requestScope.page+1})"  class="page-link"  aria-label="Next">
                                    <span style="color: black;"  aria-hidden="true">></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </section>

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
        <form hidden="" id="f" action="shop">
            <input name="option" id="optionForm" value="${requestScope.option}" />
            <input name="grid" id="gridForm" value="${requestScope.grid}"/>
            <input name="search" id="searchForm" value="${requestScope.search}"/>
            <input name="page" id="pageForm" value=""/>
            <input name="categoryID" id="cateForm" value="${requestScope.categoryID}"/>
            <input name="from" id="fromForm" value="${requestScope.from}"/>
            <input name="to" id="toForm" value="${requestScope.to}"/>
            <input name="minRate" id="minForm" value="${requestScope.minRate}"/>
            <input name="maxRate" id="maxForm" value="${requestScope.maxRate}"/>
        </form>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>


        <script>

                                    var slider = document.getElementById('slider');
                                    var minInput = document.getElementById('min-input');
                                    var maxInput = document.getElementById('max-input');
                                    var min = <%= request.getAttribute("minRate")%>;
                                    var max = <%= request.getAttribute("maxRate")%>;

                                    noUiSlider.create(slider, {
                                        start: [min, max],
                                        step: 0.1,
                                        connect: true,
                                        range: {
                                            'min': 0,
                                            'max': 5
                                        }
                                    });

                                    slider.noUiSlider.on('update', function (values, handle) {
                                        if (handle === 0) {
                                            minInput.value = values[0];
                                        }
                                        if (handle === 1) {
                                            maxInput.value = values[1];
                                        }
                                    });

                                    minInput.addEventListener('change', function () {
                                        slider.noUiSlider.set([this.value, null]);
                                    });

                                    maxInput.addEventListener('change', function () {
                                        slider.noUiSlider.set([null, this.value]);
                                    });
        </script>
        <script>
            // page-----------------------------------------      
            function submitForm1(pageNumber) {
                var pageInput = document.getElementById('pageForm');

                pageInput.value = pageNumber;

                document.getElementById('f').submit();
            }

        </script>

        <script>
            function submitForm(gridValue) {


                var gridInput = document.getElementById('gridForm');

                gridInput.value = gridValue;

                document.getElementById('f').submit();
            }
        </script>

        <script>
            document.getElementById("search").addEventListener("keyup", function (event) {
                if (event.key === "Enter") {

                    // Lấy giá trị từ thẻ input có id "search"
                    var searchValue = this.value;

                    // Thêm giá trị vào form
                    var searchInput = document.getElementById('searchForm');

                    searchInput.value = searchValue;

                    document.getElementById('f').submit();
                }
            });
        </script>
        <script>
            var select = document.getElementById('country');

            select.addEventListener('change', function () {
                var selectedOption = select.value;

                var optionInput = document.getElementById('optionForm');
                optionInput.value = selectedOption;

                document.getElementById('f').submit();
            });
        </script>
        <script>
            var categoryItems = document.querySelectorAll('.category');

            categoryItems.forEach(function (item) {
                item.addEventListener('click', function () {
                    var categoryID = item.getAttribute('value');

                    var categoryInput = document.getElementById('cateForm');
                    categoryInput.value = categoryID;

                    document.getElementById('f').submit();
                });
            });

        </script>
        <script>
            var fromInput = document.getElementById('from');
            var toInput = document.getElementById('to');
            var errorMsg = document.getElementById('error-msg');
            var submitButton = document.getElementById('submit1');

            submitButton.addEventListener('click', function () {
                var fromValue = parseInt(fromInput.value, 10);
                var toValue = parseInt(toInput.value, 10);

                if (isNaN(fromValue) && isNaN(toValue)) {
                    errorMsg.style.display = 'block';
                } else {
                    errorMsg.style.display = 'none';

                    // Kiểm tra và gán giá trị mặc định
                    if (isNaN(fromValue)) {
                        fromValue = 0;
                    }

                    if (isNaN(toValue)) {
                        toValue = 0;
                    }

                    // Gán giá trị cho các trường form
                    document.getElementById('fromForm').value = fromValue;
                    document.getElementById('toForm').value = toValue;

                    document.getElementById('f').submit();
                }
            });

        </script>
        <script>
            var minRateInput = document.getElementById('min-input');
            var maxRateInput = document.getElementById('max-input');
            var submitButton = document.getElementById('submit2');

            submitButton.addEventListener('click', function () {

                document.getElementById('minForm').value = minRateInput.value;
                document.getElementById('maxForm').value = maxRateInput.value;
                document.getElementById('f').submit();
            });
        </script>
    </body>
</html>

