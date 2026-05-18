<%-- 
    Document   : giohang
    Created on : Apr 19, 2026, 7:55:51 PM
    Author     : XPS
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Product"%>
<%@page import="model.CartItem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<CartItem> items = (List<CartItem>) request.getAttribute("items");
    Map<Integer, Product> productMap = (Map<Integer, Product>) request.getAttribute("productMap");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="trangchu.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <style>
            .cart-img{
                width:90px;
                height:90px;
                object-fit:cover;
                border-radius:18px;
                border:2px solid #f3f4f6;
                transition:.35s;
            }
            .cart-img:hover{
                transform:scale(1.05);
            }
            .cart-wrapper{
                background:white;
                border-radius:28px;
                padding:28px;
                box-shadow:0 10px 30px rgba(0,0,0,.08);
            }
            .cart-title{
                font-size:34px;
                font-weight:800;
                color:#111827;
                margin-bottom:28px;
            }
            .table{
                margin-bottom:0;
            }
            .table thead{
                background:#111827;
                color:white;
            }
            .table thead th{
                border:none;
                padding:18px;
                font-size:14px;
                text-transform:uppercase;
            }
            .table tbody td{
                vertical-align:middle;
                padding:18px 12px;
            }
            .product-name{
                font-size:17px;
                font-weight:700;
                color:#111827;
            }
            .stock-text{
                font-size:13px;
            }
            .price-text{
                color:#8b4513;
                font-weight:700;
                font-size:17px;
            }
            .btn-update{
                background:#111827;
                color:white;
                border:none;
                border-radius:12px;
                width:42px;
                height:42px;
                transition:.3s;
            }
            .btn-update:hover{
                background:#8b4513;
                color:white;
            }
            .btn-delete{
                border-radius:12px;
            }
            .total-box{
                background:#f9fafb;
                padding:24px;
                border-radius:22px;
                margin-top:24px;
            }
            .total-price{
                color:#8b4513;
                font-size:32px;
                font-weight:800;
            }
            .btn-checkout{
                background:#16a34a;
                border:none;
                border-radius:16px;
                padding:14px 28px;
                font-weight:700;
                transition:.3s;
            }
            .btn-checkout:hover{
                transform:translateY(-2px);
            }
            .alert{
                border-radius:20px;
            }
            input[type=number]{
                border-radius:12px;
            }
            @media(max-width:768px){
                .cart-title{
                    font-size:28px;
                }
                .cart-wrapper{
                    padding:20px;
                }
            }
        </style>

    </head>
    <body>
        <%
            Integer cartCount = (Integer) request.getAttribute("cartCount");
            if (cartCount == null) {
                cartCount = 0;
            }
        %>
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
                    <!-- MENU -->
                    <ul class="navbar-nav me-auto">
                        <!-- ÁO -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Áo
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="trangchu?category=áo polo">
                                        Áo polo
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="trangchu?category=áo sơ mi">
                                        Áo sơ mi
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="trangchu?category=áo khoác">
                                        Áo khoác
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- QUẦN -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Quần
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="trangchu?category=quần jean">
                                        Quần jean
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="trangchu?category=quần âu">
                                        Quần âu
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- GIÀY -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Giày
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="trangchu?category=giày sneaker">
                                        Giày sneaker
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="trangchu?category=giày da">
                                        Giày da
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- PHỤ KIỆN -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Phụ kiện
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="trangchu?category=đồng hồ">
                                        Đồng hồ
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="trangchu?category=thắt lưng">
                                        Thắt lưng
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="lienhe.jsp">
                                Liên hệ
                            </a>
                        </li>
                    </ul>
                    <!-- RIGHT -->
                    <div class="d-flex align-items-center">
                        <!-- SEARCH -->
                        <form class="d-flex me-3" action="TimKiem" method="get">
                            <input class="form-control me-2" type="search" name="name" placeholder="Nhập tên sản phẩm">
                            <button class="btn btn-outline-light px-4">
                                Tìm
                            </button>
                        </form>
                        <!-- GIỎ HÀNG -->
                        <a href="giohang" class="btn btn-light me-2 position-relative rounded-pill px-3">
                            <i class="fa fa-shopping-cart"></i>
                            <%
                                if (cartCount > 0) {
                            %>
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
                        <a href="dangxuat" class="btn btn-danger rounded-pill px-4">
                            Đăng xuất
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container mt-5">
            <h2 class="cart-title">🛒 Giỏ hàng của bạn</h2>
            <%
                if (items == null || items.isEmpty()) {
            %>
            <div class="alert alert-warning text-center">
                Giỏ hàng của bạn đang trống 😢
            </div>
            <%
            } else {
                double total = 0;
            %>
            <!--Card box-->
            <div class="cart-wrapper">
                <table class="table table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Xóa</th>
                            <th>Mua ngay</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (CartItem item : items) {
                                Product p = productMap.get(item.getProductId());
                                if (p == null) {
                                    continue;
                                }
                                double price = p.getPrice();
                                int quantity = item.getQuantity();
                                double subtotal = price * quantity;
                                total += subtotal;
                                //logic kiểm tra kho
                                int stock = p.getStock();
                                boolean isOutOfStock = (stock <= 0);
                                boolean isNotEnough = (quantity > stock);
                        %>
                        <tr>
                            <!-- Sản phẩm (ảnh+tên) -->
                            <td>
                                <div class="d-flex align-items-center gap-3">
                                    <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="cart-img"/>
                                    <div class="text-start">
                                        <div class="product-name"><%=p.getName()%></div>
                                        <small class="<%= (p.getStock() < 5) ? "text-danger" : "text-muted"%> fw-bold">
                                            Kho còn: <%= p.getStock()%>
                                        </small> <!-- Hiển thị tồn kho -->
                                        <%
                                            if (quantity > p.getStock()) {
                                        %>
                                        <div class="text-danger small">⚠️ Số lượng vượt quá tồn kho!</div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </td>
                            <td class="price-text"><%=p.getFormattedPrice()%> VNĐ</td>

                            <!--Update-->
                            <td>
                                <form action="capnhatgiohang" method="post" class="d-flex justify-content-center">
                                    <input type="hidden" name="id" value="<%=item.getId()%>">
                                    <input type="number" name="quantity" value="<%=quantity%>" min="1" max="<%=p.getStock()%>" class="form-control w-50 me-2">
                                    <button class="btn-update">
                                        <i class="fa-solid fa-rotate"></i>
                                    </button>
                                </form>
                            </td>
                            <td class="text-danger fw-bold"><%=Product.formatPrice(subtotal)%> VNĐ</td>
                            <!--Delete-->
                            <td>
                                <a href="xoagiohang?id=<%=item.getId()%>" class="btn btn-danger btn-sm">
                                    <i class="fa-solid fa-trash"></i>
                                </a>
                            </td>
                            <!-- Mua ngay --> 
                            <td>
                                <form action="ThanhToan" method="get">
                                    <input type="hidden" name="id" value="<%=p.getId()%>">
                                    <input type="hidden" name="quantity" value="<%=item.getQuantity()%>">

                                    <!-- Kiểm tra để vô hiệu hóa nút ấn Mua hàng -->
                                    <% if (isOutOfStock || isNotEnough) {%>
                                    <button class="btn btn-secondary btn-sm" disabled style="cursor: not-allowed; opacity: 0.6;">
                                        <%= isOutOfStock ? "Hết hàng" : "Không đủ hàng"%>
                                    </button>
                                    <% } else { %>
                                    <button class="btn btn-detail btn-sm">
                                        Mua hàng
                                    </button>
                                    <% } %>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <!--Total-->
                <div class="text-end total-box">
                    <h4>
                        Tổng tiền:
                        <span class="total-price">
                            <%=Product.formatPrice(total)%> VNĐ
                        </span>
                    </h4>

                    <div class="mt-3">
                        <form action="ThanhToan" method="get">
                            <button  class="btn btn-checkout">
                                <i class="fa-solid fa-credit-card"></i>
                                Thanh toán tất cả
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <jsp:include page="chatbox.jsp"/>
    </body>
</html>