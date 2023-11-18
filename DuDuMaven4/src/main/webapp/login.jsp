<%-- 
    Document   : login
    Created on : Sep 20, 2023, 2:07:23 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <title>DuDu - Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
          <link rel="shortcut icon" href="img/new.png" type="image/x-icon">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />

    <link rel="stylesheet" href="css/login.css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
   </head>
   
   <body>
       
  <section class="login">
    <div class="login_box">
      <div class="left">
        <div class="top_link"><a href="home"><img src="https://drive.google.com/u/0/uc?id=16U__U5dJdaTfNGobB_OpwAJ73vM50rPV&export=download" alt="">Return home</a></div>
        <div class="contact">
            <form action="login" method="post">
            <h3>SIGN IN</h3>
            <h6 style="color: red"> ${requestScope.error}</h6>
            <input type="text" id="username" name="username" placeholder="USERNAME" >
            <input type="password" id="password" name="password" placeholder="PASSWORD">
            <i class="bi bi-eye-slash" id="togglePassword"></i>
            
            <div>
                
        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/DuDuMaven4/login-google&response_type=code
                                              &client_id=904395067416-3e3bn5706dl95dmqut4kgtguph3jp21o.apps.googleusercontent.com&approval_prompt=force" class="google-signin">
            <i class="fab fa-google google-icon"></i>
            Sign in with Google
        </a>
                <div style="padding-top:  10px">
                     <h7><a style="text-decoration: none" href="reset">Forget password</a></h7>
                </div>
                <div style="padding-top:  10px">
                     <h7>Dont have an account? <a style="text-decoration: none" href="register">Register here</a></h7>
                </div>
    </div>
            
            
            <button class="submit">Entry</button>
          </form>
        </div>
        
      </div>
      <div class="right">
        <div class="right-text">
          <h2>DuDu</h2>
          <h5>IS ALL YOU NEED</h5>
        </div>
          
        <div class="right-inductor"><img src="" alt=""></div>
      </div>
    </div>
  </section>
</body> 
    <script>
        const togglePassword = document.querySelector("#togglePassword");
        const password = document.querySelector("#password");

        togglePassword.addEventListener("click", function () {
            // toggle the type attribute
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);

            // toggle the icon
            this.classList.toggle("bi-eye");
        });
    </script>
    </html>
