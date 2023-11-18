<%-- 
    Document   : request
    Created on : 21-Sep-2023, 22:48:53
    Author     : Pham Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>DuDu</title>
    <link rel="shortcut icon" href="img/logo.png" type="image/x-icon">
    <style>
        
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 20px;
            background-image: url('img/background.png');
            background-size: cover;
            background-repeat: no-repeat; 
        }

        /* Phần tiêu đề */
        h1 {
            font-size: 24px;
            color: #333;
        }

        /* Định dạng nút "Back" */
        a.back-button {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }

        /* Khi di chuột qua nút "Back" */
        a.back-button:hover {
            text-decoration: underline;
        }

        /* Phần tiêu đề trang */
        .page-title {
            font-size: 28px;
            color: #333;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* Phần biểu mẫu */
        .form-container {
            margin-top: 50px;
            padding: 20px;
            background-color: #f4f4f4;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 400px;
            margin: 0 auto;
        }

        /* Input */
        input[type="text"] {
            padding: 10px;
            width: 200px; /* Đặt độ rộng 100px hoặc bất kỳ giá trị bạn muốn */
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-bottom: 10px;
        }

        /* Submit button */
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }

        /* Đổi màu khi di chuột qua Submit button */
        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Thông báo lỗi */
        .error-notice {
            color: green;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h1>Welcome to DuDu</h1>
    <span><a href="login" class="back-button">Back</a></span>
    <div class="page-title">Enter user name</div>
    <div class="form-container">
        <form action="reset" method="post">
            <input name="username" type="text" />
            <input type="submit" value="Submit" />
        </form>
    </div>
    <div class="error-notice">${requestScope.notice}</div>
</body>
</html>
