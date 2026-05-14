<%-- 
    Document   : quanlysanpham
    Created on : May 13, 2026, 1:49:55 AM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Product> list = (List<Product>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>QUẢN LÝ SẢN PHẨM</title>
        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="trangchu.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
        <style>
            body{
                background:#f5f5f5;
            }
            .box{
                background:white;
                padding:25px;
                border-radius:15px;
                box-shadow:0 5px 20px rgba(0,0,0,0.1);
            }
            .price{
                color:#8b4513;
                font-weight:bold;
            }
            .stock{
                font-weight:bold;
            }
            .btn-action{
                border:none;
                padding:6px 12px;
                border-radius:20px;
                color:white;
                font-size:13px;
            }
            .btn-edit{
                background:#0d6efd;
            }
            .btn-delete{
                background:#dc3545;
            }
            .btn-add{
                background:#198754;
            }
        </style>
    </head>
    <body>
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="Admin">
                    ADMIN PANEL
                </a>
                <div class="d-flex">
                    <a href="themsp.jsp" class="btn btn-success me-2">
                        <i class="fa fa-plus"></i>
                        Thêm sản phẩm
                    </a>
                    <a href="dangxuat" class="btn btn-danger">
                        Đăng xuất
                    </a>
                </div>
            </div>
        </nav>
        <!-- CONTENT -->
        <div class="container mt-4">
            <div class="box">
                <h3 class="mb-4">QUẢN LÝ SẢN PHẨM</h3>
                <table class="table table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Giá</th>
                            <th>Stock</th>
                            <th>Category</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (list != null) {
                                for (Product p : list) {
                        %>
                        <tr>
                            <td><%=p.getId()%></td>
                            <td><%=p.getName()%></td>
                            <td class="price"> <%=p.getFormattedPrice()%> VNĐ</td>
                            <td>
                                <%
                                    if (p.getStock() <= 5) {
                                %>
                                <span style="color:red;font-weight:bold;">
                                    <%=p.getStock()%> (Hết/ít)
                                </span>
                                <%
                                } else {
                                %>
                                <%=p.getStock()%>
                                <%
                                    }
                                %>
                            </td>
                            <td><%=p.getCategory()%></td>
                            <td>
                                <!-- SỬA -->
                                <a href="suasp?id=<%=p.getId()%>" class="btn-action btn-edit">
                                    <i class="fa fa-pen"></i>
                                </a>

                                <!-- XÓA -->
                                <a href="xoasp?id=<%=p.getId()%>" class="btn-action btn-delete" onclick="return confirm('Xóa sản phẩm?')">
                                    <i class="fa fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
