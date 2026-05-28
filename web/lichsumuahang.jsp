<%-- 
    Document   : lichsumuahang
    Created on : May 18, 2026
--%>

<%@page import="java.util.List"%>
<%@page import="DAO.OrderDetailDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lịch sử mua hàng</title>

        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>

            body{
                background:#f5f5f5;
            }

            .order-box{
                background:white;
                border-radius:15px;
                padding:25px;
                margin-bottom:30px;
                box-shadow:0 5px 15px rgba(0,0,0,0.1);
            }

            .order-title{
                font-size:22px;
                font-weight:bold;
                margin-bottom:20px;
                color:#8b4513;
            }

            .product-item{
                display:flex;
                align-items:center;
                border-bottom:1px solid #eee;
                padding:15px 0;
            }

            .product-item:last-child{
                border:none;
            }

            .product-img{
                width:100px;
                height:100px;
                object-fit:cover;
                border-radius:10px;
                margin-right:20px;
            }

            .product-name{
                font-size:18px;
                font-weight:bold;
            }

            .product-price{
                color:red;
                font-weight:bold;
            }

            .total-box{
                text-align:right;
                margin-top:20px;
                font-size:22px;
                font-weight:bold;
                color:red;
            }

            .empty-box{
                background:white;
                padding:50px;
                border-radius:15px;
                text-align:center;
                box-shadow:0 5px 15px rgba(0,0,0,0.1);
            }

        </style>

    </head>

    <body>

        <!-- BANNER -->
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

        <!-- MAIN -->
        <div class="container mt-5">

            <h2 class="mb-4 fw-bold">
                <i class="fa fa-clock-rotate-left"></i>
                Lịch sử mua hàng
            </h2>

            <%
                List<Orders> listOrder
                        = (List<Orders>) request.getAttribute("listOrder");

                if (listOrder != null && !listOrder.isEmpty()) {

                    OrderDetailDAO detailDAO
                            = new OrderDetailDAO();

                    for (Orders o : listOrder) {

            %>

            <!-- 1 ĐƠN HÀNG -->
            <div class="order-box">

                <div class="order-title">

                    Đơn hàng #<%= o.getId()%>

                    <div style="font-size:15px;color:gray;margin-top:5px;">
                        Ngày đặt:
                        <%= o.getOrderDate()%>
                    </div>

                </div>

                <%

                    List<OrderDetail> details
                            = detailDAO.getByOrderId(o.getId());

                    for (OrderDetail od : details) {

                %>

                <!-- 1 SẢN PHẨM -->
                <div class="product-item">

                    <img src="<%=request.getContextPath()%>/<%= od.getImage()%>"
                         class="product-img">

                    <div style="flex:1;">

                        <div class="product-name">
                            <%= od.getProductName()%>
                        </div>

                        <div>
                            Số lượng:
                            <b><%= od.getQuantity()%></b>
                        </div>

                    </div>

                    <div class="product-price">

                        <%= String.format("%,.0f", od.getPrice())%> VNĐ

                    </div>

                </div>

                <%
                    }
                %>

                <!-- TỔNG -->
                <%
                    double vat = o.getTotalMoney() * 0.08;
                    double totalVat = o.getTotalMoney() + vat;
                %>

                <div class="total-box">
                    <div>
                        Tạm tính:
                        <%= String.format("%,.0f", o.getTotalMoney())%> VNĐ
                    </div>
                    <div style="font-size:18px;color:#ff9800;">
                        VAT (8%):
                        <%= String.format("%,.0f", vat)%> VNĐ
                    </div>
                    <div style=" margin-top:10px; font-size:26px; font-weight:bold; color:red; ">
                        Tổng thanh toán:
                        <%= String.format("%,.0f", totalVat)%> VNĐ
                    </div>
                    <!-- NÚT XUẤT PDF -->
                    <a href="xuathoadon?id=<%= o.getId()%>" target="_blank" class="btn btn-danger mt-3">
                        <i class="fa fa-file-pdf"></i>
                        Xem hóa đơn PDF
                    </a>
                </div>

            </div>

            <%
                }

            } else {
            %>

            <!-- KHÔNG CÓ ĐƠN -->
            <div class="empty-box">

                <h3>Bạn chưa có đơn hàng nào</h3>

                <a href="trangchu"
                   class="btn btn-dark mt-3">

                    Tiếp tục mua sắm

                </a>

            </div>

            <%
                }
            %>

        </div>

        <!-- FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-5">

            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>

        </div>

        <script src="css/css/js/bootstrap.bundle.min.js"></script>

    </body>
</html>