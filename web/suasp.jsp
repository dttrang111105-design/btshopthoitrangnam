
<%-- 
    Document   : suasp
    Created on : May 13, 2026
    Author     : ADMIN
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Product p = (Product) request.getAttribute("p");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sửa sản phẩm</title>

        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="trangchu.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            body{
                background:#f5f6fa;
            }
            /* BOX */
            .box-admin{
                background:white;
                padding:35px;
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
                margin-bottom:35px;
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
            /* IMAGE PREVIEW */
            .preview-box{
                width:100%;
                height:320px;
                border-radius:18px;
                overflow:hidden;
                background:#f8f9fa;
                border:2px dashed #ddd;
                display:flex;
                align-items:center;
                justify-content:center;
                margin-bottom:25px;
            }
            .preview-box img{
                width:100%;
                height:100%;
                object-fit:cover;
            }
            /* INPUT */
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
                box-shadow:0 0 0 0.15rem rgba(139,69,19,0.15);
            }
            textarea.form-control{
                min-height:120px;
                resize:none;
            }
            /* BUTTON */
            .btn-save{
                background:#111827;
                color:white;
                border:none;
                border-radius:14px;
                padding:12px 28px;
                font-weight:600;
                transition:.3s;
            }
            .btn-save:hover{
                background:#8b4513;
                color:white;
            }
            .btn-back{
                border-radius:14px;
                padding:12px 24px;
                font-weight:600;
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
                    <div class="d-flex align-items-center">
                        <span class="text-white me-3">
                            <i class="fa fa-user-shield"></i>
                            ADMIN
                        </span>
                        <a href="dangxuat"
                           class="btn btn-danger rounded-pill px-4">
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
                    SỬA SẢN PHẨM
                </h3>
                <form action="suasp" method="post">
                    <input type="hidden" name="id" value="<%=p.getId()%>">
                    <div class="row">
                        <!-- LEFT -->
                        <div class="col-lg-4">
                            <div class="preview-box">
                                <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" id="previewImg">
                            </div>
                        </div>
                        <!-- RIGHT -->
                        <div class="col-lg-8">
                            <div class="mb-3">
                                <label class="form-label">
                                    Tên sản phẩm
                                </label>
                                <input type="text" name="name" value="<%=p.getName()%>" class="form-control">
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Giá
                                    </label>
                                    <input type="number" name="price" value="<%=p.getFormattedPrice()%>" class="form-control"> 
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Tồn kho
                                    </label>
                                    <input type="number" name="stock" value="<%=p.getStock()%>" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">
                                    Link ảnh
                                </label>
                                <input type="text" name="image" value="<%=p.getImage()%>"
                                       class="form-control" id="imgInput">
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Category
                                    </label>
                                    <input type="text" name="category" value="<%=p.getCategory()%>" class="form-control">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Type
                                    </label>
                                    <input type="text" name="type" value="<%=p.getType()%>" class="form-control">
                                </div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">
                                    Mô tả
                                </label>
                                <textarea name="desc" class="form-control"><%=p.getDesc()%></textarea>
                            </div>
                            <div class="d-flex gap-3">
                                <a href="quanlysanpham" class="btn btn-outline-dark btn-back">
                                    <i class="fa fa-arrow-left"></i>
                                    Quay lại
                                </a>
                                <button class="btn-save">
                                    <i class="fa fa-floppy-disk"></i>
                                    Cập nhật sản phẩm
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            const imgInput = document.getElementById("imgInput");
            const previewImg = document.getElementById("previewImg");
            imgInput.addEventListener("input", () => {
                previewImg.src = imgInput.value;
            });
        </script>
    </body>
</html>
