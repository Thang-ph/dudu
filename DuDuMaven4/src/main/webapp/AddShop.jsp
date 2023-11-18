<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DuDu</title>
        <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/productmanager.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
        <style type="text/css">
            .btn-default{
                color:lightpink;
            }
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px 300px;
                border-radius:1px;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.247);
            }
            .table-title {
                padding-bottom: 15px;
                background: linear-gradient(40deg, #333251, #504F80) !important;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 1px 1px 0 0;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.247);
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 1px;
                border: none;
                outline: none !important;
                margin-left: 10px;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.247);
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 1px;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 1px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 1px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 1px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 1px 1px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 1px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 1px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
            .pageHeader
            {
                background-color: #333251;
                border-bottom: 1px solid gray;
                padding: 5px 0;
                display: flex;
            }

            .search
            {
                display: flex;
                align-items: center;
                border: 1px solid gray;
                border-radius: 20px;
                background-color: whitesmoke;
                max-width: 50%;
                margin: auto;
            }

            .search_input
            {
                border: none;
                border-radius: 20px;
                background-color: whitesmoke;
            }

            .search_input:hover, .search_input:active, .search_input:focus
            {
                border: none;
                box-shadow: none;
                background-color: whitesmoke;
            }

            .search_icon
            {
                color: #967BB6;
                display: block;
                padding: 10px;
                border-left: 1px solid gray ;
            }

            .mb-3 {
                margin-bottom: 1rem;
            }

            .image-input {
                position: relative;
                margin-bottom: 8px;
            }

            .image-input__file {
                display: none;
            }

            .image-input__label {
                max-width: 122px;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 8px 16px;
                background-color: #f0f0f0;
                color: #333;
                border-radius: 4px;
                cursor: pointer;
            }

            .image-input__text {
                font-size: 10px;
                font-weight: bold;
            }

            .image-input__preview {
                width: 122px;
                height: 122px;
                margin-top: 8px;
                background-color: #f0f0f0;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                border-radius: 4px;
            }
            input[type = file]{
                display: none;
            }

            .image-container {
                position: relative;
                display: inline-block;
            }

            .delete-icon {
                position: absolute;
                top: 5px;
                right: 5px;
                cursor: pointer;
                color: red;
                font-size: 18px;
            }

        </style>
    </head>
    <body>
        <div class="pageHeader">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <a href="sv">
                            <img width="11%" src="img/logo.png">
                        </a>
                    </div>
                    <div class="col-sm-6">

                    </div>
                    <div class="col-sm-3">
                        <a href="us" class="upload btn btn-default">Upload</a>

                        <a href="shop">
                            <div class="btn btn-default" id="shopping-cart-btn">
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                        </a>
                        <a href="userprofile">
                            <div class="btn btn-default" id="profile-button">
                                <i class="fas fa-user"></i>
                            </div>
                        </a>
                        <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <div class="btn btn-danger login" >
                            <h6><a href="userprofile?userID=${sessionScope.account.userID}">${sessionScope.account.username}</a></h6>
                        </div>
                        <%
                        } else {
                        %>
                        <div class="btn btn-danger login" >Log In</div>
                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Add New <b>Shop</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="shopManage?userID=${requestScope.userID}" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Cancel</span></a>   
                        </div>
                    </div>
                </div>
                <form style="margin: 20px" action="AddShop" method="post" onsubmit="return validateForm()" name="myForm">
                    <div class="mb-3">
                        <label for="shop-name" class="form-label userlist-header">Shop Name:</label>
                        <input type="text" class="form-control" name="shop-name" placeholder="enter product name"> 
                    </div>
                    <label class="form-label userlist-header">${requestScope.validate}</label>
                    <button type="submit" class="btn btn-danger">Create</button>
                    <input type="text" style="display: none" class="form-control"  name="userID" value="${requestScope.userID}">
                    <div>
                    </div>
                </form>
            </div>
        </div>  
        <script>
            function validateForm() {
                if (document.forms["myForm"]["shop-name"].value.trim() === "") {
                    alert("Name must be filled out");
                    return false;
                }
            }
        </script>
    </body>
</html>  