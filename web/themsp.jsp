<%-- 
    Document   : themsp
    Created on : May 13, 2026, 2:03:41 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thêm sản phẩm</title>
        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container mt-5">
            <!-- NAVBAR -->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="Admin">
                        ADMIN PANEL
                    </a>
                    <div class="d-flex">
                        <a href="dangxuat" class="btn btn-danger">
                            Đăng xuất
                        </a>
                    </div>
                </div>
            </nav>
            <h3>THÊM SẢN PHẨM</h3>
            <form action="themsp" method="post">
                <div class="mb-3">
                    <label>Tên sản phẩm</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Giá</label>
                    <input type="number" name="price" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Ảnh</label>
                    <input type="text" name="image" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Mô tả</label>
                    <input type="text" name="desc" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Danh mục</label>
                    <input type="text" name="category" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Type</label>
                    <input type="text" name="type" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Stock</label>
                    <input type="number" name="stock" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-success">
                    Thêm
                </button>
            </form>
        </div>

    </body>
</html>
