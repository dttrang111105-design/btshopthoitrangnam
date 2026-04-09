<%-- 
    Document   : trangchu
    Created on : Apr 6, 2026, 8:28:21 PM
    Author     : XPS
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop thời trang nam</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <body>

        <!-- 🔵 BANNER -->
        <div class="bg-dark text-white text-center p-4">
            <h1>SHOP THỜI TRANG NAM</h1>
            <p>Phong cách - Trẻ trung - Hiện đại</p>
        </div>

        <!-- 🔵 TOP MENU -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Trang chủ</a>

                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="#">Áo</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Quần</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Phụ kiện</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
                    </ul>

                    <a href="login.jsp" class="btn btn-light">Đăng nhập</a>
                </div>
            </div>
        </nav>

        <!-- 🔵 MAIN -->
        <div class="container-fluid mt-3">
            <%
                List<Product> list = (List<Product>) request.getAttribute("plist");
            %>
            <div class="row">

                <!-- 🟡 LEFT MENU -->
                <div class="col-md-3">
                    <div class="list-group">
                        <a href="#" class="list-group-item active">Danh mục</a>
                        <a href="#" class="list-group-item">Áo</a>
                        <a href="#" class="list-group-item">Quần</a>
                        <a href="#" class="list-group-item">Giày</a>
                        <a href="#" class="list-group-item">Phụ kiện</a>
                    </div>
                </div>

                <!-- 🟢 CONTENT -->
                <div class="col-md-9">
                    <h3>Hàng mới</h3>
                    <div class="row">
                        <%
                            List<Product> listNew = (List<Product>) request.getAttribute("lNew");
                            if (listNew != null) {
                                for (Product p : listNew) {
                        %>

                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <img src="<%= p.getImage()%>" class="card-img-top" height="200">
                                <div class="card-body text-center">
                                    <h5 class="card-title"><%= p.getName()%></h5>
                                    <p class="text-danger"><%= p.getPrice()%> VNĐ</p>
                                    <a href="detail?id=<%= p.getId()%>" class="btn btn-primary">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                    
                    <h3>Hàng bán chạy</h3>
                    <div class="row">
                        <%
                            List<Product> listHot = (List<Product>) request.getAttribute("lHot");
                            if (listHot != null) {
                                for (Product p : listHot) {
                        %>

                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <img src="<%= p.getImage()%>" class="card-img-top" height="200">
                                <div class="card-body text-center">
                                    <h5 class="card-title"><%= p.getName()%></h5>
                                    <p class="text-danger"><%= p.getPrice()%> VNĐ</p>
                                    <a href="detail?id=<%= p.getId()%>" class="btn btn-primary">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                    
                    <h3>Hàng giảm giá</h3>
                    <div class="row">
                        <%
                            List<Product> listSale = (List<Product>) request.getAttribute("lSale");
                            if (listSale != null) {
                                for (Product p : listSale) {
                        %>

                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <img src="<%= p.getImage()%>" class="card-img-top" height="200">
                                <div class="card-body text-center">
                                    <h5 class="card-title"><%= p.getName()%></h5>
                                    <p class="text-danger"><%= p.getPrice()%> VNĐ</p>
                                    <a href="detail?id=<%= p.getId()%>" class="btn btn-primary">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>

                    
                </div>

            </div>
        </div>

        <!-- 🔵 FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-4">
            <p>SV: Nguyễn Văn A - 2000xxxx</p>
            <p>Hà Nội - 2026</p>
        </div>

        <script src="css/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    </body>
</html>
