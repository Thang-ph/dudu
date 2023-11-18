<%-- 
    Document   : otp
    Created on : Sep 28, 2023, 12:35:19 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">

        <title>DuDu - OTP Verify</title>
        <style>

            /* Chỉnh font chữ và màu sắc */
            body {
                background-image: url('img/hoanghon.png'); /* Thay thế 'path-to-your-image.jpg' bằng đường dẫn đến hình nền của bạn */
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            form {
                max-width: 400px;
                background-color: rgba(255, 255, 255, 0.8); /* Nền hơi trong suốt để hiển thị hình nền */
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: blue;
            }

            h3 {
                color: red;
            }

            input[type="text"] {
                width: 90%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

        </style>
    </head>
    <body>
        <form action="otp" method="post">
            <h1 style="color: blue">OTP VERIFYING</h1>
            <h3 style="color: red"> ${requestScope.error}</h3>
            <input type="hidden" name="shopname" value="${requestScope.shopname}" />
            <input type="hidden" name="otpcode" value="${requestScope.otpcode}" />
            <input type="hidden" name="username" value="${cNew.getUsername()}" />
            <input type="hidden" name="lastname" value="${cNew.getLastname()}" />
            <input type="hidden" name="firstname" value="${cNew.getFirstname()}" />
            <input type="hidden" name="pass" value="${cNew.getPassword()}" />
            <input type="hidden" name="email" value="${cNew.getEmail()}" />
            <input type="hidden" name="phone" value="${cNew.getPhone()}" />
            <input type="hidden" name="address" value="${cNew.getAddress()}" />
            <input type="hidden" name="gender" value="${cNew.getGender()}" />
            <input type="hidden" name="dob" value="${cNew.getDob()}" />
            <input type="hidden" name="role" value="${cNew.getRole()}" />
            <input type="hidden" name="describe" value="${cNew.getDescribe()}" />
            <input type="hidden" name="avatar" value="${cNew.getAvatar()}" />

            <input type="text" name="otpinput" value=""/>
            <input type="submit" value="Verify">
        </form>
    </body>
</html>
