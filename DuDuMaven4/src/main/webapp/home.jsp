<%-- 
    Document   : home
    Created on : Sep 19, 2023, 10:20:43 PM
    Author     : Pham Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.User" %>
<%@ page import="dal.CommentDAO" %>
<%@ page import="model.Comment" %>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Du Du - Do Shop, Do Share</title>
        <link rel="shortcut icon" href="img/new.png" type="image/x-icon">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
        <link rel="stylesheet" href="css/home.css"/>

        <style>
            body{
                    overflow-x:hidden;
            }
            .reactbutton{
                border-top-right-radius: 20px;
                border-bottom-right-radius: 20px;

            }
            .outboxmedia{
                background-color: #333251;
                padding:40px;
                border-radius:20px;
                margin: 20px;
            }
            .inboxmedia{
                display: flex;
                flex-direction: column;
            }
.fa-shopping-bag {
                position: relative;
            }

            .tip {
                position: absolute;
                top: -5px;
                right: -10px;
                background-color: white;
                color: lightpink;
                border-radius: 50%;
                padding: 0px 4px;
                font-size: 13px;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body >
        <div style=" width: 130%">
        <div class="pageHeader">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <a href="home">
                            <img style="width:  18%;height: auto" src="img/icon.png">
                        </a>
                    </div>
                    <div class="col-sm-6">

                    </div>
                    <div class="col-sm-3">


                        <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <a  style="color: whitesmoke" href="us" class="upload btn btn-default">Upload</a>
 <%
                            }
                        %>
                        <div class="btn btn-default" id="shopping-cart-btn">
                            <a href="shop"> <i style="color: lightpink;" class="fas fa-shopping-cart"></i></a>
                        </div>
                         <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <div class="btn btn-default" id="profile-button">
                            <a href="show"><i style="color: lightpink;" class="fas fa-shopping-bag">
                                    <span class="tip">${requestScope.sizeCart}</span>
                                </i>

                            </a>

                        </div>

                        <a href="userprofile">

                            <div class="btn btn-default" id="profile-button">
                                <i class="fas fa-user"></i>
                            </div>
                        </a>

                        <%
                        } else {
                        %>
                        <a href="login"><div class="btn btn-danger login" >Log In</div></a>
                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>

            <div class="container mt-3" >
            <div class="row" style="flex-wrap: nowrap;padding:10px; padding-right: 200px">
                <div class="col-sm-3" style="background-color: #333251;border-radius:20px;margin: 20px;padding: 20px;">
                    <div>  
                        <div class="button-container">
                            <a href="sv">
                                <button class="button" >
                                    <i class="fas fa-home"></i>
                                </button>
                            </a>
                                                                 <a href="shophome">

                                <button class="button">
                                    <i class="fa fa-compass" aria-hidden="true"></i>
                                </button>
                                                                                                           </a>

                            <%
                                User account = (User) session.getAttribute("account");
                                if (account != null && account.getRole() == 2) { %>
                            <a href="shopManage?userID=${sessionScope.account.userID}" >
                                <button class="button">
                                    <i class="fas fa-store"></i>
                                </button>
                            </a>

                            <%
                                }
                            %>



                            <%
                                if (account != null && account.getRole() == 0) { %>
                            <a href="userlist">
                                <button class="button">
                                    <i class="fas fa-user-friends"></i>


                                </button>
                            </a>

                            <%}%>


                        </div>



                    </div>

                    <hr class="my-5">
                    <div>
                        <p>Log in to follow creators, like videos, and view comments.</p>


                        <%
                            if (session.getAttribute("account") != null) {
                        %>
                        <b><a  href="logout" style="color: whitesmoke"><div  class="btn btn-outline-danger w-100 p-2">Logout</div></a> </b>
                        <%
                        } else {
                        %>
                        <b><a  href="login" style="color: whitesmoke"><div  class="btn btn-outline-danger w-100 p-2">Login</div></a></b>
                        <%
                            }
                        %>


                    </div>


                    <div>
                        <div class="d-flex align-items-center justify-content-between">
                            <span>Discover</span>
                        </div>
                        <div style="color: whitesmoke">
                            <span class="badge rounded-pill border border-secondary m-2"># messigoat</span>
                            <span class="badge rounded-pill border border-secondary  m-2"># T1vodich</span>
                            <span class="badge rounded-pill border border-secondary m-2"><i class="fas fa-music"></i> Để anh một mình - Rhyder</span>
                            <span class="badge rounded-pill border border-secondary  m-2"><i class="fas fa-music"></i> Vương - Nger </span>
                        </div>
                    </div>
                    <hr>
                    <div>
                        &copy; 2023 DuDu
                    </div>
                </div>

                <div class="outboxmeida" style="background-color: #333251;padding:40px 15px 40px 15px;border-radius:20px;margin: 20px;max-width: 800px ">
                    <div class="inboxmedia">
                        <c:forEach var="v" items="${listVideo}">

                            <div class="videohead">
                                <div class="headmedia" style="display: flex;flex-direction: row">
                                    <img class="suggestedAccountIcon" src="img/avatar.png">
                                    <div >
                                        <h6 class="nameusermedia" style="color: whitesmoke">
                                            <c:if test="${v.userID != sessionScope.account.userID}">
                                                <a href="peopleprofile?userID=${v.userID}"><h3 style="color: whitesmoke">${v.userName}</h3> </a>
                                            </c:if>
                                            <c:if test="${v.userID == sessionScope.account.userID}">
                                                <a href="userprofile?userID=${v.userID}"><h3 style="color: whitesmoke">${v.userName}</h3> </a>
                                            </c:if>
                                        </h6>
                                        <small style="color:  #F5F5F5">${v.title} <span style="color: lightskyblue">#TRENDING</span></small>
                                    </div>
                                </div>
                               
                            </div>
                            <div class="mediabox">
                                <div>

                                    <video controls style="max-width: 100%; height: auto;">
                                        <source src="${v.videourl}" type="video/mp4">
                                    </video>
                                </div>




                                <div class="reactbutton" style="">
                                    <div class="likeandshare">
                                        <div class="videoaction">


                                            <button class="abtn" id="likeButton" onclick="likeVideo(${v.vidID}, ${sessionScope.account.userID})">
                                                Like
                                                <span class="like" id="likeCount_${v.vidID}">${v.vlike}</span>
                                            </button>
                                            <!-- Đoạn mã JavaScript -->
                                            <script>
                                                // Hàm thực hiện tăng giá trị lên 1 và cập nhật nội dung hiển thị
                                                function likeVideo(vidID) {
                                                    // Lấy giá trị hiện tại của likeCount
                                                    var likeCountSpan = document.getElementById("likeCount_${v.vidID}");
                                                    var currentLikes = parseInt(likeCountSpan.innerText);

                                                    // Tăng giá trị lên 1
                                                    currentLikes += 1;

                                                    // Cập nhật nội dung của likeCount
                                                    likeCountSpan.innerText = currentLikes;

                                                    // Thực hiện hàm likeVideo với vidID và userID nếu cần
                                                    // likeVideo(vidID, sessionScope.account.userID);
                                                }
                                            </script>
                                            <p id="loginMessage" style="color: red; display: none;">You have to login in order to like a video</p>



                                        </div>
                                        <div class="videoaction">
                                            <button class="abtn"> Share

                                            </button>

                                        </div>


                                    </div>
                                    <div class="comments">
                                        <button class="abtn" style="margin-left: 5px;" onclick="toggleComments(${v.vidID})">Show Comment</button>
                                        <div class="cbox" style="display: none;margin :5px" id="comments-${v.vidID}">
                                            <div class="ccontentc">
                                            </div>                                        
                                            <button onclick="closeComments(${v.vidID})">Đóng comment</button>
                                        </div>
                                        <div class="input-group" id="myForm${v.vidID}" style="margin :5px;">
                                            <form id="commentForm${v.vidID}" style="margin:5px;">
                                                <input  class="input" id="comment${v.vidID}" type="text" placeholder="Comment" name="comment" required>
                                                <input type="hidden" name="userid" value="${sessionScope.account.userID}">
                                                <input type="hidden" name="videoid" value="${v.vidID}">
                                                <input class="button--submit" type="submit" value="Send Comment">
                                            </form>

                                        </div>
                                        <!-- Thêm một nút hoặc sự kiện để mở cửa sổ bình luận cho video cụ thể -->
                                    </div>
                                </div>

                            </div>



                            <c:if test="${not empty v.productname}">
                                <div class="productbox" style="margin-top: 20px;background-color: #403F66;padding: 10px;border-radius: 20px;">
                                    Product In Video : 
                                    <a href="product?productID=${v.productID}" style="text-decoration: none;border-radius: 20px;">
                                        <div style="background-color: #7291ac;border-radius: 20px;padding:10px 50px 10px 10px;">
                                            <img src="${v.productimg}" width="50px" height="50px" style="border-radius:10px" />
                                            ${v.productname}
                                        </div>
                                    </a>
                                </div>
                            </c:if>
                            <hr >



                        </c:forEach>

                    </div>
                </div>

            </div>
        </div>
        <script type="text/javascript">
            function likeVideo(videoID, userID) {
                var plusButton = document.getElementById("button-addon2");
                if (userID == null) {
                    // Hiển thị thông báo lỗi nếu userID = null
                    document.getElementById("loginMessage").style.display = "block";
                } else {
                    // Thực hiện yêu cầu Ajax để "Like" video nếu userID không null
                    $.ajax({
                        url: "/DuDuMaven4/ls", // Thay thế bằng URL của Servlet xử lý "Like"
                        data: {videoID: videoID, userID: userID},
                        success: function (data) {
                            // Xử lý phản hồi từ máy chủ (nếu cần)
                            if (data.success) {
                                // Tăng số like hiển thị lên 1
                                const likeCountElement = document.getElementById(`likeCount_${videoID}`);
                                if (likeCountElement) {
                                    let currentLikeCount = parseInt(likeCountElement.textContent, 10);
                                    likeCountElement.textContent = currentLikeCount + 1;
                                }
                                // Cập nhật giá trị v.vlike
                                v.vlike++;
                            } else {
                                console.log("Lỗi khi thêm lượt like");
                            }
                        },
                        error: function (error) {
                            console.log(error);
                            // Xử lý lỗi nếu có
                        }
                    });
                }
            }
        </script>



    </script>

    <script>
        npm i bootstrap - icons
                var shoppingCartBtn = document.getElementById("shopping-cart-btn");
        shoppingCartBtn.addEventListener("click", function () {
            window.location.href = "shop";
        });
        var loginDivs = document.querySelectorAll(".login");
        loginDivs.forEach(function (div) {
            div.addEventListener("click", function () {
                window.location.href = "login";
            });
        });
        const profileButton = document.getElementById('profile-button');
        profileButton.addEventListener('click', () => {
            window.location.href = 'userprofile';
        });

        function openForm${v.vidID}() {
            document.getElementById("myForm${v.vidID}").style.display = "absolute";
        }
        function closeForm${v.vidID}() {
            document.getElementById("myForm${v.vidID}").style.display = "none";
        }

    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function toggleComments(videoId) {
            var commentContainer = document.getElementById("comments-" + videoId);
            var openButton = document.querySelector('[onclick="toggleComments(' + videoId + ')"]');
            var closeButton = commentContainer.querySelector('button');

            if (commentContainer.style.display === 'none') {
                // Nếu comment đang bị ẩn, mở nó và tải comment mới bằng Ajax

                $.ajax({
                    url: "/DuDuMaven4/sc",
                    data: {
                        videoId: videoId
                    },
                    success: function (data) {
                        commentContainer.innerHTML = data;
                        commentContainer.style.display = 'block';
                        closeButton.style.display = 'block';
                        openButton.disabled = false; // Khi tải xong, kích hoạt lại nút "Xem comment"
                    }
                });
            } else {
                // Nếu comment đang hiển thị, đóng nó
                commentContainer.style.display = 'none';
                closeButton.style.display = 'none';
                openButton.disabled = false;
            }
        }

        function closeComments(videoId) {
            var commentContainer = document.getElementById("comments-" + videoId);
            var openButton = document.querySelector('[onclick="toggleComments(' + videoId + ')"');
            var closeButton = commentContainer.querySelector('button');

            commentContainer.style.display = 'none';
            closeButton.style.display = 'none';
            openButton.disabled = false;
        }

    </script>





    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <c:forEach var="v" items="${listVideo}">

        <script>
        $(document).ready(function () {
            // Handle form submission for this specific video
            $('#commentForm${v.vidID}').submit(function (e) {
                e.preventDefault(); // Prevent the form from submitting in the traditional way
                var comment = $('#comment${v.vidID}').val().trim();
                var userId = $('input[name="userid"]').val();
                var form = $(this);
                var videoId = form.find('input[name="videoid"]').val();

                if (userId == 0) {
                    // Display the login message
                    alert("You have to login in order to comment");
                } else if (comment === "") {
                    // Display the empty comment message
                    alert("You have to type something to comment");
                } else {
                    $.ajax({
                        type: 'POST',
                        url: 'tc', // Your Servlet URL
                        data: {
                            comment: comment,
                            userid: userId,
                            videoid: videoId
                        },
                        success: function (response) {
                            // Handle the response (e.g., update the comment list)
                            // You can handle the response here
                            // For example, append the comment to the comment list
                            $('#commentResult${v.vidID}').html(response);
                        }
                    });
                }

                return false; // Ensure the form doesn't submit traditionally
            });
        });
        </script>


    </c:forEach>
    <script>
        $(document).ready(function () {
            $("#likeButton").click(function (e) {
                e.preventDefault(); // Ngăn chặn chuyển hướng đến URL trong thẻ <a>

                // Lấy userID và videoid từ URL
                var userID = ${v.userID};
                var videoid = ${v.vidID};

                $.ajax({
                    type: "GET",
                    url: "your-servlet-url",
                    data: {userid: userID, videoid: videoid},
                    success: function (data) {
                        // Xử lý kết quả trả về từ servlet (nếu cần)
                    },
                    error: function (xhr, status, error) {
                        // Xử lý lỗi (nếu cần)
                    }
                });
            });
        });
    </script>

</div>  
</body>
</html>