<%-- 
    Document   : thanhtoan
    Created on : May 8, 2026, 11:02:50 PM
    Author     : ADMIN
--%>

<%@page import="DAO.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
        <style>
            body{
                background:#f3f4f6;
            }
            /* MAIN */
            .checkout-wrapper{
                background:white;
                border-radius:28px;
                overflow:hidden;
                padding:40px;
                box-shadow:0 10px 40px rgba(0,0,0,0.08);
            }
            /* IMAGE */
            .checkout-image-box{
                overflow:hidden;
                border-radius:24px;
            }
            .checkout-image{
                width:100%;
                height:560px;
                object-fit:cover;
                transition:.5s;
            }
            .checkout-image:hover{
                transform:scale(1.05);
            }
            /* INFO */
            .checkout-title{
                font-size:30px;
                font-weight:800;
                margin-bottom:18px;
                color:#111827;
            }
            .checkout-price{
                font-size:26px;
                font-weight:800;
                color:#8b4513;
                margin-bottom:25px;
            }
            /* META */
            .checkout-meta{
                background:#f9fafb;
                border-radius:18px;
                padding:20px;
                margin-bottom:25px;
            }
            .checkout-meta p{
                margin-bottom:10px;
                color:#374151;
            }
            .checkout-meta b{
                color:#111827;
            }
            /* TOTAL */
            .total-box{
                background:#111827;
                color:white;
                border-radius:22px;
                padding:25px;
                margin-bottom:35px;
            }
            .total-label{
                font-size:16px;
            }
            .total-price{
                font-size:28px;
                font-weight:800;
            }
            /* FORM */
            .form-title{
                font-size:24px;
                font-weight:800;
                margin-bottom:25px;
            }
            .checkout-label{
                font-weight:700;
                margin-bottom:10px;
            }
            .checkout-input{
                border:2px solid #e5e7eb;
                border-radius:14px;
                padding:14px 16px;
                transition:.3s;
            }
            .checkout-input:focus{
                border-color:#111827;
                box-shadow:none;
            }
            /* BUTTON */
            .checkout-btn{
                width:100%;
                border:none;
                background:#8b4513;
                color:white;
                border-radius:16px;
                padding:16px;
                font-size:16px;
                font-weight:700;
                transition:.3s;
            }
            .checkout-btn:hover{
                background:#6d3410;
            }
            /* MOBILE */
            @media(max-width:991px){
                .checkout-wrapper{
                    padding:24px;
                }
                .checkout-image{
                    height:340px;
                }
                .checkout-title{
                    margin-top:20px;
                    font-size:24px;
                }
                .checkout-price{
                    font-size:22px;
                }
                .total-price{
                    font-size:24px;
                }
                .form-title{
                    font-size:22px;
                }
            }
        </style>
    </head>
    <body>
        <%
            Integer cartCount = (Integer) request.getAttribute("cartCount");
                if(cartCount == null){
                    cartCount = 0;
                }
            Product p = (Product) request.getAttribute("p");
            if(p == null){
        %>
        <div class="container mt-5">
            <h3>Không tìm thấy sản phẩm</h3>
        </div>
        <%
            return;
            }
            int quantity = (Integer) request.getAttribute("quantity");
            double total = p.getPrice()*quantity;
        %>
        <!-- 🔵 MENU -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
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
                                <a href="giohang" class="btn btn-light me-2 position-relative">
                                    <i class="fa fa-shopping-cart"></i>
                                    <% if(cartCount > 0){ %>
                                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                            <%=cartCount%>
                                        </span>
                                    <% 
                                        } 
                                    %>
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
        <!-- Thanh toán -->
        <div class="container py-5">
            <div class="checkout-wrapper">
                <div class="row">
                    <!-- Ảnh -->
                    <div class="col-md-5">
                        <div class="checkout-image-box">
                            <img src="<%=request.getContextPath()%>/<%=p.getImage()%>"
                                 class="checkout-image">
                        </div>
                    </div>

                    <!-- Thông tin -->
                    <div class="col-md-7">
                        <h1 class="checkout-title"><%=p.getName()%></h2>
                        <div class="checkout-price"><%=p.getFormattedPrice()%> VNĐ</p>
                        <div class="checkout-meta">
                            <p>
                                <b>Danh mục:</b>
                                <%=p.getCategory()%>
                            </p>
                            <p>
                                <b>Loại:</b>
                                <%=p.getType()%>
                            </p>
                            <p>
                                <b>Số lượng:</b>
                                <%=quantity%>
                            </p>
                        </div>
                        <div class="total-box d-flex justify-content-between align-items-center">
                            <div class="total-label">
                                Tổng thanh toán
                            </div>
                            <div class="total-price">
                                <%=String.format("%,.0f", total)%> VNĐ
                            </div>
                        </div>
                        <hr>
                        <h2 class="form-title">Thông tin nhận hàng</h4>
                        <form action="ThanhToan" method="post">
                            <!-- hidden fields -->
                            <input type="hidden" name="id" value="<%=p.getId()%>"> <!-- Đã đóng thẻ > ở đây -->
                            <input type="hidden" name="quantity" value="<%=quantity%>">

                            <!-- họ tên -->
                            <div class="mb-3">
                                <label class="checkout-label"">Họ tên</label>
                                <input type="text" name="name" class="form-control checkout-input" required 
                                       oninvalid="this.setCustomValidity('Vui lòng nhập họ tên')" 
                                       oninput="this.setCustomValidity('')">
                            </div>

                            <!-- sđt -->
                            <div class="mb-3">
                                <label class="checkout-label"">Số điện thoại</label>
                                <input type="tel" name="phone" class="form-control checkout-input" required 
                                       pattern="[0-9]{10,11}"
                                       oninvalid="this.setCustomValidity('Vui lòng nhập số điện thoại hợp lệ')" 
                                       oninput="this.setCustomValidity('')">
                            </div>

                            <!-- địa chỉ -->
                            <div class="mb-3">
                                <label class="checkout-label"">Địa chỉ</label>
                                <textarea name="address" class="form-control checkout-input" required 
                                          oninvalid="this.setCustomValidity('Vui lòng nhập địa chỉ')" 
                                          oninput="this.setCustomValidity('')"></textarea>
                            </div>

                            <button type="submit" class="checkout-btn">Xác nhận thanh toán</button>
                        </form>
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
    </body>
</html>
