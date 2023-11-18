<%-- 
    Document   : bill
    Created on : 27-Oct-2023, 00:17:47
    Author     : Pham Thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <style>
            .body-main {
                background: #ffffff;
                border-bottom: 15px solid #1E1F23;
                border-top: 15px solid #1E1F23;
                margin-top: 30px;
                margin-bottom: 30px;
                padding: 40px 30px !important;
                position: relative;
                box-shadow: 0 1px 21px #808080;
                font-size: 10px;
            }

            .main thead {
                background: #1E1F23;
                color: #fff;
            }

            .img {
                height: 100px;
            }

            h1 {
                text-align: center;
            }
        </style>
    </head>
    <body style="box-sizing: border-box;
                margin: 0;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #212529;
                text-align: left;
                background-color: #fff;
                min-width: 992px!important;">

        <div class="container">
            <div class="page-header">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 col-md-offset-3 body-main">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-4">
                                    <img class="img" alt="Invoce Template" src="img/new.png" />
                                </div>
                                <div class="col-md-8 text-right">
                                    <h4 style="color: #F81D2D;"><strong>DuDu Inc</strong></h4>
                                    <p>Wall Street, New York, NY 10005, America Đình</p>
                                    <p>0988666888</p>
                                    <p>DuDuShopCompany@gmail.com</p>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <h2>INVOICE</h2>
                                    <h5>#${order.orderID}</h5>
                                </div>
                            </div>
                            <br />
                            <div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><h5>Product</h5></th>
                                            <th><h5>Quantity</h5></th>
                                            <th><h5>Amount</h5></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="l">
                                            <tr>
                                                <td class="col-md-6">${l.product.name}( ${l.type} ${l.size} )</td>
                                                <td class="col-md-3">${l.quantity}</td>
                                                <td class="col-md-3"> ${l.quantity*l.product.price} </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td ></td>
                                            <td class="text-right">
                                                <p><strong>Bill: </strong></p>
                                                <p><strong>${order.ship}:</strong></p>
                                                <p><strong>Discount: </strong></p>
                                            </td>
                                            <td>
                                                <p><strong> ${bill} </strong></p>
                                                <p><strong> ${ship}</strong></p>
                                                <p><strong> ${order.discount} </strong></p>
                                            </td>
                                        </tr>
                                        <tr style="color: #F81D2D;">
                                            <td ></td>
                                            <td class="text-right"><h4><strong>Total:</strong></h4></td>
                                            <td class="text-left"><h4><strong> ${order.total} </strong></h4></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div>
                                <div class="col-md-12">
                                    <p><b>Date :</b> ${order.date}</p>
                                    <br />
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Signature</b></p>
                                    <img style="width:30%" src="img/chuki.png"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </div>

    </body>
</html>

