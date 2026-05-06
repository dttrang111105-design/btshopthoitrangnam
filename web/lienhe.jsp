<%-- 
    Document   : lienhe
    Created on : Apr 24, 2026, 7:54:18 PM
    Author     : XPS
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            body {
                background:white;
            }
            /* CARD */
            .product-card {
                background: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
                display: flex;
                align-items: center;
            }
            .product-card .col-md-5 {
                padding-right: 30px;
            }
            .product-card .col-md-7 {
                padding-left: 30px;
            }
            /* ẢNH */
            .img-box {
                height: 450px;
                position: relative;
                overflow: hidden;
                border: 1px solid #eee;
                background: #fff;
            }
            /* hover zoom */
            .img-box:hover .product-img {
                transform: scale(1.1);
            }
            .product-img {
                position: absolute;
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: 0.4s;
                display: block;
            }
            /* NAME */
            .product-name {
                font-size:28px;
                font-weight:bold;
            }
            /* PRICE */
            .price-old {
                text-decoration: line-through;
                color:#999;
            }
            .price-new {
                color:#d0021b;
                font-size:32px;
                font-weight:bold;
            }
            .price-box {
                background:#fff5f5;
                padding:15px;
                border-radius:10px;
                margin:15px 0;
            }
            /* BUTTON */
            .btn-cart {
                border:2px solid #8b4513;
                color:#8b4513;
                border-radius:25px;
                padding:10px 20px;
            }
            .btn-cart:hover {
                background:#8b4513;
                color:white;
            }
            .btn-buy {
                background:black;
                color:white;
                border-radius:25px;
                padding:10px 25px;
            }
            .btn-buy:hover {
                background:#8b4513;
            }
            /* DESC */
            .desc-box {
                background:white;
                padding:25px;
                border-radius:10px;
                margin-top:20px;
            }
            .section-title {
                font-weight:bold;
                border-left:5px solid #8b4513;
                padding-left:10px;
                margin-bottom:15px;
            }
            .category-link {
                color: #8b4513;
                font-weight: bold;
                text-decoration: none;
            }
            .category-link:hover {
                text-decoration: underline;
                color: #5a2e0d;
            }
            /*Xuống dòng ở mô tả sp*/
            .desc-box p {
                white-space: pre-line;
            }
            /* FOOTER */
            .bg-dark.text-white {
                background-color: #000 !important;
            }
        </style>
    </head>
    <body>
        <div class="banner">
            <div class="banner-overlay">
                <h1 class="logo">NTN SHOP</h1>
                <p>Phong cách - Trẻ trung - Hiện đại</p>
            </div>
        </div>

        <!-- 🔵 MENU -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="trangchu">Trang chủ</a>
                <div class="collapse navbar-collapse" id="mainNav">
                    <ul class="navbar-nav me-auto">
                        <!-- ÁO -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Áo
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=áo polo">Áo polo</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=áo sơ mi">Áo sơ mi</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=áo khoác">Áo khoác</a></li>
                            </ul>
                        </li>
                        <!-- QUẦN -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Quần
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=quần jean">Quần jean</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=quần âu">Quần âu</a></li>
                            </ul>
                        </li>
                        <!-- GIÀY -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Giày
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=giày sneaker">Giày sneaker</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=giày da">Giày da</a></li>
                            </ul>
                        </li>
                        <!-- PHỤ KIỆN -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Phụ kiện
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=đồng hồ">Đồng hồ</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=thắt lưng">Thắt lưng</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="lienhe">Liên hệ</a></li>
                    </ul>
                    <div class="d-flex align-items-center">
                        <form class="d-flex me-3" action="TimKiem" method="get">
                            <input class="form-control me-2" type="search" name="name" placeholder="Nhập tên sản phẩm">
                            <button class="btn btn-outline-light">Tìm</button>
                        </form>
                        <!-- nút đăng nhập sau khi login sẽ chuyển thành giỏ hàng và ô chat -->
                        <%
                            Object user = session.getAttribute("user");
                            if (user == null) {
                            %>
                                <a href="dangnhap.jsp" class="btn btn-light">Đăng nhập</a>
                            <%
                            } else {
                            %>
                                <!-- ICON GIỎ HÀNG -->
                                <a href="giohang" class="btn btn-light me-2">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
                                <!-- ICON CHAT -->
                                <a href="chat.jsp" class="btn btn-light me-2">
                                    <i class="fa fa-comment"></i>
                                </a>
                                <!-- USER -->
                                <a href="dangxuat" class="btn btn-danger">Đăng xuất</a>
                            <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </nav>

        <!-- 🔵 MAIN -->
        <div class="container-fluid mt-4">
            <div class="row">

                <!-- 🔵 SECTION LIÊN HỆ -->
                <div class="container-fluid mt-4 px-5">
                    <div class="row" style="background:white; color:#000; padding:50px 30px; border-radius:8px;">

                        <!-- LEFT: FORM -->
                        <div class="col-md-7">
                            <h2 class="fw-bold mb-4">Gửi thắc mắc cho chúng tôi</h2>
                            <p class="mb-4" style="font-size:18px; line-height:1.7;">
                                Nếu bạn có thắc mắc gì, có thể gửi yêu cầu cho chúng tôi,
                                và chúng tôi sẽ liên lạc lại với bạn sớm nhất có thể.
                            </p>
                            <form action="lienhe" method="post">

                                <!-- thông báo sau khi gửi -->
                                <%
                                    String mess = (String) request.getAttribute("mess");
                                    if (mess != null) {
                                %>
                                <div class="alert alert-success">
                                    <%= mess%>
                                </div>
                                <%
                                    }
                                %>

                                <%
                                    Object obj = session.getAttribute("user");
                                %>

                                <% if (obj == null) { %>

                                

                                <!-- Tên -->
                                <div class="mb-3">
                                    <input 
                                        type="text"
                                        name="username"
                                        class="form-control bg-white text-dark border p-3"
                                        placeholder="Tên của bạn"
                                        required
                                        >
                                </div>

                                <!-- Email + SĐT -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <input 
                                            type="email"
                                            name="email"
                                            class="form-control bg-white text-dark border p-3"
                                            placeholder="Email của bạn"
                                            required
                                            >
                                    </div>

                                    <div class="col-md-6">
                                        <input 
                                            type="text"
                                            name="phone"
                                            class="form-control bg-white text-dark border p-3"
                                            placeholder="Số điện thoại của bạn"
                                            required
                                            >
                                    </div>
                                </div>

                                <% } else {
                                    User u = (User) obj;
                                %>


                                <!-- Username -->
                                <div class="mb-3">
                                    <input 
                                        type="text"
                                        class="form-control bg-white text-dark border p-3"
                                        value="<%= u.getUserName()%>"
                                        readonly>

                                    <!-- hidden để servlet nhận -->
                                    <input 
                                        type="hidden"
                                        name="username"
                                        value="<%= u.getUserName()%>">
                                </div>

                                <!-- Email + Phone -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <input 
                                            type="text"
                                            class="form-control bg-white text-dark border p-3"
                                            value="<%= u.getEmail()%>"
                                            readonly>
                                    </div>

                                    <div class="col-md-6">
                                        <input 
                                            type="text"
                                            class="form-control bg-white text-dark border p-3"
                                            value="<%= u.getPhone()%>"
                                            readonly>
                                    </div>
                                </div>

                                <% }%>

                                <!-- Nội dung -->
                                <div class="mb-3">
                                    <textarea 
                                        name="msg"
                                        class="form-control bg-white text-dark border p-3"
                                        rows="6"
                                        placeholder="Nội dung"
                                        required></textarea>
                                </div>

                                <!-- Button -->
                                <button 
                                    type="submit"
                                    class="btn btn-danger px-5 py-3 fw-bold mt-2"
                                    style="background:#8b4513; border:none; color:#fff;">
                                    GỬI CHO CHÚNG TÔI
                                </button>

                            </form>
                        </div>

                        <!-- RIGHT: THÔNG TIN -->
                        <div class="col-md-5" style="border-left:4px solid #000; padding-left:40px;">
                            <h2 class="fw-bold mb-4">Thông tin liên hệ</h2>

                            <div class="mb-4 d-flex">
                                <i class="fa fa-map-marker-alt me-3 mt-1"></i>
                                <div>
                                    <h5 class="fw-bold">Địa chỉ</h5>
                                    <p>Ngõ 218 Lĩnh Nam, quận Hoàng Mai, Hà Nội</p>
                                </div>
                            </div>

                            <div class="mb-4 d-flex">
                                <i class="fa fa-phone me-3 mt-1"></i>
                                <div>
                                    <h5 class="fw-bold">Điện thoại</h5>
                                    <p>0987.654.321</p>
                                </div>
                            </div>

                            <div class="mb-4 d-flex">
                                <i class="fa fa-clock me-3 mt-1"></i>
                                <div>
                                    <h5 class="fw-bold">Thời gian làm việc</h5>
                                    <p>
                                        Thứ 2 đến thứ 6: từ 8h30 đến 18h;<br>
                                        Thứ 7: từ 8h30 đến 12h00
                                    </p>
                                </div>
                            </div>

                            <div class="mb-4 d-flex">
                                <i class="fa fa-envelope me-3 mt-1"></i>
                                <div>
                                    <h5 class="fw-bold">Email</h5>
                                    <p>cskh@uneti.vn</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>



            </div>

            <!-- 🔵 FOOTER -->
            <div class="bg-dark text-white text-center p-3 mt-4">
                <p>Đàm Thu Trang - 11/11/2005</p>
                <p>Nguyễn Tiến Nam - 21/12/2005</p>
                <p>Phạm Doãn Nguyên - 25/04/2005</p>
            </div>

            <script src="css/css/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
