
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <title>Chi tiết đơn hàng</title>

        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            body{
                background:#f5f6fa;
            }
            .order-wrapper{
                max-width:760px;
                margin:auto;
            }
            .success-box{
                background:white;
                border-radius:28px;
                overflow:hidden;
                box-shadow:0 10px 40px rgba(0,0,0,.08);
            }
            /* HEADER */
            .success-header{
                background:linear-gradient(135deg,#111827,#1f2937);
                color:white;
                padding:45px 35px;
                text-align:center;
            }
            .success-icon{
                width:90px;
                height:90px;
                border-radius:50%;
                background:rgba(255,255,255,.1);
                display:flex;
                align-items:center;
                justify-content:center;
                margin:auto auto 20px;
            }
            .success-icon i{
                font-size:42px;
                color:#22c55e;
            }
            .success-title{
                font-size:34px;
                font-weight:800;
                margin-bottom:10px;
            }
            .success-subtitle{
                color:#d1d5db;
                margin-bottom:0;
            }
            /* BODY */
            .success-body{
                padding:35px;
            }
            .info-card{
                background:#f9fafb;
                border-radius:20px;
                padding:25px;
                margin-bottom:25px;
            }
            .info-row{
                display:flex;
                justify-content:space-between;
                align-items:center;
                padding:14px 0;
                border-bottom:1px solid #ececec;
            }
            .info-row:last-child{
                border-bottom:none;
            }
            .info-label{
                color:#6b7280;
                font-weight:600;
            }
            .info-value{
                font-weight:700;
                color:#111827;
            }
            .total-money{
                color:#8b4513;
                font-size:30px;
                font-weight:800;
            }
            /* STATUS */
            .status-box{
                background:#ecfdf5;
                color:#16a34a;
                border-radius:18px;
                padding:18px;
                display:flex;
                align-items:center;
                gap:12px;
                margin-bottom:25px;
            }
            .status-box i{
                font-size:22px;
            }
            .status-text{
                font-weight:700;
            }
            /* BUTTON */
            .btn-home{
                width:100%;
                background:#111827;
                color:white;
                border:none;
                border-radius:16px;
                padding:15px;
                font-weight:700;
                transition:.3s;
            }
            .btn-home:hover{
                background:#8b4513;
                color:white;
            }
            /* MOBILE */
            @media(max-width:768px){
                .success-header{
                    padding:35px 20px;
                }
                .success-title{
                    font-size:28px;
                }
                .success-body{
                    padding:24px;
                }
                .info-row{
                    flex-direction:column;
                    align-items:flex-start;
                    gap:6px;
                }
                .total-money{
                    font-size:24px;
                }
            }
        </style>
    </head>
    <body>
        
        <%
            Orders o = (Orders) request.getAttribute("order");
            if(o == null){
                response.sendRedirect("Admin");
                return;
            }
            NumberFormat formatter = NumberFormat.getInstance(new Locale("vi","VN"));

        %>
        <!-- NAVBAR ADMIN -->
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
                            <a class="nav-link" href="Admin">
                                <i class="fa fa-home"></i>
                                Trang chủ
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="quanlysanpham">
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
                    <div class="d-flex align-items-center gap-2">
                        <a href="themsp.jsp" class="btn btn-success btn-add">
                            <i class="fa fa-plus"></i>
                            Thêm sản phẩm
                        </a>
                        <a href="dangxuat" class="btn btn-danger rounded-pill px-4">
                            <i class="fa fa-right-from-bracket"></i>
                            Đăng xuất
                        </a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container py-5">
            <div class="order-wrapper">
                <div class="success-box">
                    <!-- HEADER -->
                    <div class="success-header">
                        <div class="success-icon">
                            <i class="fa fa-check"></i>
                        </div>
                        <div class="success-title">
                            NGƯỜI DÙNG ĐÃ ĐẶT ĐƠN HÀNG
                        </div>
                        <p class="success-subtitle">
                            Admin xem và cập nhật đơn hàng
                        </p>
                    </div>
                    <!-- BODY -->
                    <div class="success-body">
                        <!-- STATUS -->
                        <div class="status-box">
                            <i class="fa fa-circle-check"></i>
                            <div class="status-text">
                                Đơn hàng đang được xử lý
                            </div>
                        </div>
                        <!-- INFO -->
                        <div class="info-card">
                            <div class="info-row">
                                <div class="info-label">
                                    Mã đơn hàng
                                </div>
                                <div class="info-value">
                                    #NTN<%=o.getId()%>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">
                                    User ID
                                </div>
                                <div class="info-value">
                                    USER_<%=o.getUserId()%>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">
                                    Ngày đặt
                                </div>
                                <div class="info-value">
                                    <%=o.getOrderDate()%>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">
                                    Tổng thanh toán
                                </div>
                                <div class="total-money">
                                    <%=formatter.format(o.getTotalMoney())%> VNĐ
                                </div>
                            </div>
                        </div>
                        <!-- BUTTON -->
                        <a href="Admin" class="btn btn-home">
                            <i class="fa fa-house me-2"></i>
                            Quay về trang chủ
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-4">
            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>
        </div>
    </body>
</html>