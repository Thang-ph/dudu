<%-- 
    Document   : checkout
    Created on : 18-Oct-2023, 01:57:23
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
        <link rel="stylesheet" href="css/checkout.css"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

    </head>
    <body>
        <div class=" container-fluid my-5 ">
            <div class="row justify-content-center ">
                <div class="col-xl-10">
                    <div class="card shadow-lg ">
                        <div class="row p-2 mt-3 justify-content-between mx-sm-2">
                            <div class="col">
                                <p class="text-muted space mb-0 shop">DuDu Inc.</p> 
                                <p class="text-muted space mb-0 shop">Wall Street, New York, NY 10005, America</p>   
                            </div>
                            <div class="col">
                                <div class="row justify-content-start ">
                                    <div class="col">
                                        <img class="irc_mi img-fluid cursor-pointer " src="img/new.png"  width="70" height="70" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <img class="irc_mi img-fluid bell" src="https://i.imgur.com/uSHMClk.jpg" width="30" height="30"  >
                            </div>
                        </div>
                        <div class="row  mx-auto justify-content-center text-center">
                            <div class="col-12 mt-3 ">
                                <nav aria-label="breadcrumb" class="second ">
                                    <ol class="breadcrumb indigo lighten-6 first  ">
                                        <li class="breadcrumb-item font-weight-bold "><a class="black-text text-uppercase " href="shop"><span class="mr-md-3 mr-1">BACK TO SHOP</span></a><i class="fa fa-angle-double-right " aria-hidden="true"></i></li>
                                        <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase" href="show"><span class="mr-md-3 mr-1">SHOPPING BAG</span></a><i class="fa fa-angle-double-right text-uppercase " aria-hidden="true"></i></li>
                                        <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase active-2" ><span class="mr-md-3 mr-1">CHECKOUT</span></a></li>
                                    </ol>
                                </nav>
                            </div>
                        </div>

                        <div class="row justify-content-around">
                            <div class="col-md-5">
                                <div class="card border-0">
                                    <div class="card-header pb-0">
                                        <h2 class="card-title space ">Checkout</h2>
                                        <p class="card-text text-muted mt-4  space">SHIPPING DETAILS</p>
                                        <hr class="my-0">
                                    </div>
                                    <div class="card-body">
                                        <form action="pay"  id="form">
                                            <input hidden value="${count}" name="count"/>
                                            <input hidden value="${code}" name="code"/>
                                            <input hidden value="${id}" name="id"/>
                                            <input hidden value="${bill}" name="bill"/>
                                            <input hidden value="${shipper}" name="shipper"/>
                                            <div class="row justify-content-between">
                                                <div class="col-auto mt-0"><p><b>${shipper}</b></p></div>
                                                <!--<div class="col-auto"><p><b>DuDuShopcompany@gmail.com</b> </p></div>-->
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col"><p class="text-muted mb-2">Shipping Detail</p><hr class="mt-0"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NAME" class="small text-muted mb-1">Address</label>
                                                <input type="text" class="form-control form-control-sm" name="address" id="NAME" aria-describedby="helpId" value="${sessionScope.account.address}">
                                            </div>
                                            <div class="form-group">
                                                <label for="NAME" class="small text-muted mb-1">Phone</label>
                                                <input type="text" class="form-control form-control-sm" name="phone" id="NAME" aria-describedby="helpId" value="${sessionScope.account.phone}">
                                            </div>
                                            <div class="row no-gutters">
                                                <div class="col-sm-12 pr-sm-2">
                                                    <div class="form-group">
                                                        <label for="NAME" class="small text-muted mb-1">Note</label>

                                                        <input type="text" class="form-control form-control-sm" name="note" id="NAME" aria-describedby="helpId" placeholder="Message for seller">
                                                    </div>
                                                </div>
                                                <!--                                    <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                            <label for="NAME" class="small text-muted mb-1">CVC CODE</label>
                                                                                            <input type="text" class="form-control form-control-sm" name="NAME" id="NAME" aria-describedby="helpId" placeholder="183">
                                                                                        </div>
                                                                                    </div>-->
                                            </div>
                                        </form>
                                        <!--                                <div class="row mb-md-5">
                                                                            <div class="col">
                                                                                <button type="button" name="" id="" class="btn  btn-lg btn-block ">PURCHASE $37 SEK</button>
                                                                            </div>
                                                                        </div>    -->
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="card border-0 ">
                                    <div class="card-header card-2">
                                        <p class="card-text text-muted mt-md-4  mb-2 space">YOUR ORDER <a href="show"><span class=" small text-muted ml-2 cursor-pointer">EDIT SHOPPING CART</span></a> </p>
                                        <hr class="my-2">
                                    </div>
                                    <div class="card-body pt-0">
                                        <c:forEach items="${selectedItem}" var="i">
                                            <div class="row  justify-content-between">
                                                <div class="col-auto col-md-7">
                                                    <div class="media flex-column flex-sm-row">
                                                        <img class=" img-fluid" src="${i.product.image}" width="62" height="62">
                                                        <div class="media-body  my-auto">
                                                            <div class="row ">
                                                                <div class="col-auto"><p class="mb-0"><b>${i.product.name}</b></p><small class="text-muted"> Phân loại hàng:<br/>${i.type} &nbsp; ${i.size}
                                                                    </small></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" pl-0 flex-sm-col col-auto  my-auto"> <p class="boxed-1">${i.quantity}</p></div>
                                                <div class=" pl-0 flex-sm-col col-auto  my-auto "><p><b><fmt:formatNumber pattern="###,### ₫">${i.quantity*i.product.price}</fmt:formatNumber></b></p></div>
                                                </div>
                                                <hr class="my-2">
                                        </c:forEach>

                                        <div class="row ">
                                            <div class="col">
                                                <div class="row justify-content-between">
                                                    <div class="col-4"><p class="mb-1"><b>Price</b></p></div>
                                                    <div class="flex-sm-col col-auto"><p class="mb-1"><b><fmt:formatNumber pattern="###,### ₫">${total}</fmt:formatNumber></b></p></div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col"><p class="mb-1"><b>Shipping fee</b></p></div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1"><b><fmt:formatNumber pattern="###,### ₫">${shipping}</fmt:formatNumber></b></p></div>
                                                    </div>
                                                    <div style="color: #de3a3a;" class="row justify-content-between">
                                                        <div class="col"><p class="mb-1"><b>Discount</b></p></div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1"><b><fmt:formatNumber pattern="##.# %">${voucher.discount}</fmt:formatNumber></b></p></div>
                                                    </div>
                                                    <hr class="my-2">
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p ><b>Total</b></p></div>
                                                        <div class="flex-sm-col col-auto"><p  class="mb-1"><b><fmt:formatNumber pattern="###,### ₫">${(total+shipping)*(1-voucher.discount)}</fmt:formatNumber></b></p> </div>
                                                </div><hr class="my-0">
                                            </div>
                                        </div>
                                        <div class="row mb-5 mt-4 ">
                                            <div class="col">
                                                <button type="button" id="orderButton" class="btn btn-lg btn-block">ORDER</button>

                                            </div>
                                            <!--<div class="col-md-7 col-lg-6 mx-auto"><button type="button" class="btn btn-block btn-outline-primary btn-lg">ADD GIFT CODE</button></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.getElementById("orderButton").addEventListener("click", function () {
                var form = document.getElementById("form");
                form.submit();
            });
        </script>
    </body>
</html>



