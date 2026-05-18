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
            body{
                background:#f5f6fa;
            }
            /* CONTACT */
            .contact-wrapper{
                background:white;
                border-radius:28px;
                overflow:hidden;
                box-shadow:0 10px 30px rgba(0,0,0,.08);
            }
            /* LEFT */
            .contact-left{
                padding:50px;
            }
            .contact-title{
                font-size:38px;
                font-weight:800;
                color:#111827;
                margin-bottom:20px;
            }
            .contact-desc{
                color:#6b7280;
                line-height:1.8;
                font-size:17px;
                margin-bottom:30px;
            }
            /* FORM */
            .form-control{
                border:none;
                border-radius:16px;
                padding:14px 16px;
                background:#f9fafb !important;
                transition:.3s;
            }
            .form-control:focus{
                box-shadow:none;
                border:2px solid #8b4513;
                background:white !important;
            }
            /* BUTTON */
            .btn-send{
                background:#111827;
                color:white;
                border:none;
                border-radius:16px;
                padding:14px 28px;
                font-weight:700;
                transition:.3s;
            }
            .btn-send:hover{
                background:#8b4513;
                color:white;
                transform:translateY(-2px);
            }
            /* RIGHT */
            .contact-right{
                background:#111827;
                color:white;
                padding:50px;
                height:100%;
            }
            .contact-info-title{
                font-size:34px;
                font-weight:800;
                margin-bottom:35px;
            }
            .contact-item{
                display:flex;
                gap:18px;
                margin-bottom:35px;
            }
            .contact-icon{
                width:52px;
                height:52px;
                border-radius:16px;
                background:rgba(255,255,255,.08);
                display:flex;
                align-items:center;
                justify-content:center;
                flex-shrink:0;
            }
            .contact-icon i{
                font-size:20px;
                color:#f3d19c;
            }
            .contact-item h5{
                font-weight:700;
                margin-bottom:8px;
            }
            .contact-item p{
                color:#d1d5db;
                margin:0;
                line-height:1.7;
            }
            /* ALERT */
            .alert{
                border-radius:16px;
            }
            /* MOBILE */
            @media(max-width:991px){
                .contact-left,
                .contact-right{
                    padding:32px;
                }
                .contact-title{
                    font-size:30px;
                }
                .contact-info-title{
                    font-size:28px;
                }
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
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="trangchu">
                    NTN SHOP
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
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
                        <li class="nav-item"><a class="nav-link" href="lienhe.jsp">Liên hệ</a></li>
                    </ul>
                    <div class="d-flex align-items-center">
                        <form class="d-flex me-3" action="TimKiem" method="get">
                            <input class="form-control me-2" type="search" name="name" placeholder="Nhập tên sản phẩm">
                            <button class="btn btn-outline-light px-4">Tìm</button>
                        </form>
                        <!-- nút đăng nhập sau khi login sẽ chuyển thành giỏ hàng và ô chat -->
                        <%
                            Integer cartCount = (Integer) request.getAttribute("cartCount");
                            if (cartCount == null) {
                                cartCount = 0;
                            }
                            Object currentUser = session.getAttribute("user");
                            if (currentUser == null) {
                        %>
                        <a href="dangnhap.jsp" class="btn btn-light">Đăng nhập</a>
                        <%
                        } else {
                        %>
                        <!-- ICON GIỎ HÀNG -->
                        <a href="giohang" class="btn btn-light me-2 position-relative rounded-pill px-3">
                            <i class="fa fa-shopping-cart"></i>
                            <% if (cartCount > 0) {%>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                <%=cartCount%>
                            </span>
                            <%
                                }
                            %>
                        </a>

                        <!-- ICON LỊCH SỬ ĐƠN HÀNG -->
                        <a href="lichsumuahang" class="btn btn-light me-2 rounded-pill px-3">
                            <i class="fa fa-clock-rotate-left"></i>
                        </a>

                        <!-- USER -->
                        <a href="dangxuat" class="btn btn-danger rounded-pill px-4">Đăng xuất</a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </nav>

        <!-- 🔵 MAIN -->
        <div class="container-fluid">
            <div class="row">

                <!-- 🔵 SECTION LIÊN HỆ -->
                <div class="container pt-4 pb-5">
                    <div class="row g-0 contact-wrapper">
                        <!-- LEFT: FORM -->
                        <div class="col-lg-7 contact-left">
                            <h2 class="contact-title">Gửi thắc mắc cho chúng tôi</h2>
                            <p class="contact-desc">
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
                                    if (currentUser == null) {
                                %>
                                <!-- Tên -->
                                <div class="mb-3">
                                    <input type="text" name="username" class="form-control bg-white text-dark border p-3"
                                           placeholder="Tên của bạn" required >
                                </div>

                                <!-- Email + SĐT -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <input type="email" name="email" class="form-control bg-white text-dark border p-3"
                                               placeholder="Email của bạn" required >
                                    </div>
                                    <div class="col-md-6">
                                        <input  type="text" name="phone" class="form-control bg-white text-dark border p-3"
                                                placeholder="Số điện thoại của bạn" required >
                                    </div>
                                </div>

                                <% } else {
                                    User u = (User) currentUser;
                                %>

                                <!-- Username -->
                                <div class="mb-3">
                                    <input  type="text" class="form-control bg-white text-dark border p-3" value="<%= u.getUserName()%>" readonly>
                                    <!-- hidden để servlet nhận -->
                                    <input  type="hidden" name="username" value="<%= u.getUserName()%>">
                                </div>
                                <!-- Email + Phone -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <input  type="text" class="form-control bg-white text-dark border p-3" value="<%= u.getEmail()%>" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <input  type="text" class="form-control bg-white text-dark border p-3" value="<%= u.getPhone()%>" readonly>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                                <!-- Nội dung -->
                                <div class="mb-3">
                                    <textarea  name="msg" class="form-control bg-white text-dark border p-3"
                                               rows="6" placeholder="Nội dung" required></textarea>
                                </div>
                                <!-- Button -->
                                <button  type="submit" class="btn btn-send mt-2">
                                    GỬI CHO CHÚNG TÔI
                                </button>

                            </form>
                        </div>
                        <!-- RIGHT: THÔNG TIN -->
                        <div class="col-lg-5 contact-right">
                            <h2 class="contact-info-title">Thông tin liên hệ</h2>
                            <div class="contact-item">
                                <div class="contact-icon">
                                    <i class="fa fa-map-marker-alt"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold">Địa chỉ</h5>
                                    <p>Ngõ 218 Lĩnh Nam, quận Hoàng Mai, Hà Nội</p>
                                </div>
                            </div>
                            <div class="contact-item">
                                <div class="contact-icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold">Điện thoại</h5>
                                    <p>0987.654.321</p>
                                </div>
                            </div>
                            <div class="contact-item">
                                <div class="contact-icon">
                                    <i class="fa fa-clock"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold">Thời gian làm việc</h5>
                                    <p>
                                        Thứ 2 đến thứ 6: từ 8h30 đến 18h;<br>
                                        Thứ 7: từ 8h30 đến 12h00
                                    </p>
                                </div>
                            </div>
                            <div class="contact-item">
                                <div class="contact-icon">
                                    <i class="fa fa-envelope"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold">Email</h5>
                                    <p>cskh@uneti.vn</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>                   
        </div>                        
        <!-- 🔵 FOOTER -->
        <div class="bg-dark text-white text-center p-3">
            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>
        </div>
        <script src="css/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="chatbox.jsp"/>
    </body>
</html>
