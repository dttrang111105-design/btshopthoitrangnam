<%-- 
    Document   : trangchitiet
    Created on : Apr 17, 2026, 12:54:26 PM
    Author     : Admin
--%>

<%@page import="DAO.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết sản phẩm</title>

        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            body { background:#f5f5f5; }
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
        <%
            Product d = (Product) request.getAttribute("detail");
            if(d == null){
        %>
            <h3>Lỗi: Không tìm thấy sản phẩm</h3>
        <%
            return;
            }
        %>
        <!-- 🔵 MENU -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Trang chủ</a>
                <div class="collapse navbar-collapse" id="mainNav">
                    <ul class="navbar-nav me-auto">
                        <!-- ÁO -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Áo
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Áo polo</a></li>
                                <li><a class="dropdown-item" href="#">Áo sơ mi</a></li>
                                <li><a class="dropdown-item" href="#">Áo khoác</a></li>
                            </ul>
                        </li>
                        <!-- QUẦN -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Quần
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Quần jean</a></li>
                                <li><a class="dropdown-item" href="#">Quần âu</a></li>
                            </ul>
                        </li>
                        <!-- GIÀY -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Giày
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Giày sneaker</a></li>
                                <li><a class="dropdown-item" href="#">Giày da</a></li>
                            </ul>
                        </li>
                        <!-- PHỤ KIỆN -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Phụ kiện
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Đồng hồ</a></li>
                                <li><a class="dropdown-item" href="#">Thắt lưng</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
                    </ul>
                    <div class="d-flex align-items-center">
                        <form class="d-flex me-3" action="TimKiem" method="get">
                            <input class="form-control me-2" type="search" name="name" placeholder="Nhập tên sản phẩm">
                            <button class="btn btn-outline-light">Tìm</button>
                        </form>
                        <!-- nút đăng nhập sau khi login sẽ chuyển thành giỏ hàng và ô chat -->
                        <!-- ICON GIỎ HÀNG -->
                            <a href="cart.jsp" class="btn btn-light me-2">
                                <i class="fa fa-shopping-cart"></i>
                            </a>
                            <!-- ICON CHAT -->
                            <a href="chat.jsp" class="btn btn-light me-2">
                                <i class="fa fa-comment"></i>
                            </a>
                            <!-- USER -->
                            <a href="dangxuat" class="btn btn-danger">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- 🔵 CONTENT -->
        <div class="container mt-4">
            <div class="row product-card">
                <!-- 🖼️ ẢNH -->
                <div class="col-md-5">
                    <div class="img-box">
                        <img src="<%=request.getContextPath()%>/<%=d.getImage()%>" class="product-img">
                    </div>
                </div>
                <!-- 📦 INFO -->
                <div class="col-md-7">
                    <!-- CATEGORY -->
                    <p>
                        Danh mục: 
                        <a href="trangchu?category=<%=d.getCategory()%>" class="category-link">
                            <%=d.getCategory()%>
                        </a>
                    </p>
                    <h2 class="product-name"><%=d.getName()%></h2>
                    <!-- ⭐ fake -->
                    ⭐⭐⭐⭐⭐ <span class="text-muted">(120 đánh giá)</span>
                    <!-- 💰 PRICE -->
                    <div class="price-box">
                        <%
                            if("sale".equalsIgnoreCase(d.getType())){
                        %>
                            <div class="price-old">
                                <%= (int)(d.getPrice()/0.8) %> VNĐ
                            </div>
                        <%
                            }
                        %>
                        <div class="price-new">
                            <%=d.getFormattedPrice()%> VNĐ
                        </div>
                    </div>
                    <!-- INFO -->
                    <div>
                        <p>🚚 Giao hàng toàn quốc</p>
                        <p>✔ Hàng chính hãng 100%</p>
                        <p>✔ Đổi trả trong 7 ngày</p>
                    </div>
                    <!-- SỐ LƯỢNG -->
                    <div class="mt-3">
                        <label>Số lượng:</label>
                        <input type="number" value="1" min="1" style="width:80px">
                    </div>
                    <!-- BUTTON -->
                    <div class="mt-4">
                        <a href="#" class="btn btn-cart">
                            <i class="fa fa-cart-plus"></i> Thêm vào giỏ
                        </a>
                        <a href="#" class="btn btn-buy">Mua ngay</a>
                    </div>
                </div>
            </div>
            <!-- 📄 MÔ TẢ -->
            <div class="desc-box">
                <div class="section-title">Mô tả sản phẩm</div>
                <p><%=d.getDesc()%></p>
            </div>
            <!-- 📦 THÔNG TIN -->
            <div class="desc-box">
                <div class="section-title">Thông tin chi tiết</div>
                <p>Danh mục: <%=d.getCategory()%></p>
                <p>Loại: <%=d.getType()%></p>
            </div>
            <!-- 🔵 FOOTER -->
            <div class="bg-dark text-white text-center p-3 mt-4">
                <p>Đàm Thu Trang - 11/11/2005</p>
                <p>Nguyễn Tiến Nam - 21/12/2005</p>
                <p>Phạm Doãn Nguyên - 25/04/2005</p>
            </div>
        </div>
    </body>
</html>
