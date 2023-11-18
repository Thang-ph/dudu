<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DuDu</title>

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
                margin: 30px 0;
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
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #f9f9f9;
                border: 1px solid #ccc;
                padding: 20px;
                width: 300px;
                text-align: center;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function ()
            {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function ()
                {
                    if (this.checked) {
                        checkbox.each(function ()
                        {
                            this.checked = true;
                        });
                    } else
                    {
                        checkbox.each(function ()
                        {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function ()
                {
                    if (!this.checked)
                    {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
            function showDeletePopup() {
                var popup = document.getElementById("deletePopup");
                popup.style.display = "block";
            }

            function hideDeletePopup() {
                var popup = document.getElementById("deletePopup");
                popup.style.display = "none";
            }
        </script>
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
                        <form action="crud" method="get">
                            <div class="search">
                                <input type="text" class="search_input form-control" name="search" placeholder="Search ">
                                <span class="search_icon" type="submit">
                                    <button type="submit" name="shopID" value="${requestScope.shopID}" style="border: none">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
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
                            <h2>Manage <b>Product</b></h2> <h1><a href="orderTracking?shopID=${requestScope.shopID}">Order tracking</a></h1>
                        </div>
                        <div class="col-sm-6">
                            <a href="addp?shopID=${requestScope.shopID}" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Category</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.p}" var="p">
                            <tr>
                                <td class="clickable" onclick="window.location='WarehouseManager?productID=${p.productID}'"><img src="${p.image}" width="50px" height="50px" style="border: solid 1px black; border-radius: 5px"  alt="alt"/></td>
                                <td class="clickable" onclick="window.location='WarehouseManager?productID=${p.productID}'">${p.name}</td>
                                <fmt:formatNumber value="${p.price}" pattern="###,### d" var="fullNumber" />
                                <td class="clickable" onclick="window.location='WarehouseManager?productID=${p.productID}'">${fullNumber}</td>
                                <td class="clickable" onclick="window.location='WarehouseManager?productID=${p.productID}'">${p.category.name}</td>
                                <td>
                                    <a href="updatep?id=${p.productID}&page=${requestScope.page}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="delp?id=${p.productID}&page=${requestScope.page}&shopID=${requestScope.shopID}" class="delete" onclick="return confirm('Are you sure you want to delete this item')"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>${requestScope.count2}</b> out of <b>${requestScope.count}</b> entries</div>
                    <ul class="pagination">

                        <c:if test="${requestScope.nummax < 5 && requestScope.nummax > 0}">
                            <c:if test="${requestScope.page != 1}">
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page-1}&search=${requestScope.search}" class="page-link">Previous</a></li>    
                                </c:if>
                                <c:forEach items="${requestScope.num}" var="p">
                                    <c:if test="${requestScope.page == p}">
                                    <li class="page-item active"><a href="crud?shopID=${requestScope.shopID}&page=${p}&search=${requestScope.search}" class="page-link">${p}</a></li>
                                    </c:if>
                                    <c:if test="${requestScope.page != p}">
                                    <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${p}&search=${requestScope.search}" class="page-link">${p}</a></li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${requestScope.page != requestScope.nummax}">
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page-1}&search=${requestScope.search}" class="page-link">Next</a></li>    
                                </c:if>
                            </c:if>

                        <c:if test="${requestScope.nummax >= 5}">    
                            <c:if test="${requestScope.page <= 3}">
                                <c:if test="${requestScope.page != 1}">
                                    <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page-1}&search=${requestScope.search}" class="page-link">Previous</a></li>    
                                    </c:if>
                                    <c:forEach items="${requestScope.num}" var="p" begin="0" end="4">
                                        <c:if test="${requestScope.page == p}">
                                        <li class="page-item active"><a href="crud?shopID=${requestScope.shopID}&page=${p}&search=${requestScope.search}" class="page-link">${p}</a></li>
                                        </c:if>
                                        <c:if test="${requestScope.page != p}">
                                        <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${p}&search=${requestScope.search}" class="page-link">${p}</a></li>
                                        </c:if>
                                    </c:forEach>
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page+1}&search=${requestScope.search}" class="page-link">Next</a></li>
                                </c:if> 
                                <c:if test="${requestScope.page > 3 && requestScope.page <= requestScope.nummax-2}">
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page-1}&search=${requestScope.search}" class="page-link">Previous</a></li>
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page-2}&search=${requestScope.search}" class="page-link">${requestScope.page-2}</a></li>
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page-1}&search=${requestScope.search}" class="page-link">${requestScope.page-1}</a></li>
                                <li class="page-item active"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page}&search=${requestScope.search}" class="page-link">${requestScope.page}</a></li>
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page+1}&search=${requestScope.search}" class="page-link">${requestScope.page+1}</a></li>
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page+2}&search=${requestScope.search}" class="page-link">${requestScope.page+2}</a></li>
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page+1}&search=${requestScope.search}" class="page-link">Next</a></li>
                                </c:if>    
                                <c:if test="${requestScope.page > requestScope.nummax-2}">
                                <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page-1}&search=${requestScope.search}" class="page-link">Previous</a></li>
                                    <c:forEach items="${requestScope.num}" var="p" begin="${requestScope.nummax-5}" end="${requestScope.nummax}">
                                        <c:if test="${requestScope.page == p}">
                                        <li class="page-item active"><a href="crud?shopID=${requestScope.shopID}&page=${p}&search=${requestScope.search}" class="page-link">${p}</a></li>
                                        </c:if>
                                        <c:if test="${requestScope.page != p}">
                                        <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${p}&search=${requestScope.search}" class="page-link">${p}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${requestScope.page != requestScope.nummax}">
                                    <li class="page-item"><a href="crud?shopID=${requestScope.shopID}&page=${requestScope.page+1}&search=${requestScope.search}" class="page-link">Next</a></li>    
                                    </c:if>
                                </c:if>
                            </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->                         
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="delp" method="get">
                        <div class="modal-header">      
                            <h4 class="modal-title">Delete Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">     
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="deletePopup" class="popup">
            <h2>Delete Confirmation</h2>
            <p>Are you sure you want to delete this item?</p>
            <button onclick="">Cancel</button>
            <button onclick="deleteItem()">Delete</button>
        </div>
    </body>
</html>                                                                    
