
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User u = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa người dùng</title>

    <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="trangchu.css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

    <style>

        body{
            background:#f5f6fa;
        }
        .box-form{
            background:#fff;
            padding:35px;
            border-radius:22px;
            box-shadow:0 10px 30px rgba(0,0,0,.08);
            border:1px solid #eee;
            max-width:650px;
            margin:50px auto;
        }
        .title-form{
            font-weight:700;
            color:#333;
            margin-bottom:30px;
            position:relative;
            display:inline-block;
        }
        .title-form::after{
            content:'';
            position:absolute;
            left:0;
            bottom:-10px;
            width:60px;
            height:3px;
            background:#8b4513;
        }
        .form-label{
            font-weight:600;
            color:#444;
        }
        .form-control{
            border-radius:14px;
            padding:12px 14px;
            border:1px solid #ddd;
            transition:.3s;
        }
        .form-control:focus{
            border-color:#8b4513;
            box-shadow:0 0 0 .15rem rgba(139,69,19,.15);
        }
        .btn-custom{
            background:#111827;
            color:white;
            border:none;
            border-radius:14px;
            padding:10px 24px;
            font-weight:600;
            transition:.3s;
        }
        .btn-custom:hover{
            background:#8b4513;
            color:white;
        }
        .btn-back{
            border-radius:14px;
            padding:10px 24px;
            font-weight:600;
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
                        <!-- THỐNG KÊ -->
                        <li class="nav-item">
                            <a class="nav-link" href="ThongKe">
                                <i class="fa fa-chart-line"></i>
                                Thống kê
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
    <div class="container">
        <div class="box-form">
            <h3 class="title-form">
                <i class="fa fa-user-pen me-2"></i>
                SỬA NGƯỜI DÙNG
            </h3>
            <form action="capnhatuser" method="post">
                <input type="hidden" name="id" value="<%=u.getId()%>"/>
                <div class="mb-3">
                    <label class="form-label">
                        Tên người dùng
                    </label>
                    <input type="text" class="form-control" name="username" value="<%=u.getUserName()%>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">
                        Email
                    </label>
                    <input type="email" class="form-control" name="email" value="<%=u.getEmail()%>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">
                        Số điện thoại
                    </label>
                    <input type="number" class="form-control" name="phone" value="<%=u.getPhone()%>">
                </div>
                <div class="mb-3">
                    <label class="form-label">
                        Địa chỉ
                    </label>
                    <input type="text" class="form-control" name="address" value="<%=u.getAddress()%>">

                </div>
                <div class="mb-4">
                    <label class="form-label">
                        Role
                    </label>
                    <select class="form-control" name="role">
                        <option value="USER"
                            <%= "USER".equals(u.getRole()) ? "selected" : ""%>>
                            USER
                        </option>
                        <option value="ADMIN"
                            <%= "ADMIN".equals(u.getRole()) ? "selected" : ""%>>
                            ADMIN
                        </option>
                    </select>
                </div>
                <div class="d-flex justify-content-between">
                    <a href="quanlyuser" class="btn btn-outline-dark btn-back">
                        <i class="fa fa-arrow-left me-1"></i>
                        Quay lại
                    </a>
                    <button type="submit" class="btn-custom">
                        <i class="fa fa-save me-1"></i>
                        Cập nhật
                    </button>
                </div>
            </form>
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