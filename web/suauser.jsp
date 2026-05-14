<%-- 
    Document   : suauser
    Created on : May 13, 2026, 3:41:03 AM
    Author     : ADMIN
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sửa người dùng</title>

        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="trangchu.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            .box-form {
                background: #fff;
                padding: 35px;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.08);
                border: 1px solid #eee;
                max-width: 600px;
                margin: 50px auto;
            }
            .title-form {
                font-weight: 700;
                color: #333;
                margin-bottom: 25px;
                position: relative;
            }
            .title-form::after {
                content: '';
                position: absolute;
                bottom: -10px;
                left: 0;
                width: 60px;
                height: 3px;
                background: #8b4513;
            }
            .form-control:focus {
                border-color: #8b4513;
                box-shadow: 0 0 0 0.2rem rgba(139, 69, 19, 0.15);
            }
            .btn-custom {
                background: #8b4513;
                color: #fff;
                border-radius: 30px;
                padding: 10px 25px;
            }
            .btn-custom:hover {
                background: #6f3a10;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <%
            User u = (User) request.getAttribute("user");
        %>
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
                            <a class="nav-link active" href="Admin">
                                <i class="fa fa-cart-shopping"></i> Đơn hàng
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
        <div class="box-form">
            <h3 class="title-form">
                <i class="fa fa-user-pen me-2"></i> SỬA NGƯỜI DÙNG
            </h3>
            <form action="capnhatuser" method="post">
                <input type="hidden" name="id" value="<%=u.getId()%>"/>
                <div class="mb-3">
                    <label class="form-label">Tên người dùng</label>
                    <input type="text" class="form-control" name="username" value="<%=u.getUserName()%>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" value="<%=u.getEmail()%>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số điện thoại</label> 
                    <input type="number" class="form-control" name="phone" value="<%=u.getPhone()%>">
                </div>
                <div class="mb-4">
                    <label class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" name="address" value="<%=u.getAddress()%>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select class="form-control" name="role">
                        <option value="USER" <%= "USER".equals(u.getRole()) ? "selected" : ""%>>USER</option>
                        <option value="ADMIN" <%= "ADMIN".equals(u.getRole()) ? "selected" : ""%>>ADMIN</option>
                    </select>
                </div>
                <div class="d-flex justify-content-between">
                    <a href="quanlyuser" class="btn btn-secondary rounded-pill px-4"> <i class="fa fa-arrow-left me-1"></i> Quay lại
                    </a>
                    <button type="submit" class="btn btn-custom">
                        <i class="fa fa-save me-1"></i> Cập nhật
                    </button>
                </div>
            </form>
        </div>

    </body>
</html>
