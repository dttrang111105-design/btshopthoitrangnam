
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Orders> list = (List<Orders>) request.getAttribute("list");
    String keyword = (String) request.getAttribute("keyword");
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
                background:#f5f6fa;
            }
            /* HEADER */
            .admin-header{
                background:linear-gradient(
                    135deg,
                    #111827,
                    #1f2937
                );
                padding:40px;
                border-radius:24px;
                color:white;
                margin-bottom:30px;
                box-shadow:0 10px 30px rgba(0,0,0,.12);
            }
            .admin-header h1{
                font-weight:800;
                letter-spacing:1px;
                margin:0;
            }
            .admin-header p{
                margin-top:10px;
                color:#d1d5db;
                font-size:17px;
            }
            /* SEARCH */
            .form-control-lg{
                border:none;
                border-radius:16px;
                padding:14px 18px;
            }
            .form-control-lg:focus{
                box-shadow:none;
                border:2px solid #8b4513;
            }
            .btn-search{
                border-radius:16px;
                font-weight:700;
            }
            /* TABLE */
            .table-box{
                background:white;
                border-radius:24px;
                overflow:hidden;
                box-shadow:0 10px 30px rgba(0,0,0,.08);
            }
            .table thead{
                background:#111827;
                color:white;
            }
            .table thead th{
                padding:18px;
                border:none;
                font-size:14px;
                letter-spacing:1px;
                text-transform:uppercase;
            }
            .table tbody td{
                padding:18px;
                vertical-align:middle;
            }
            .table tbody tr{
                transition:.25s;
            }
            .table tbody tr:hover{
                background:#fafafa;
            }
            /* PRICE */
            .price-text{
                color:#8b4513;
                font-weight:700;
                font-size:16px;
            }
            /* STATUS */
            .status{
                padding:7px 14px;
                border-radius:30px;
                font-size:12px;
                font-weight:700;
                background:#ecfdf5;
                color:#16a34a;
            }
            /* BUTTON */
            .btn-action{
                border:none;
                padding:10px 18px;
                border-radius:14px;
                color:white;
                font-size:14px;
                font-weight:600;
                transition:.3s;
            }
            .btn-view{
                background:#111827;
            }
            .btn-view:hover{
                background:#8b4513;
                color:white;
                transform:translateY(-2px);
            }
            /* EMPTY */
            .empty-box{
                padding:60px 20px;
                text-align:center;
                color:#777;
            }
            .empty-box i{
                font-size:3rem;
                margin-bottom:20px;
                color:#9ca3af;
            }
            /* ID */
            .order-id{
                font-weight:700;
                color:#111827;
            }
            /* MOBILE */
            @media(max-width:768px){
                .admin-header{
                    padding:28px;
                }
                .admin-header h1{
                    font-size:28px;
                }
            }
        </style>
    </head>

    <body>
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="Admin">
                    NTN ADMIN
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="adminNav">
                    <!-- LEFT -->
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="Admin">
                                <i class="fa fa-home"></i>
                                Trang chủ
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="quanlysanpham">
                                <i class="fa fa-box"></i>
                                Sản phẩm
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="quanlyuser">
                                <i class="fa fa-users"></i>
                                Người dùng
                            </a>
                        </li>
                    </ul>
                    <!-- RIGHT -->
                    <div class="d-flex align-items-center">
                        <span class="text-white me-3">
                            <i class="fa fa-user-shield"></i>
                            ADMIN
                        </span>
                        <a href="dangxuat" class="btn btn-danger rounded-pill px-4">
                            <i class="fa fa-right-from-bracket"></i>
                            Đăng xuất
                        </a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- CONTENT -->
        <div class="container py-5">
            <!-- HEADER -->
            <div class="admin-header">
                <h1>
                    QUẢN LÝ ĐƠN HÀNG
                </h1>
                <p>
                    Hệ thống quản lý đơn hàng NTN SHOP
                </p>
                <!-- SEARCH -->
                <form action="Admin" method="get" class="mt-4">
                    <div class="row g-3">
                        <div class="col-md-10">
                            <input type="text" name="keyword" class="form-control form-control-lg" 
                                   placeholder="Tìm theo mã đơn hoặc user id..."
                                   value="<%=keyword != null ? keyword : ""%>">
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-light btn-search w-100 h-100">
                                <i class="fa fa-search"></i>
                                Tìm kiếm
                            </button>
                        </div>
                    </div>
                </form>
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
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if(list != null && !list.isEmpty()){
                                for(Orders o : list){
                        %>
                        <tr>
                            <!-- ORDER ID -->
                            <td class="order-id">
                                #NTN<%=o.getId()%>
                            </td>
                            <!-- USER -->
                            <td>
                                USER_<%=o.getUserId()%>
                            </td>
                            <!-- PRICE -->
                            <td class="price-text">
                                <%=Product.formatPrice( o.getTotalMoney())%> VNĐ
                            </td>
                            <!-- DATE -->
                            <td>
                                <%=o.getOrderDate()%>
                            </td>
                            <!-- STATUS -->
                            <td>
                                <span class="status">
                                    <i class="fa fa-circle-check me-1"></i>
                                    Đã đặt
                                </span>
                            </td>
                            <!-- ACTION -->
                            <td>
                                <a href="chitietdonhang?id=<%=o.getId()%>" class="btn btn-action btn-view">
                                    <i class="fa fa-eye me-1"></i>
                                    Xem chi tiết
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            }else{
                        %>
                        <tr>
                            <td colspan="6">
                                <div class="empty-box">
                                    <i class="fa fa-box-open d-block"></i>
                                    <h5>
                                        Không tìm thấy đơn hàng
                                    </h5>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-4">
            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>
        </div>
        <script src="css/js/bootstrap.bundle.min.js"></script>
    </body>

</html>