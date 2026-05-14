
<%-- 
    Document   : quanlysanpham
    Created on : May 13, 2026
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
                background:#f5f6fa;
            }
            /* BOX */
            .box-admin{
                background:#fff;
                padding:30px;
                border-radius:20px;
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
                background:#343a40;
                color:white;
            }
            .table-custom th{
                font-weight:500;
                text-transform:uppercase;
                font-size:.85rem;
                letter-spacing:1px;
                padding:15px;
                border:none;
            }
            .table-custom td{
                vertical-align:middle;
                padding:15px;
                border-bottom:1px solid #f8f9fa;
            }
            /* PRODUCT */
            .product-img{
                width:70px;
                height:70px;
                object-fit:cover;
                border-radius:14px;
                border:2px solid #f1f1f1;
            }
            .product-name{
                font-weight:700;
                color:#222;
            }
            .product-category{
                font-size:13px;
                color:#888;
            }
            /* PRICE */
            .price{
                color:#8b4513;
                font-weight:700;
            }
            /* STOCK */
            .stock-good{
                color:#198754;
                font-weight:700;
            }
            .stock-low{
                color:#dc3545;
                font-weight:700;
            }
            /* BUTTON */
            .btn-action{
                border:none;
                padding:8px 14px;
                border-radius:30px;
                color:white;
                font-size:13px;
                transition:.3s;
            }
            .btn-edit{
                background:#111827;
            }
            .btn-edit:hover{
                background:#8b4513;
                color:white;
            }
            .btn-delete{
                background:#dc3545;
            }
            .btn-delete:hover{
                opacity:.9;
                color:white;
            }
            .btn-add{
                background:#198754;
                border:none;
                border-radius:30px;
                padding:10px 18px;
                font-weight:600;
            }
            /* BADGE */
            .type-badge{
                padding:6px 12px;
                border-radius:30px;
                font-size:12px;
                font-weight:600;
            }
            .type-hot{
                background:#ffe5e5;
                color:#dc3545;
            }
            .type-sale{
                background:#fff3cd;
                color:#856404;
            }
            .type-normal{
                background:#e9ecef;
                color:#495057;
            }
        </style>
    </head>

    <body>
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

        <!-- CONTENT -->
        <div class="container mt-5">
            <div class="box-admin">
                <h3 class="title-page">
                    QUẢN LÝ SẢN PHẨM
                </h3>
                <div class="table-responsive">
                    <table class="table table-hover table-custom">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Tồn kho</th>
                                <th>Loại</th>
                                <th class="text-center">
                                    Thao tác
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if(list != null && !list.isEmpty()){
                                    for(Product p : list){
                            %>
                            <tr>
                                <td class="fw-bold text-muted">
                                    #<%=p.getId()%>
                                </td>
                                <!-- PRODUCT -->
                                <td>
                                    <div class="d-flex align-items-center gap-3">
                                        <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="product-img">
                                        <div>
                                            <div class="product-name">
                                                <%=p.getName()%>
                                            </div>
                                            <div class="product-category">
                                                <%=p.getCategory()%>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <!-- PRICE -->
                                <td class="price">
                                    <%=p.getFormattedPrice()%> VNĐ
                                </td>
                                <!-- STOCK -->
                                <td>
                                    <% if(p.getStock() <= 5){ %>
                                        <span class="stock-low">
                                            <i class="fa fa-triangle-exclamation"></i>
                                            <%=p.getStock()%>
                                        </span>
                                    <% 
                                        } else { 
                                    %>
                                        <span class="stock-good">
                                            <i class="fa fa-check-circle"></i>
                                            <%=p.getStock()%>
                                        </span>
                                    <% 
                                        } 
                                    %>
                                </td>
                                <!-- TYPE -->
                                <td>
                                    <%
                                        String typeClass = "type-normal";
                                        if("hot".equalsIgnoreCase(p.getType())){
                                            typeClass = "type-hot";
                                        }else if("sale".equalsIgnoreCase(p.getType())){
                                            typeClass = "type-sale";
                                        }
                                    %>
                                    <span class="type-badge <%=typeClass%>">
                                        <%=p.getType()%>
                                    </span>
                                </td>
                                <!-- ACTION -->
                                <td class="text-center">
                                    <a href="suasp?id=<%=p.getId()%>" class="btn-action btn-edit">
                                        <i class="fa fa-pen"></i>
                                    </a>
                                    <a href="xoasp?id=<%=p.getId()%>" class="btn-action btn-delete" onclick="return confirm('Xóa sản phẩm?')">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="6" class="text-center py-5 text-muted">
                                    <i class="fa fa-box-open d-block mb-3" style="font-size:2rem;"></i>
                                    Chưa có sản phẩm nào.
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
        <!-- FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-4">
            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>
        </div>
    </body>
</html>