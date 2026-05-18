<%-- 
    Document   : trangchu
    Created on : Apr 6, 2026, 8:28:21 PM
    Author     : XPS
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>NTN Shop - Thời trang nam</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600;800&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
        <style>
            /* SLIDER SECTION */
            .slider-section {
                margin-bottom: 3rem;
                padding: 0 30px;
            }
            .slider-section h3 {
                font-weight: 700;
                margin-bottom: 1rem;
                color: #1a1a1a;
                border-left: 4px solid #8b4513;
                padding-left: 12px;
            }
            /* CUSTOM SLIDER */
            .custom-slider {
                display: flex;
                align-items: center;
                gap: 8px;
                width: 100%;
            }
            .slider-track-wrap {
                overflow-x: auto;
                scroll-behavior: smooth;
                scrollbar-width: none;
                flex: 1;
                min-width: 0;
            }
            .slider-track-wrap::-webkit-scrollbar {
                display: none;
            }
            .slider-track {
                display: flex !important;
                flex-wrap: nowrap !important;
                transition: transform 0.4s ease;
                width: max-content;
            }
            .slider-card {
                width: 200px;
                flex-shrink: 0;
                padding: 0 6px;
                box-sizing: border-box;
            }
            .slider-card .card {
                width: 100%;
            }
            .slider-btn {
                background: #1a1a1a;
                color: white;
                border: none;
                border-radius: 50%;
                width: 36px;
                height: 36px;
                font-size: 16px;
                cursor: pointer;
                flex-shrink: 0;
                transition: 0.3s;
            }
            .slider-btn:hover {
                background: #8b4513;
            }
            .navbar{
                position: sticky;
                top: 0;
                z-index: 9999 !important;
            }

            .dropdown-menu{
                z-index: 10000 !important;
            }

            .left-menu-box{
                z-index: 10 !important;
            }
        </style>
    </head>

    <body>
        <!-- 🔵 BANNER -->
        <div class="banner">
            <div class="banner-overlay">
                <h1 class="logo">NTN SHOP</h1>
                <p>Phong cách - Trẻ trung - Hiện đại</p>
            </div>
        </div>

        <%
            //hiển thị số lượng hàng trong giỏ
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

                    <ul class="navbar-nav me-auto">
                        <!-- ÁO -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Quần
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=quần jean">Quần jean</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=quần âu">Quần âu</a></li>
                            </ul>
                        </li>

                        <!-- GIÀY -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Giày
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=giày sneaker">Giày sneaker</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=giày da">Giày da</a></li>
                            </ul>
                        </li>

                        <!-- PHỤ KIỆN -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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

                        Tìm kiếm theo loại
                        <form class="d-flex me-3" action="TimKiem" method="get">
                            <input class="form-control me-2" type="search" name="name" placeholder="Nhập tên sản phẩm">
                            <button class="btn btn-outline-light px-4">Tìm</button>
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
        <div class="container-fluid mt-4">
            <div class="row">

                <!-- 🟡 LEFT MENU -->
                <div class="col-md-3">
                    <div class="left-menu-box sticky-top" style="top: 70px;">
                        <div class="list-group">
                            <a href="#" class="list-group-item active">Danh mục</a>
                            <a href="trangchu?type=new" class="list-group-item">Hàng mới</a>
                            <a href="trangchu?type=hot" class="list-group-item">Hàng bán chạy</a>
                            <a href="trangchu?type=sale" class="list-group-item">Hàng giảm giá</a>
                        </div>
                    </div>
                </div>

                <!-- 🟢 CONTENT -->
                <div class="col-md-9">
                    <%
                        List<Product> list = (List<Product>) request.getAttribute("list");
                        String name = (String) request.getAttribute("name");
                        String category = (String) request.getAttribute("category");
                        String type = (String) request.getAttribute("type");
                    %>
                    <% if (list != null) { %>

                    <!-- 🔥 TITLE -->
                    <%
                        if (name != null) {
                    %>
                    <h3>Kết quả tìm kiếm của "<%=name%>"</h3>
                    <%
                    } else if (category != null) {
                    %>
                    <h3>Sản phẩm thuộc danh mục "<%=category%>"</h3>
                    <%
                    } else if (type != null) {
                        if (type.equals("new")) {
                    %>
                    <h3>Hàng mới</h3>
                    <%
                    } else if (type.equals("hot")) {
                    %>
                    <h3>Hàng bán chạy</h3>
                    <%
                    } else if (type.equals("sale")) {
                    %>
                    <h3>Hàng giảm giá</h3>
                    <%
                        }
                    } else {
                    %>
                    <h3>Tất cả sản phẩm</h3>
                    <%
                        }
                    %>                  
                    <!-- 🔥 LIST -->
                    <div class="row row-cols-5">
                        <% for (Product p : list) {%>
                        <div class="col mb-4">
                            <div class="card product-card">
                                <img src="<%=request.getContextPath()%>/<%= p.getImage()%>" class="card-img-top product-img">
                                <div class="card-body text-center">
                                    <h5><%=p.getName()%></h5>
                                    <p><%=p.getFormattedPrice()%> VNĐ</p>
                                    <a href="trangchitiet?id=<%= p.getId()%>" 
                                       class="btn btn-detail">
                                        Xem chi tiết
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <%
                    } else {
                    %>
                    <!-- HÀNG MỚI -->
                    <div class="slider-section">
                        <h3 class="mb-3">Hàng mới</h3>
                        <%
                            List<Product> listNew = (List<Product>) request.getAttribute("lNew");
                            if (listNew != null && !listNew.isEmpty()) {
                        %>
                        <div class="custom-slider">
                            <button class="slider-btn prev-btn" onclick="slideMove('sliderNew', -1)">&#10094;</button>
                            <div class="slider-track-wrap">
                                <div class="slider-track" id="sliderNew">
                                    <%
                                        for (Product p : listNew) {
                                    %>
                                    <div class="slider-card">
                                        <div class="card product-card">
                                            <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="card-img-top product-img">
                                            <div class="card-body text-center">
                                                <h5 class="card-title"><%=p.getName()%></h5>
                                                <p class="price"><%=p.getFormattedPrice()%> VNĐ</p>
                                                <a href="trangchitiet?id=<%=p.getId()%>" class="btn btn-detail">Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <button class="slider-btn next-btn" onclick="slideMove('sliderNew', 1)">&#10095;</button>
                        </div>
                        <%
                            }
                        %>
                    </div>

                    <!-- HÀNG BÁN CHẠY -->
                    <div class="slider-section">
                        <h3 class="mb-3">Hàng bán chạy</h3>
                        <%
                            List<Product> listHot = (List<Product>) request.getAttribute("lHot");
                            if (listHot != null && !listHot.isEmpty()) {
                        %>
                        <div class="custom-slider">
                            <button class="slider-btn prev-btn" onclick="slideMove('sliderHot', -1)">&#10094;</button>
                            <div class="slider-track-wrap">
                                <div class="slider-track" id="sliderHot">
                                    <%
                                        for (Product p : listHot) {
                                    %>
                                    <div class="slider-card">
                                        <div class="card product-card">
                                            <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="card-img-top product-img">
                                            <div class="card-body text-center">
                                                <h5 class="card-title"><%=p.getName()%></h5>
                                                <p class="price"><%=p.getFormattedPrice()%> VNĐ</p>
                                                <a href="trangchitiet?id=<%=p.getId()%>" class="btn btn-detail">Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <button class="slider-btn next-btn" onclick="slideMove('sliderHot', 1)">&#10095;</button>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <!-- HÀNG GIẢM GIÁ -->
                    <div class="slider-section">
                        <h3 class="mb-3">Hàng giảm giá</h3>
                        <%
                            NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
                            List<Product> listSale = (List<Product>) request.getAttribute("lSale");
                            if (listSale != null && !listSale.isEmpty()) {
                        %>
                        <div class="custom-slider">
                            <button class="slider-btn prev-btn" onclick="slideMove('sliderSale', -1)">&#10094;</button>
                            <div class="slider-track-wrap">
                                <div class="slider-track" id="sliderSale">
                                    <%
                                        for (Product p : listSale) {
                                    %>
                                    <div class="slider-card">
                                        <div class="card product-card">
                                            <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="card-img-top product-img">
                                            <div class="card-body text-center">
                                                <h5 class="card-title"><%=p.getName()%></h5>
                                                <p class="price">
                                                    <del><%=formatter.format(p.getPrice() / 0.8)%> VNĐ</del><br>
                                                    <b style="color:red"><%= p.getFormattedPrice()%> VNĐ</b>
                                                </p>
                                                <a href="trangchitiet?id=<%=p.getId()%>" class="btn btn-detail">Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <button class="slider-btn next-btn" onclick="slideMove('sliderSale', 1)">&#10095;</button>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <!-- 🔵 FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-4">
            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>
        </div>
        <script>
            function slideMove(id, direction) {
                const track = document.getElementById(id);
                if (!track)
                    return;
                const wrap = track.parentElement;
                wrap.scrollLeft += direction * 212;
            }
        </script>
        <script src="css/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="chatbox.jsp"/>
    </body>
</html>