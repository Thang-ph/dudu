<%-- 
    Document   : register
    Created on : Sep 21, 2023, 4:26:18 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>DuDu - Register</title>
        <link rel="stylesheet" href="css/register.css">
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            function toggleShopNameInput() {
                var sellerRadio = document.getElementById("seller");
                var shopNameInput = document.getElementById("shopNameInput");

                if (sellerRadio.checked) {
                    shopNameInput.style.display = "block"; // Hiển thị trường "Shop Name"
                } else {
                    shopNameInput.style.display = "none"; // Ẩn trường "Shop Name"
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="title">Registration</div>
            <div class="content">

                <form action="register" method="post">


                    <div class="user-type-container">
                        <input type="radio" name="role" id="customer" class="user-type-input" value="1"  ${requestScope.role eq '1' ? 'checked' : ''} required onclick="toggleShopNameInput()">
                        <label for="customer" class="user-type-label">User</label>

                        <input type="radio" name="role" id="seller" class="user-type-input" value="2" ${requestScope.role eq '2' ? 'checked' : ''} required onclick="toggleShopNameInput()">
                        <label for="seller" class="user-type-label">Seller</label>
                    </div>

                    <div class="user-details">
                        <div class="input-box" id="shopNameInput" style="display: none; width: 100%">
                            <span class="details">Shop Name</span>
                            <input type="text" name="shopname" value="${requestScope.shopname}" placeholder="Enter your Shop name">
                        </div>
                    </div>


                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">First Name</span>
                            <input type="text" name="firstname" value="${requestScope.firstname}" placeholder="Enter your first name" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Last Name</span>
                            <input type="text" name="lastname" value="${requestScope.lastname}" placeholder="Enter your last name" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Username</span>
                            <input type="text" name="username" value="${requestScope.username}" placeholder="Enter your username" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="email" name="email" value="${requestScope.email}" placeholder="Enter your email" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number</span>
                            <input type="text" name="phone" value="${requestScope.phone}" placeholder="Enter your number" required >
                        </div>
                        <div class="input-box">
                            <span class="details">Dob</span>
                            <input type="date" name="dob" value="${requestScope.dob}" placeholder="Enter your birdh" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" name="pass1" value="${requestScope.pass1}" placeholder="Enter your password" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Confirm Password</span>
                            <input type="password" name="pass2" placeholder="Confirm your password" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input type="text" name="address" value="${requestScope.address}" placeholder="Enter your address" required>
                        </div>
                        <div class="input-box">
                            <p style="padding-top: 40px ;color: red">${requestScope.error}</p>
                        </div>
                    </div>
                    <div class="gender-details">
                        <input type="radio" name="gender" id="dot-1" value="Male"  ${requestScope.gender eq 'Male' ? 'checked' : ''} >
                        <input type="radio" name="gender" id="dot-2" value="Female" ${requestScope.gender eq 'Female' ? 'checked' : ''} >
                        <input type="radio" name="gender" id="dot-3" value="LGBTQ++" ${requestScope.gender eq 'LGBTQ++' ? 'checked' : ''}>
                        <input type="radio" name="gender" id="dot-4" value="None" ${requestScope.gender eq 'None' ? 'checked' : ''} >

                        <span class="gender-title">Gender</span>
                        <div class="category">
                            <label for="dot-1">
                                <span class="dot one"></span>
                                <span class="gender">Male</span>
                            </label>
                            <label for="dot-2">
                                <span class="dot two"></span>
                                <span class="gender">Female</span>
                            </label>
                            <label for="dot-3">
                                <span class="dot three"></span>
                                <span class="gender">LGBTQ++</span>
                            </label>
                            <label for="dot-4">
                                <span class="dot four"></span>
                                <span class="gender">Prefer not to say</span>
                            </label>

                        </div>

                    </div>
                    <div class="button">
                        <input type="submit" value="Register">
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
