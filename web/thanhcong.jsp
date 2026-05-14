<%-- 
    Document   : thanhcong.jsp
    Created on : May 8, 2026, 11:37:39 PM
    Author     : ADMIN
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán thành công</title>
        
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet"> 
        <style>
            .order-confirm-box{
                max-width: 520px;
                border-radius: 15px;
                overflow: hidden;
            }
            .success-header{
                background: #1a1a1a;
                color: white;
                padding: 25px;
            }
            .success-header h1{
                color: #c49b63;
                font-size: 50px;
                margin-bottom: 10px;
            }
            .total-price{
                color: #8b4513;
                font-size: 28px;
                font-weight: bold;
            }
            .dashed-line{
                border-top: 2px dashed #ddd;
                margin: 15px 0;
            }
            .btn-back{
                width: 220px;
                margin: 10px auto 0;
                display: block;
                padding: 8px 15px;
            }
        </style>
    </head>
    <body class="bg-light">
        <%
            Product p = (Product) request.getAttribute("p");
            String name = (String) request.getAttribute("name");
            String phone = (String) request.getAttribute("phone");
            String address = (String) request.getAttribute("address");
            Integer quantity = (Integer) request.getAttribute("quantity");
            Double total = (Double) request.getAttribute("total");

            if (p != null) {
        %>
        <div class="container py-5">
            <div class="order-confirm-box product-card mx-auto">
                <div class="success-header text-center p-4">
                    <h1>✔</h1>
                    <h2 class="fw-bold">ĐẶT HÀNG THÀNH CÔNG</h2>
                    <p>Mã đơn: #NTN<%= System.currentTimeMillis() %></p>
                </div>
                <div class="p-4">
                    <h4 class="text-center mb-4">
                        Cảm ơn <%= name %> đã ủng hộ NTN SHOP!
                    </h4>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Số điện thoại:</span>
                        <span class="fw-bold"><%= phone %></span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Địa chỉ nhận:</span>
                        <span class="fw-bold text-end"><%= address %></span>
                    </div>
                    <div class="dashed-line"></div>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Sản phẩm:</span>
                        <span class="fw-bold"><%= p.getName() %></span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Số lượng:</span>
                        <span class="fw-bold">x<%= quantity %></span>
                    </div>
                    <div class="bg-light rounded text-center p-4 mt-4">
                        <p class="mb-2">Tổng tiền thanh toán (COD)</p>
                        <div class="total-price">
                            <%= Product.formatPrice(total) %> VNĐ
                        </div>
                    </div>
                    <a href="trangchu" class="btn btn-detail btn-back">
                        Quay lại mua sắm
                    </a>
                </div>
            </div>
        </div>
        <% 
            } else { 
                response.sendRedirect("trangchu"); // Nếu vào trực tiếp mà không có data thì về trang chủ
            } 
        %>
    </body>
</html>
