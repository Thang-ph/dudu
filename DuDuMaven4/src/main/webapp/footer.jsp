<%-- 
    Document   : tes
    Created on : 28-Sep-2023, 00:13:50
    Author     : Pham Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
.instagram__item {
	height: 320px;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	position: relative;
	z-index: 1;
}

.instagram__item:hover:after {
	opacity: 1;
}

.instagram__item:hover .instagram__text {
	opacity: 1;
	visibility: visible;
}

.instagram__item:after {
	position: absolute;
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	background: rgba(255, 255, 255, 0.9);
	content: "";
	opacity: 0;
	z-index: -1;
	-webkit-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}

.instagram__text {
	text-align: center;
	opacity: 0;
	visibility: hidden;
	-webkit-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}

.instagram__text i {
	font-size: 30px;
	color: #0d0d0d;
}

.instagram__text a {
	font-size: 16px;
	color: #0d0d0d;
	font-weight: 500;
	display: block;
	margin-top: 10px;
}
.instagram__text a:hover {
	text-decoration: none;
}
.set-bg {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: top center;
}
        </style>
    </head>
    <body>
         <div class="instagram">
             
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/kol1.png')">
                            <div class="instagram__text">
                                <i class="fab fa-facebook"></i>

                                <a href="https://www.facebook.com/profile.php?id=100014046042231">Thắng Phạm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/kol2.png')">
                            <div class="instagram__text">
                                <i class="fab fa-instagram"></i>

                                <a href="https://www.instagram.com/thangph_2312/">thangph_2312</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/kol3.png')">
                            <div class="instagram__text">
                                <i class="fab fa-youtube"></i>

                                <a href="https://www.youtube.com/watch?v=SDnpEqK7EBQ&ab_channel=dreamscape">@Sidejob</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/kol4.png')">
                            <div class="instagram__text">
                                <i class="fab fa-twitter"></i>

                                <a href="https://twitter.com/APieceOfPeaceee">@APieceOfPeace</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/kol5.png')">
                            <div class="instagram__text">
                                <i class="fab fa-snapchat-ghost"></i>

                                <a href="https://www.snapchat.com/">@LittleGuyWithBigDream</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" style="background-image: url('img/kol6.png')">
                            <div class="instagram__text">
                                <i class="fab fa-pinterest"></i>

                                <a href="https://www.pinterest.com/">@TheWorldInMyPhone</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
  <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-7">
                        <div class="footer__about">
                            
                            <p style=" display: flex;
                               justify-content: center;">“Style is when they’re running you out of town and you make it look like you’re leading the parade”
                            </p>
                            <p style=" display: flex;
                               justify-content: center;">
                                - Yves Saint Laurent -
                            </p>
                            <!--                            <div class="footer__payment">
                                                            <a href="#"><img src="img/payment/payment-1.png" alt=""></a>
                                                            <a href="#"><img src="img/payment/payment-2.png" alt=""></a>
                                                            <a href="#"><img src="img/payment/payment-3.png" alt=""></a>
                                                            <a href="#"><img src="img/payment/payment-4.png" alt=""></a>
                                                            <a href="#"><img src="img/payment/payment-5.png" alt=""></a>
                                                        </div>-->
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-5">
                        <div class="footer__widget">
                            <h6></h6>
                            <ul>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4">
                        <div class="footer__widget">
                            <h6></h6>
                            <ul>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                            </ul>
                        </div>                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-8">
                        <div class="footer__newslatter">
                            <h6></h6>
                            <!--                            <form action="#">
                                                            <input type="text" placeholder="Email">
                                                            <button type="submit" class="site-btn"></button>
                                                        </form>
                                                        <div class="footer__social">
                                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                                                            <a href="#"><i class="fa fa-instagram"></i></a>
                                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                                        </div>-->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <div class="footer__copyright__text">
                            <p>Copyright 2003 &copy; by  Aphrodite &#x2122; CEO Thắng Phạm </p>
                        </div>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </footer>

    </body>
</html>
