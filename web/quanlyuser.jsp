
<%-- 
    Document   : quanlyuser
    Created on : May 13, 2026
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
        <link rel="stylesheet" href="trangchu.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            body{
                background:#f5f6fa;
            }
            /* BOX */
            .box-admin{
                background:#fff;
                padding:30px;
                border-radius:22px;
                box-shadow:0 10px 30px rgba(0,0,0,0.08);
                border:1px solid #eee;
                margin-bottom:50px;
            }
            /* TITLE */
            .title-page{
                font-weight:700;
                color:#333;
                position:relative;
                display:inline-block;
                margin-bottom:30px;
            }
            .title-page::after{
                content:'';
                position:absolute;
                bottom:-10px;
                left:0;
                width:50px;
                height:3px;
                background:#8b4513;
            }
            /* TABLE */
            .table-custom thead{
                background:#111827;
                color:#fff;
            }
            .table-custom th{
                font-weight:600;
                text-transform:uppercase;
                font-size:.82rem;
                letter-spacing:1px;
                padding:16px;
                border:none;
            }
            .table-custom td{
                vertical-align:middle;
                padding:16px;
                border-bottom:1px solid #f5f5f5;
            }
            .table-custom tbody tr{
                transition:.25s;
            }
            .table-custom tbody tr:hover{
                background:#fafafa;
            }
            /* AVATAR */
            .avatar-circle{
                width:52px;
                height:52px;
                border-radius:50%;
                background:#8b4513;
                color:white;
                display:flex;
                align-items:center;
                justify-content:center;
                font-weight:700;
                font-size:1.25rem;
                text-transform:uppercase;
                box-shadow:0 4px 10px rgba(139,69,19,.2);
            }
            /* USER INFO */
            .user-name{
                font-weight:700;
                color:#222;
            }
            .user-role{
                font-size:13px;
                color:#888;
            }
            /* ICON */
            .info-icon{
                color:#9ca3af;
                width:18px;
            }
            /* BUTTON */
            .btn-edit{
                border-radius:30px;
                padding:8px 18px;
                font-size:14px;
                font-weight:600;
                transition:.3s;
            }
            .btn-edit:hover{
                background:#111827;
                border-color:#111827;
                color:white;
            }
            /* EMPTY */
            .empty-box{
                padding:60px 20px;
            }
            .empty-box i{
                font-size:2.5rem;
                margin-bottom:18px;
                color:#9ca3af;
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
                            <a class="nav-link" href="Admin">
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
                            <a class="nav-link active" href="quanlyuser">
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
        <div class="container mt-5">
            <div class="box-admin">
                <h3 class="title-page">
                    QUẢN LÝ NGƯỜI DÙNG
                </h3>
                <div class="table-responsive">
                    <table class="table table-hover table-custom">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Thông tin người dùng</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th class="text-center">
                                    Thao tác
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<User> list = (List<User>) request.getAttribute("list");
                                if(list != null && !list.isEmpty()){
                                    for(User u : list){
                            %>
                            <tr>
                                <td class="fw-bold text-muted">
                                    #<%=u.getId()%>
                                </td>

                                <!-- USER -->
                                <td>
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="avatar-circle">
                                            <%= (u.getUserName() != null
                                                    && !u.getUserName().isEmpty())
                                                    ? u.getUserName().charAt(0)
                                                    : "?" %>
                                        </div>
                                        <div>
                                            <div class="user-name">
                                                <%=u.getUserName()%>
                                            </div>
                                            <div class="user-role">
                                                Khách hàng hệ thống
                                            </div>
                                        </div>
                                    </div>
                                </td>

                                <!-- EMAIL -->
                                <td>
                                    <i class="fa-regular fa-envelope info-icon me-2"></i>
                                    <%=u.getEmail()%>
                                </td>

                                <!-- PHONE -->
                                <td>
                                    <i class="fa-solid fa-phone info-icon me-2"></i>
                                    <%=u.getPhone()%>
                                </td>
                                <!-- ACTION -->
                                <td class="text-center">
                                    <a class="btn btn-outline-dark btn-edit" href="suauser?id=<%=u.getId()%>">
                                        <i class="fa-solid fa-pen-to-square me-1"></i>
                                        Sửa
                                    </a>
                                </td>
                            </tr>
                            <%
                                    }

                                } else {
                            %>
                            <tr>
                                <td colspan="5">
                                    <div class="empty-box text-center text-muted">
                                        <i class="fa-solid fa-user-slash d-block"></i>
                                        Chưa có người dùng nào trong danh sách.
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
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