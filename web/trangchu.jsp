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
    </head>

    <body>
        <!-- 🔵 BANNER -->
        <div class="banner">
            <div class="banner-overlay">
                <h1 class="logo">NTN SHOP</h1>
                <p>Phong cách - Trẻ trung - Hiện đại</p>
            </div>
        </div>

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
                        <%
                            Object user = session.getAttribute("user");
                            if (user == null) {
                        %>
                            <a href="dangnhap.jsp" class="btn btn-light">Đăng nhập</a>
                        <%
                            } else {
                        %>
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
                        <div class="left-menu-box">
                            <div class="list-group">
                                <a href="#" class="list-group-item active">Danh mục</a>
                                <a href="#" class="list-group-item">Áo</a>
                                <a href="#" class="list-group-item">Quần</a>
                                <a href="#" class="list-group-item">Giày</a>
                                <a href="#" class="list-group-item">Phụ kiện</a>
                            </div>
                        </div>
                    </div>

                    <!-- 🟢 CONTENT -->
                    <div class="col-md-9">
                        <%
                            List<Product> list = (List<Product>) request.getAttribute("list");
                            String name = (String) request.getAttribute("name");
                            if(list!=null && !list.isEmpty()){
                        %>
                        <h3>Kết quả tìm kiếm của "<%=name%>"</h3>
                        <div class="row row-cols-5">
                            <%
                                for(Product p : list){
                            %>
                            <div class="col mb-4">
                                <div class="card product-card">
                                    <img src="<%=request.getContextPath()%>/<%= p.getImage() %>" class="card-img-top product-img">
                                    <div class="card-body text-center">
                                        <h5><%=p.getName()%></h5>
                                        <p><%=p.getFormattedPrice()%> VNĐ</p>
                                        <a href="detail?id=<%= p.getId() %>" class="btn btn-detail">
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
                            }
                        %>
                        <%
                            if(list == null || list.isEmpty()){
                        %>
                            <!-- 🔥 HÀNG MỚI -->
                            <h3 class="mb-3">Hàng mới</h3>
                            <div class="row row-cols-5">
                                <%
                                    List<Product> listNew = (List<Product>) request.getAttribute("lNew");
                                    if (listNew != null) {
                                        for (Product p : listNew) {
                                %>
                                <div class="col mb-4">
                                    <div class="card product-card">
                                        <img src="<%=request.getContextPath()%>/<%= p.getImage() %>" class="card-img-top product-img">
                                        <div class="card-body text-center">
                                            <h5 class="card-title"><%= p.getName()%></h5>
                                            <p class="price"><%= p.getFormattedPrice()%> VNĐ</p>
                                            <a href="detail?id=<%= p.getId()%>" class="btn btn-detail">
                                                Xem chi tiết
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>

                            <!-- 🔥 HÀNG BÁN CHẠY -->
                            <h3 class="mb-3 mt-4">Hàng bán chạy</h3>
                            <div class="row row-cols-5">
                                <%
                                    List<Product> listHot = (List<Product>) request.getAttribute("lHot");
                                    if (listHot != null) {
                                        for (Product p : listHot) {
                                %>
                                <div class="col mb-4">
                                    <div class="card product-card">
                                        <img src="<%=request.getContextPath()%>/<%= p.getImage() %>" class="card-img-top product-img">
                                        <div class="card-body text-center">
                                            <h5 class="card-title"><%= p.getName()%></h5>
                                            <p class="price"><%= p.getFormattedPrice()%> VNĐ</p>
                                            <a href="detail?id=<%= p.getId()%>" class="btn btn-detail">
                                                Xem chi tiết
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>

                            <!-- 🔥 HÀNG GIẢM GIÁ -->
                            <h3 class="mb-3 mt-4">Hàng giảm giá</h3>
                            <div class="row row-cols-5">
                                <%
                                    NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
                                    List<Product> listSale = (List<Product>) request.getAttribute("lSale");
                                    if (listSale != null) {
                                        for (Product p : listSale) {
                                %>
                                <div class="col mb-4">
                                    <div class="card product-card">
                                        <img src="<%=request.getContextPath()%>/<%= p.getImage() %>" class="card-img-top product-img">
                                        <div class="card-body text-center">
                                            <h5 class="card-title"><%= p.getName()%></h5>
                                            <p class="price">
                                                <del><%= formatter.format(p.getPrice() / 0.8) %> VNĐ</del><br>
                                                <b style="color:red"><%= p.getFormattedPrice()%> VNĐ</b>
                                            </p>
                                            <a href="detail?id=<%= p.getId()%>" class="btn btn-detail">
                                                Xem chi tiết
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        }
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

            <script src="css/css/js/bootstrap.bundle.min.js"></script>
        </body>
</html>