<%-- 
    Document   : quanlyuser
    Created on : May 13, 2026, 3:08:14 AM
    Author     : ADMIN
--%>

<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Quản lý Người dùng</title>
        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="trangchu.css"/> <!-- Sử dụng file css chủ đạo -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            .box-admin {
                background: #fff;
                padding: 30px;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.08);
                border: 1px solid #eee;
                margin-bottom: 50px;
            }
            .table-custom thead {
                background-color: #343a40;
                color: #fff;
            }
            .table-custom th {
                font-weight: 500;
                text-transform: uppercase;
                font-size: 0.85rem;
                letter-spacing: 1px;
                padding: 15px;
                border: none;
            }
            .table-custom td {
                vertical-align: middle;
                padding: 15px;
                border-bottom: 1px solid #f8f9fa;
            }
            .avatar-circle {
                width: 45px;
                height: 45px;
                border-radius: 50%;
                background: #8b4513; /* Màu nâu đặc trưng của shop */
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                font-size: 1.2rem;
                text-transform: uppercase;
                box-shadow: 0 4px 10px rgba(139, 69, 19, 0.2);
            }
            .title-page {
                font-weight: 700;
                color: #333;
                position: relative;
                display: inline-block;
                margin-bottom: 30px;
            }
            .title-page::after {
                content: '';
                position: absolute;
                bottom: -10px;
                left: 0;
                width: 50px;
                height: 3px;
                background: #8b4513;
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
        <div class="container mt-5">
            <div class="box-admin animate__animated animate__fadeIn">
                <h3 class="title-page">QUẢN LÝ NGƯỜI DÙNG</h3>

                <div class="table-responsive">
                    <table class="table table-hover table-custom">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Thông tin người dùng</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th class="text-center">Thao tác</th>
                            </tr>
                        </thead>

                        <tbody>
                        <%
                            List<User> list = (List<User>) request.getAttribute("list");
                            if(list != null && !list.isEmpty()){
                                for(User u : list){
                        %>
                            <tr>
                                <td class="fw-bold text-muted">#<%=u.getId()%></td>

                                <td>
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="avatar-circle">
                                            <%= (u.getUserName() != null && !u.getUserName().isEmpty()) ? u.getUserName().charAt(0) : "?" %>
                                        </div>
                                        <div>
                                            <div class="fw-bold text-dark"><%=u.getUserName()%></div>
                                            <small class="text-muted">Khách hàng hệ thống</small>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <i class="fa-regular fa-envelope me-2 text-muted"></i><%=u.getEmail()%>
                                </td>
                                
                                <td>
                                    <i class="fa-solid fa-phone-flip me-2 text-muted" style="font-size: 0.8rem;"></i><%=u.getPhone()%>
                                </td>

                                <td class="text-center">
                                    <a class="btn btn-outline-dark btn-sm rounded-pill px-3" href="suauser?id=<%=u.getId()%>">
                                         <i class="fa-solid fa-pen-to-square me-1"></i> Sửa
                                     </a>
                                </td>
                            </tr>
                        <%
                                }
                            } else {
                        %>
                            <tr>
                                <td colspan="5" class="text-center py-5 text-muted">
                                    <i class="fa-solid fa-user-slash d-block mb-2" style="font-size: 2rem;"></i>
                                    Chưa có người dùng nào trong danh sách.
                                </td>
                            </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>