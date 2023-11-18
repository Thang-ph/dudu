<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                            <h2>Update <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="crud?shopID=${requestScope.shopID}" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Cancel</span></a>   
                        </div>
                    </div>
                </div>
                <form style="margin: 20px" name="myForm" action="updatep" method="post" enctype="multipart/form-data" id="myForm" onsubmit="return validateForm()">
                    <div class="mb-3">
                        <label for="product-name" class="form-label userlist-header">Category:</label>
                        <select name="category" class="form-select" aria-label="Select option">
                            <c:forEach items="${requestScope.category}" var="c">
                                <option value="${c.categoryID}">${c.name}</option>
                            </c:forEach>
                        </select>
                        <fmt:formatNumber value="${requestScope.product.price}" pattern="##############" var="fullNumber" />
                    </div>
                    <div class="mb-3">
                        <label for="product-name" class="form-label userlist-header">Name:</label>
                        <input type="text" class="form-control" id="input1"  name="name" placeholder="enter product name" value="${requestScope.product.name}"> 
                    </div>
                    <div class="mb-3">
                        <label for="product-description" class="form-label userlist-header">Detail:</label>
                        <textarea  class="form-control" id="input2" name="detail" rows="3" placeholder="enter product detail" >${requestScope.product.detail}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="product-price" class="form-label userlist-header" >Price:</label>
                        <input type="number" class="form-control" id="input3" name="price" min="1" placeholder="enter product price" value="${fullNumber}">
                    </div>
                    <div class="image-input" id ="elementToRemove">
                        <label for="product-price" class="form-label userlist-header" >Main Image:</label>
                        <input type="file" id="image-file" name="image" class="image-input__file" accept="image/*" value="img/ao1_1.png" onchange="document.getElementById('blah-1').src = window.URL.createObjectURL(this.files[0])">
                        <label for="image-file" src="img/ao1_1.png" class="image-input__label">
                            <span class="image-input__text">Select Image</span>
                        </label>
                        <image id="blah-1" src="${requestScope.product.image}" class="image-input__preview" id="image-preview" >
                    </div>
                    <div>
                        <label for="addmore" class="form-label userlist-header" >Sub Image:</label>            
                        <button type="button" id="add-image-input-button" class="addmore" style="margin-bottom: 20px">Add more sub image</button>
                    </div>

                    <div class="row">
                        <div id="image-input-container">
                            <c:forEach var="i" items="${requestScope.image}" end="${requestScope.imagenum}" varStatus="loop">
                                <div class="image-input col-md-3 mb-3" id="elementToRemove${loop.index + 2}">
                                    <input type="file" id="image-file${loop.index + 2}" name="newsubimage${loop.index + 2}" class="image-input__file" accept="image/*" onchange="document.getElementById('blah${loop.index + 2}').src = window.URL.createObjectURL(this.files[0])">
                                    <label for="image-file${loop.index + 2}" class="image-input__label">
                                        <span class="image-input__text">Select Image</span>
                                    </label>
                                    <div class="image-container">
                                        <img id="blah${loop.index + 2}" src="${i.image}" class="image-input__preview" />
                                        <span class="delete-icon" id="delete${loop.index + 2}" onclick="deleteElement('elementToRemove${loop.index + 2}')">X</span>
                                        <input type="text" style="display: none" name="oldsubimg${loop.index + 2}" value="${i.image}">
                                        <input type="text" style="display: none" name="oldimgID${loop.index + 2}" value="${i.imageID}">
                                        <input type="text" style="display: none" name="oldimgID" value="${i.imageID}">
                                    </div>
                                </div>
                            </c:forEach>    
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="product-image" class="form-label userlist-header">${requestScope.validate}</label>
                    </div>
                    <button type="submit" class="btn btn-danger">Submit</button>
                    <div class="row">
                        <div class="col-md-2"><input type="text" style="display:none" class="form-control"  name="id" value="${requestScope.product.productID}"></div>
                        <div class="col-md-2"><input type="text" style="display:none" class="form-control"  name="shop" value="${requestScope.shopID}"></div>
                        <div class="col-md-2"><input type="text" style="display:none" class="form-control"  name="page" value="${requestScope.page}"></div>
                        <div class="col-md-2"><input type="text" style="display:none" class="form-control"  name="imagenum" value="${requestScope.imagenum}"></div>
                        <div class="col-md-2"><input type="text" style="display:none" class="form-control"  name="oldimg" value="${requestScope.product.image}"></div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            var addButton = document.getElementById('add-image-input-button');
            var container = document.getElementById('image-input-container');
            var count = document.getElementById("imagenum");

            addButton.addEventListener('click', function () {
                if (count >= 9) {
                    return;
                }

                var newInputContainer = document.createElement('div');
                newInputContainer.className = 'image-input col-md-3 mb-3';
                newInputContainer.id = 'elementToRemove' + (count + 2);

                var newInput = document.createElement('input');
                newInput.type = 'file';
                newInput.id = 'image-file' + (count + 2); // Increment the ID for each new input
                newInput.name = 'subimage' + (count + 2); // Increment the name attribute for each new input
                newInput.className = 'image-input__file';
                newInput.accept = 'image/*';
                newInput.setAttribute('onchange', "document.getElementById('blah" + (count + 2) + "').src = window.URL.createObjectURL(this.files[0])");

                var newLabel = document.createElement('label');
                newLabel.htmlFor = 'image-file' + (count + 2); // Increment the ID for each new input
                newLabel.className = 'image-input__label';

                var newInputText = document.createElement('span');
                newInputText.className = 'image-input__text';
                newInputText.textContent = 'Select Image';

                var newContainer = document.createElement('div');
                newContainer.className = 'image-container';

                var newPreview = document.createElement('img');
                newPreview.id = 'blah' + (count + 2); // Increment the ID for each new preview
                newPreview.className = 'image-input__preview';

                var deleteIcon = document.createElement('span');
                deleteIcon.className = 'delete-icon';
                deleteIcon.id = 'delete' + (count + 2);
                deleteIcon.textContent = 'X';
                deleteIcon.setAttribute('onclick', 'deleteElement(\'' + 'elementToRemove' + (count + 2) + '\')');

                newLabel.appendChild(newInputText);
                newContainer.appendChild(newPreview);
                newContainer.appendChild(deleteIcon);
                newInputContainer.appendChild(newInput);
                newInputContainer.appendChild(newLabel);
                newInputContainer.appendChild(newContainer);
                container.appendChild(newInputContainer);
                count++;
            });

            function deleteElement(elementId) {
                var element = document.getElementById(elementId);
                if (element) {
                    element.parentNode.removeChild(element);
                }
                count--;

                var part = elementId.split("ove");
                var id = parseInt(part[1]);
                for (var i = 0; i <= 10; i++) {
                    var myDiv = document.getElementById("image-file" + (id + 1));
                    myDiv.id = "image-file" + (id);
                    var myDiv2 = document.getElementById("blah" + (id + 1));
                    myDiv2.id = "blah" + (id);
                    var myDiv3 = document.getElementById("elementToRemove" + (id + 1));
                    myDiv3.id = "elementToRemove" + (id);
                    var myDiv4 = document.getElementById("delete" + (id + 1));
                    myDiv4.id = "delete" + (id);
                    var myLabel = document.querySelector('label[for="image-file' + (id + 1) + '"]');
                    myLabel.htmlFor = "image-file" + (id);
                    var myInput = document.querySelector('input[name="subimage' + (id + 1) + '"]');
                    var myInput2 = document.querySelector('input[name="newsubimage' + (id + 1) + '"]');
                    var myInput3 = document.querySelector('input[name="oldsubimg' + (id + 1) + '"]');
                    var myInput4 = document.querySelector('input[name="oldimgID' + (id + 1) + '"]');

                    if (myInput) {
                        myInput.name = "subimage" + id;
                    } else {
                        myInput2.name = "newsubimage" + id;
                    }

                    if (myInput3) {
                        myInput3.name = "oldsubimg" + id;
                    }

                    if (myInput4) {
                        myInput4.name = "oldimgID" + id;
                    }

                    var newBlahId = "blah" + (id);
                    document.getElementById("image-file" + (id)).setAttribute('onchange', "document.getElementById('" + newBlahId + "').src = window.URL.createObjectURL(this.files[0])");

                    var newDeleteId = "elementToRemove" + (id);
                    document.getElementById("delete" + (id)).setAttribute('onclick', "deleteElement('" + newDeleteId + "')");
                    id++;
                }
            }




            function validateForm() {
                if (document.forms["myForm"]["name"].value.trim() === "") {
                    alert("Name must be filled out");
                    return false;
                } else if (document.forms["myForm"]["detail"].value.trim() === "") {
                    alert("Detail must be filled out");
                    return false;
                } else if (document.forms["myForm"]["price"].value.trim() === "") {
                    alert("Price must be filled out");
                    return false;
                } else {
                    var selectedFile = document.forms["myForm"]["image"].files;
                    var allowedTypes = ['image/jpeg', 'image/png'];

                    if (selectedFile.length === 0) {
                        for (let i = 2; i <= 9; i++) {
                            var subselectedFile = document.forms["myForm"]["subimage" + i].files[0];
                            if (!allowedTypes.includes(subselectedFile.type)) {
                                alert('one of your sub image are not image. Please upload a JPG, PNG file.');
                                return false;
                            }
                        }
                    } else if (!allowedTypes.includes(selectedFile[0].type)) {
                        alert('Invalid image. Please upload a JPG, PNG file.');
                        return false;
                    } else {
                        for (let k = 2; k <= count + 2; k++) {
                            var subselectedFile = document.getElementById('image-file' + k).files;
                            if (subselectedFile.length === 0) {
                                continue;
                            } else if (!allowedTypes.includes(subselectedFile[0].type)) {
                                alert('one of your sub image are not image. Please upload a JPG, PNG file.');
                                return false;
                            }
                        }
                    }
                }
            }
        </script>
    </body>
</html>                                                                    
