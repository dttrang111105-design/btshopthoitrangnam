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
            .checkout-modern{
                background:white;
                border-radius:24px;
                padding:28px;
                box-shadow:0 10px 35px rgba(0,0,0,.08);
            }
            .product-mini-card{
                display:flex;
                gap:18px;
                background:#f9fafb;
                border-radius:20px;
                padding:16px;
                align-items:center;
            }
            .mini-product-image{
                width:120px;
                height:120px;
                border-radius:18px;
                object-fit:cover;
            }
            .mini-product-info h2{
                font-size:22px;
                font-weight:800;
                margin-bottom:10px;
            }
            .mini-price{
                color:#8b4513;
                font-size:22px;
                font-weight:800;
                margin-bottom:12px;
            }
            .mini-meta{
                display:flex;
                gap:14px;
                flex-wrap:wrap;
            }
            .payment-total-box{
                margin-top:20px;
                background:#111827;
                color:white;
                border-radius:22px;
                padding:22px;
                display:flex;
                justify-content:space-between;
                align-items:center;
            }
            .payment-total-price{
                font-size:28px;
                font-weight:800;
            }
            .payment-icon{
                font-size:38px;
                color:#c49b63;
            }
            .checkout-form-box{
                background:#f9fafb;
                border-radius:22px;
                padding:24px;
            }
            .checkout-form-title{
                font-size:28px;
                font-weight:800;
                margin-bottom:22px;
            }
            .modern-input{
                border-radius:14px;
                padding:14px;
                border:2px solid #e5e7eb;
            }
            .modern-input:focus{
                border-color:#111827;
                box-shadow:none;
            }
            .payment-btn{
                flex:1;
                border:none;
                border-radius:16px;
                padding:15px;
                font-weight:700;
                color:white;
                transition:.3s;
            }
            .qr-btn{
                background:#111827;
            }
            .cash-btn{
                background:#8b4513;
            }
            .payment-btn:hover{
                transform:translateY(-2px);
                opacity:.9;
            }
            .qr-box{
                margin-top:20px;
                background:white;
                border-radius:22px;
                padding:24px;
                text-align:center;
                border:2px dashed #d1d5db;
            }
            .qr-image{
                width:240px;
                max-width:100%;
            }
        </style>
    </head>
    <body>
        <%
            Integer cartCount = (Integer) request.getAttribute("cartCount");
            if (cartCount == null) {
                cartCount = 0;
            }
            Product p = (Product) request.getAttribute("p");
            if (p == null) {
        %>
        <div class="container mt-5">
            <h3>Không tìm thấy sản phẩm</h3>
        </div>
        <%
                return;
            }
            int quantity = (Integer) request.getAttribute("quantity");
            double subtotal = p.getPrice() * quantity;
            double vat = subtotal * 0.08;
            double total = subtotal + vat;
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
                            <% if (cartCount > 0) {%>
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
        <!-- THANH TOÁN -->
        <div class="container py-4">
            <div class="checkout-modern">
                <div class="row g-4 align-items-start">
                    <!-- LEFT -->
                    <div class="col-lg-5">
                        <div class="product-mini-card">
                            <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="mini-product-image">
                            <div class="mini-product-info">
                                <h2><%=p.getName()%></h2>
                                <div class="mini-price">
                                    <%=p.getFormattedPrice()%> VNĐ
                                </div>
                                <div class="mini-meta">
                                    <span>
                                        <i class="fa fa-layer-group"></i>
                                        <%=p.getCategory()%>
                                    </span>
                                    <span>
                                        <i class="fa fa-cube"></i>
                                        SL: <%=quantity%>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- TOTAL -->
                        <div class="payment-total-box">
                            <div>
                                <p class="mb-1 text-secondary">
                                    Tổng thanh toán
                                </p>
                                <div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <span>Tạm tính</span>
                                        <span>
                                            <%=String.format("%,.0f", subtotal)%> VNĐ
                                        </span>
                                    </div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <span>VAT (8%)</span>
                                        <span class="text-warning">
                                            + <%=String.format("%,.0f", vat)%> VNĐ
                                        </span>
                                    </div>
                                    <hr class="border-light">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">
                                            Tổng thanh toán
                                        </h5>
                                        <h2 class="payment-total-price mb-0">
                                            <%=String.format("%,.0f", total)%> VNĐ
                                        </h2>
                                    </div>
                                </div>
                            </div>
                            <i class="fa fa-wallet payment-icon"></i>
                        </div>
                        <!-- QR -->
                        <div class="qr-box d-none" id="qrBox">
                            <h4 class="mb-3">
                                Quét mã để thanh toán
                            </h4>
                            <img
                                src="https://img.vietqr.io/image/TPB-00004076457-compact2.png?amount=<%= (long) total%>&addInfo=NTNSHOP"
                                class="qr-image">
                            <div class="mt-3">
                                <div>
                                    Ngân hàng: <b>TP BANK</b>
                                </div>
                                <div>
                                    STK: <b>00004076475</b>
                                </div>
                                <div class="text-danger fw-bold mt-2">
                                    Nội dung: thanh toán đơn hàng của NTNSHOP
                                </div>
                            </div>
                            <!-- BUTTON ĐÃ THANH TOÁN -->
                            <form action="ThanhToan" method="post" class="mt-4">
                                <input type="hidden" name="id" value="<%=p.getId()%>">
                                <input type="hidden" name="quantity" value="<%=quantity%>">
                                <input type="hidden" name="name" id="qrName">
                                <input type="hidden" name="phone" id="qrPhone">
                                <input type="hidden" name="address" id="qrAddress">
                                <button type="submit" class="btn btn-success w-100 py-3 fw-bold">
                                    <i class="fa fa-circle-check"></i>
                                    Đã thanh toán
                                </button>
                            </form>
                        </div>
                    </div>
                    <!-- RIGHT -->
                    <div class="col-lg-7">
                        <div class="checkout-form-box">
                            <h2 class="checkout-form-title">
                                Thông tin nhận hàng
                            </h2>
                            <form action="ThanhToan" method="post" id="checkoutForm">
                                <input type="hidden" name="id" value="<%=p.getId()%>">
                                <input type="hidden" name="quantity" value="<%=quantity%>">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="checkout-label">
                                            Họ tên
                                        </label>
                                        <input type="text" name="name" class="form-control modern-input" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="checkout-label">
                                            Số điện thoại
                                        </label>
                                        <input type="tel" name="phone" class="form-control modern-input" required>
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <label class="checkout-label">
                                        Địa chỉ nhận hàng
                                    </label>
                                    <textarea name="address" class="form-control modern-input" rows="3" required></textarea>
                                </div>
                                <!-- BUTTONS -->
                                <div class="d-flex gap-3">
                                    <button type="button" class="payment-btn qr-btn" onclick="showQR()">
                                        <i class="fa fa-qrcode"></i>
                                        Thanh toán QR
                                    </button>
                                    <button type="submit" class="payment-btn cash-btn">
                                        <i class="fa fa-money-bill-wave"></i>
                                        Thanh toán COD
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function showQR() {
                // COPY dữ liệu form sang QR form
                document.getElementById("qrName").value =
                        document.querySelector("input[name='name']").value;
                document.getElementById("qrPhone").value =
                        document.querySelector("input[name='phone']").value;
                document.getElementById("qrAddress").value =
                        document.querySelector("textarea[name='address']").value;
                // HIỆN QR
                document
                        .getElementById("qrBox")
                        .classList
                        .remove("d-none");
                document
                        .getElementById("qrBox")
                        .scrollIntoView({
                            behavior: "smooth"
                        });
            }

        </script>
        <!-- 🔵 FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-4">
            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>
        </div>
    </body>
</html>
