<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model.CartItem"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thanh toán tất cả</title>

        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            body{
                background:#f3f4f6;
            }
            /* MAIN BOX */
            .checkout-wrapper{
                background:white;
                border-radius:28px;
                padding:40px;
                box-shadow:0 10px 40px rgba(0,0,0,0.08);
            }
            /* TITLE */
            .checkout-title{
                font-size:36px;
                font-weight:800;
                margin-bottom:35px;
                color:#111827;
            }
            /* ITEM */
            .checkout-item{
                padding:22px 0;
                border-bottom:1px solid #f0f0f0;
            }
            .checkout-img{
                width:100%;
                height:140px;
                object-fit:cover;
                border-radius:18px;
            }
            /* PRODUCT INFO */
            .checkout-product-name{
                font-size:22px;
                font-weight:700;
                margin-bottom:10px;
            }
            .checkout-meta{
                color:#6b7280;
                margin-bottom:6px;
            }
            .checkout-subtotal{
                font-size:26px;
                font-weight:800;
                color:#dc2626;
            }
            /* TOTAL */
            .total-box{
                background:#111827;
                color:white;
                border-radius:22px;
                padding:28px;
                margin-top:35px;
            }
            .total-label{
                font-size:20px;
            }
            .total-price{
                font-size:40px;
                font-weight:800;
            }
            /* FORM */
            .form-section{
                margin-top:45px;
            }
            .form-title{
                font-size:30px;
                font-weight:800;
                margin-bottom:30px;
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
            .checkout-label{
                font-weight:700;
                margin-bottom:10px;
            }
            /* BUTTON */
            .checkout-btn{
                width:100%;
                border:none;
                background:#8b4513;
                color:white;
                border-radius:16px;
                padding:16px;
                font-size:18px;
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
                .checkout-title{
                    font-size:28px;
                }
                .checkout-product-name{
                    margin-top:18px;
                    font-size:20px;
                }
                .checkout-subtotal{
                    margin-top:15px;
                    text-align:left !important;
                }
                .total-price{
                    font-size:32px;
                }
            }
            .qr-box{
                background:white;
                border-radius:20px;
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
            List<CartItem> items = (List<CartItem>) request.getAttribute("items");
            Map<Integer, Product> productMap = (Map<Integer, Product>) request.getAttribute("productMap");
            Double total = (Double) request.getAttribute("total");
            double subtotal = total;
            double vat = subtotal * 0.08;
            double finalTotal = subtotal + vat;
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
        <div class="container py-5">
            <div class="checkout-wrapper">
                <h1 class="checkout-title">
                    Thanh toán tất cả sản phẩm
                </h1>

                <!-- LIST SẢN PHẨM -->
                <%
                    for (CartItem item : items) {
                        Product p = productMap.get(item.getProductId());
                        if (p == null) {
                            continue;
                        }

                        double sub = p.getPrice() * item.getQuantity();
                %>

                <div class="checkout-item row align-items-center">
                    <div class="col-md-2">
                        <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="checkout-img">
                    </div>
                    <div class="col-md-6">
                        <div class="checkout-product-name">
                            <%=p.getName()%>
                        </div>
                        <div class="checkout-meta">
                            Số lượng:
                            <b>x<%=item.getQuantity()%></b>
                        </div>
                        <div class="checkout-meta">
                            Giá:
                            <%=p.getFormattedPrice()%> VNĐ
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
                <div class="total-box">
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
                        <div class="total-label">
                            Tổng thanh toán 
                        </div>
                        <div class="total-price ms-3">
                            <%=String.format("%,.0f", finalTotal)%> VNĐ
                        </div>
                    </div>
                </div>

                <h2 class="form-title">Thông tin nhận hàng</h2>
                <form action="ThanhToan" method="post">
                    <input type="hidden" name="all" value="true">
                    <div class="mb-3">
                        <label class="checkout-label">Họ tên</label>
                        <input type="text" name="name" class="form-control checkout-input" required>
                    </div>
                    <div class="mb-3">
                        <label class="checkout-label">Số điện thoại</label>
                        <input type="tel" name="phone" class="form-control checkout-input" required>
                    </div>
                    <div class="mb-3">
                        <label class="checkout-label">Địa chỉ</label>
                        <textarea name="address" class="form-control checkout-input" required></textarea>
                    </div>
                    <div class="d-flex gap-3">
                        <!-- QR -->
                        <button type="button" class="checkout-btn" style="background:#111827;" onclick="showQR()">
                            <i class="fa fa-qrcode"></i>
                            Thanh toán QR
                        </button>
                        <!-- COD -->
                        <button type="submit" class="checkout-btn">
                            <i class="fa fa-money-bill-wave"></i>
                            Thanh toán COD
                        </button>
                    </div>
                </form>
                <!-- QR BOX -->
                <div class="qr-box d-none mt-4" id="qrBox">
                    <h3 class="mb-3">
                        Quét mã để thanh toán
                    </h3>
                    <img
                        src="https://img.vietqr.io/image/TPB-00004076475-compact2.png?amount=<%= (long) finalTotal%>&addInfo=NTNSHOP"
                        class="qr-image">
                    <div class="mt-3">
                        <div>
                            Ngân hàng:
                            <b>TP BANK</b>
                        </div>
                        <div>
                            STK:
                            <b>00004076475</b>
                        </div>
                        <div class="text-danger fw-bold mt-2">
                            Nội dung: thanh toán đơn hàng của NTNSHOP
                        </div>
                    </div>

                    <!-- ĐÃ THANH TOÁN -->

                    <form action="ThanhToan" method="post" class="mt-4">
                        <input type="hidden" name="all" value="true">
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
        </div>
        <script>
            function showQR() {
                document.getElementById("qrName").value =
                        document.querySelector("input[name='name']").value;
                document.getElementById("qrPhone").value =
                        document.querySelector("input[name='phone']").value;
                document.getElementById("qrAddress").value =
                        document.querySelector("textarea[name='address']").value;
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
    </body>
</html>