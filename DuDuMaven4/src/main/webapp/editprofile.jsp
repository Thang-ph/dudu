<%-- 
    Document   : editprofile
    Created on : Sep 22, 2023, 7:44:23 AM
    Author     : PC
--%>
<%@ page import="model.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>DuDu - Edit Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/editprofile.css"/>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       <style>
   /* Style the label as an input */
    .custom-input-label {
        display: inline-block;
        background-color: #337ab7; /* Set your desired background color */
        color: #fff; /* Set your desired text color */
        border: 1px solid #337ab7; /* Set your desired border color */
        padding: 8px 12px; /* Set your desired padding */
        border-radius: 4px; /* Set your desired border radius */
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s; /* Add a transition effect */
    }

    /* Hover styles */
    .custom-input-label:hover {
        background-color: #235a9e; /* Set hover background color */
        border: 1px solid #235a9e; /* Set hover border color */
    }

    /* Hide the default input style */
    .custom-input-label input[type="file"] {
        display: none;
    }
</style>
    <script>
        $(function () {
            $('#fileInput').change(function () {
                $('#form1').submit();
            });

        });

    </script>

</head>
<body style="background-color: #403F66">
    <div class="container-xl px-4 mt-4">

        <nav class="nav nav-borders">
            <a class="nav-link" href="home" target="__blank" style="color: whitesmoke">Home Page</a>
            <a class="nav-link" href="userprofile" target="__blank" style="color: whitesmoke">User Profile</a>
            <a class="nav-link active ms-0" href="editprofile?userID=${sessionScope.account.userID}" target="__blank">Edit Profile</a>
        </nav>
        <hr class="mt-0 mb-4">
        <div class="row">
            <div class="col-xl-4">
                <form id="form1" action="avatarupload" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="userID" value="${sessionScope.account.userID}"/>
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">

                            <img class="img-account-profile rounded-circle mb-2" src="${sessionScope.account.avatar}" alt width="160" height="160">

                            <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 50 MB</div>
                            <h5 style="color: red">${requestScope.er}</h5>
                            <h5 style="color: green">${requestScope.warning}</h5>
                            <label class="custom-input-label" for="fileInput">
                                Upload new image
                                <input type="file" name="avatar" id="fileInput">
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-xl-8">

                <div class="card mb-4">
                    <div class="card-header">Account Details</div>
                    <div class="card-body">
                        <div style="display: flex">
                                <h5>You Are A 
                                    <c:if test="${sessionScope.account.role eq 1}">
                                        User 
                                        <button style="margin-left: 310px" onclick="window.location.href='changerole?userID=${sessionScope.account.userID}&role=2'"> Become a Seller</button>
                                    </c:if>
                                    <c:if test="${sessionScope.account.role eq 2}">
                                        Seller
                                    </c:if>
                                </h5>
                            </div>
                        <form action="editprofile" method="post">
                            <input type="hidden" name="userID" value="${sessionScope.account.userID}"/>
                            
                            <div class="mb-3">
                                <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                                <input class="form-control" id="inputUsername" type="text" name="username" placeholder="Enter your username" value="${sessionScope.account.username}">
                            </div>

                            <div class="row gx-3 mb-3">

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">First name</label>
                                    <input class="form-control" id="inputFirstName" type="text" name="firstname" placeholder="Enter your first name" value="${sessionScope.account.firstname}">
                                </div>

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputLastName">Last name</label>
                                    <input class="form-control" id="inputLastName" type="text" name="lastname" placeholder="Enter your last name" value="${sessionScope.account.lastname}">
                                </div>
                            </div>

                            <div class="row gx-3 mb-3">

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputOrgName">Email address</label>
                                    <input class="form-control" id="inputOrgName" type="email" name="email" placeholder="Enter your email address" value="${sessionScope.account.email}">
                                </div>

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputLocation">Address</label>
                                    <input class="form-control" id="inputLocation" type="text" name="address" placeholder="Enter your address" value="${sessionScope.account.address}">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="small mb-1" for="inputEmailAddress">Describe yourself</label>
                                <input class="form-control" id="inputEmailAddress" type="text" name="describe" placeholder="What do you think" value="${sessionScope.account.describe}">
                            </div>

                            <div class="row gx-3 mb-3">

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputPhone">Phone number</label>
                                    <input class="form-control" id="inputPhone" type="text" name="phone" placeholder="Enter your phone number" value="${sessionScope.account.phone}">
                                </div>

                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputBirthday">Date of Birth</label>
                                    <input class="form-control" id="inputBirthday" type="date" name="dob" placeholder="Enter your birthday" value="${sessionScope.account.dob}">
                                </div>
                            </div>
                            <div class="gender-selection">
                                <label>
                                    <input type="radio" name="gender" value="Male" ${sessionScope.account.gender eq 'Male' ? 'checked' : ''}>
                                    Male
                                </label> &nbsp;&nbsp;&nbsp;
                                <label>
                                    <input type="radio" name="gender" value="Female" ${sessionScope.account.gender eq 'Female' ? 'checked' : ''}>
                                    Female
                                </label> &nbsp;&nbsp;&nbsp;
                                <label>
                                    <input type="radio" name="gender" value="LGBTQ++" ${sessionScope.account.gender eq 'LGBTQ++' ? 'checked' : ''}>
                                    LGBTQ++
                                </label> &nbsp;&nbsp;&nbsp;
                                <label>
                                    <input type="radio" name="gender" value="None" ${sessionScope.account.gender eq 'None' ? 'checked' : ''}>
                                    Prefer not to say
                                </label>
                            </div>
                            <hr/>
                            <div style="display: flex">
                                <input class="btn btn-primary" type="submit" value="Save changes"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div> <p style="color: red"> ${requestScope.error}</p> </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">

    </script>
</body>
</html>