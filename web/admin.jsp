<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="model.Orders"%>
<%
    List<Orders> list = (List<Orders>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>ADMIN - NTN SHOP</title>
        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="trangchu.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
        <style>
            body{
                background: #f5f5f5;
            }
            .admin-header{
                background: linear-gradient(
                    135deg,
                    #111,
                    #2c2c2c
                    );
                padding: 40px;
                border-radius: 18px;
                color: white;
                margin-bottom: 30px;
                box-shadow:
                    0 10px 25px rgba(0,0,0,0.2);
            }
            .admin-header h1{
                font-weight: 800;
                letter-spacing: 2px;
                margin: 0;
            }
            .admin-header p{
                margin-top: 10px;
                color: #d4b483;
                font-size: 18px;
            }
            .table-box{
                background: white;
                border-radius: 18px;
                overflow: hidden;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            }
            .table thead{
                background: #1a1a1a;
                color: white;
            }
            .table thead th{
                padding: 18px;
                border: none;
                font-size: 15px;
                letter-spacing: 1px;
            }
            .table tbody td{
                padding: 18px;
                vertical-align: middle;
            }
            .table tbody tr{
                transition: 0.3s;
            }
            .table tbody tr:hover{
                background: #faf7f2;
                transform: scale(1.005);
            }
            .price-text{
                color: #8b4513;
                font-weight: bold;
                font-size: 16px;
            }
            .status{
                padding: 7px 14px;
                border-radius: 30px;
                font-size: 13px;
                font-weight: bold;
                background: #fff3cd;
                color: #856404;
            }
            .btn-action{
                border: none;
                padding: 8px 16px;
                border-radius: 30px;
                color: white;
                font-size: 14px;
                transition: 0.3s;
            }
            .btn-view{
                background: #000;
            }
            .btn-view:hover{
                background: #8b4513;
            }
            .empty-box{
                padding: 50px;
                text-align: center;
                color: #777;
            }
        </style>
    </head>
    <body>
        <!-- 🔵 NAVBAR ADMIN -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="Admin"> NTN ADMIN </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="adminNav">
                    <!-- LEFT MENU -->
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Admin">
                                <i class="fa fa-home"></i> Trang chủ
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="quanlysanpham">
                                <i class="fa fa-box"></i>  Sản phẩm
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="quanlyuser">
                                <i class="fa fa-users"></i> Người dùng
                            </a>
                        </li>
                    </ul>
                    <!-- RIGHT -->
                    <div class="d-flex align-items-center">
                        <span class="text-white me-3">
                            <i class="fa fa-user-shield"></i> ADMIN
                        </span>
                        <a href="dangxuat" class="btn btn-danger rounded-pill px-4">
                            <i class="fa fa-right-from-bracket"></i> Đăng xuất
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container py-5">
            <!-- HEADER -->
            <div class="admin-header">
                <h1>QUẢN LÝ ĐƠN HÀNG</h1>
                <p>
                    Hệ thống quản lý đơn hàng NTN SHOP
                </p>
            </div>
            <!-- TABLE -->
            <div class="table-box">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>Mã đơn</th>
                            <th>User ID</th>
                            <th>Tổng tiền</th>
                            <th>Ngày mua</th>
                            <!--                    <th>Trạng thái</th>-->
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (list != null && !list.isEmpty()) {

                                for (Orders o : list) {
                        %>
                        <tr>
                            <td>
                                #<%=o.getId()%>
                            </td>
                            <td>
                                USER_<%=o.getUserId()%>
                            </td>
                            <td class="price-text">
                                <%=Product.formatPrice(o.getTotalMoney())%> VNĐ
                            </td>
                            <td>
                                <%=o.getOrderDate()%>
                            </td>
                            <td>
                                <a href="chitietdonhang?id=<%=o.getId()%>" class="btn btn-action btn-view">
                                    Xem chi tiết
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="6">
                                <div class="empty-box">
                                    <h5>
                                        Chưa có đơn hàng nào
                                    </h5>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="css/css/js/bootstrap.bundle.min.js"></script>
    </body>
</html>