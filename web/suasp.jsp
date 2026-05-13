<%-- 
    Document   : suasp
    Created on : May 13, 2026, 2:06:43 AM
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
    </head>

    <body>
        <div class="container mt-5">
            <h3>SỬA SẢN PHẨM</h3>
            <form action="suasp" method="post">
                <input type="hidden" name="id" value="<%=p.getId()%>">
                <div class="mb-3">
                    <label>Tên</label>
                    <input type="text" name="name" value="<%=p.getName()%>" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Giá</label>
                    <input type="number" name="price" value="<%=p.getPrice()%>" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Ảnh</label>
                    <input type="text" name="image" value="<%=p.getImage()%>" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Mô tả</label>
                    <input type="text" name="desc" value="<%=p.getDesc()%>" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Category</label>
                    <input type="text" name="category" value="<%=p.getCategory()%>" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Type</label>
                    <input type="text" name="type" value="<%=p.getType()%>" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Stock</label>
                    <input type="number" name="stock" value="<%=p.getStock()%>" class="form-control">
                </div>
                <button class="btn btn-primary">Cập nhật</button>
            </form>

        </div>
    </body>
</html>