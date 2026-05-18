<%-- 
    Document   : lichsumuahang
    Created on : May 18, 2026
--%>

<%@page import="java.util.List"%>
<%@page import="DAO.OrderDetailDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lịch sử mua hàng</title>

        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>

            body{
                background:#f5f5f5;
            }

            .order-box{
                background:white;
                border-radius:15px;
                padding:25px;
                margin-bottom:30px;
                box-shadow:0 5px 15px rgba(0,0,0,0.1);
            }

            .order-title{
                font-size:22px;
                font-weight:bold;
                margin-bottom:20px;
                color:#8b4513;
            }

            .product-item{
                display:flex;
                align-items:center;
                border-bottom:1px solid #eee;
                padding:15px 0;
            }

            .product-item:last-child{
                border:none;
            }

            .product-img{
                width:100px;
                height:100px;
                object-fit:cover;
                border-radius:10px;
                margin-right:20px;
            }

            .product-name{
                font-size:18px;
                font-weight:bold;
            }

            .product-price{
                color:red;
                font-weight:bold;
            }

            .total-box{
                text-align:right;
                margin-top:20px;
                font-size:22px;
                font-weight:bold;
                color:red;
            }

            .empty-box{
                background:white;
                padding:50px;
                border-radius:15px;
                text-align:center;
                box-shadow:0 5px 15px rgba(0,0,0,0.1);
            }

        </style>

    </head>

    <body>

        <!-- BANNER -->
        <div class="banner">
            <div class="banner-overlay">
                <h1 class="logo">NTN SHOP</h1>
                <p>Phong cách - Trẻ trung - Hiện đại</p>
            </div>
        </div>

        <!-- MENU -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">

                <a class="navbar-brand" href="trangchu">
                    Trang chủ
                </a>

            </div>
        </nav>

        <!-- MAIN -->
        <div class="container mt-5">

            <h2 class="mb-4 fw-bold">
                <i class="fa fa-clock-rotate-left"></i>
                Lịch sử mua hàng
            </h2>

            <%

                List<Orders> listOrder =
                        (List<Orders>) request.getAttribute("listOrder");

                if(listOrder != null && !listOrder.isEmpty()){

                    OrderDetailDAO detailDAO =
                            new OrderDetailDAO();

                    for(Orders o : listOrder){

            %>

            <!-- 1 ĐƠN HÀNG -->
            <div class="order-box">

                <div class="order-title">

                    Đơn hàng #<%= o.getId() %>

                    <div style="font-size:15px;color:gray;margin-top:5px;">
                        Ngày đặt:
                        <%= o.getOrderDate() %>
                    </div>

                </div>

                <%

                    List<OrderDetail> details =
                            detailDAO.getByOrderId(o.getId());

                    for(OrderDetail od : details){

                %>

                <!-- 1 SẢN PHẨM -->
                <div class="product-item">

                    <img src="<%=request.getContextPath()%>/<%= od.getImage() %>"
                         class="product-img">

                    <div style="flex:1;">

                        <div class="product-name">
                            <%= od.getProductName() %>
                        </div>

                        <div>
                            Số lượng:
                            <b><%= od.getQuantity() %></b>
                        </div>

                    </div>

                    <div class="product-price">

                        <%= String.format("%,.0f", od.getPrice()) %> VNĐ

                    </div>

                </div>

                <%
                    }
                %>

                <!-- TỔNG -->
                <div class="total-box">

                    Tổng tiền:
                    <%= String.format("%,.0f", o.getTotalMoney()) %> VNĐ

                </div>

            </div>

            <%
                    }

                }else{
            %>

            <!-- KHÔNG CÓ ĐƠN -->
            <div class="empty-box">

                <h3>Bạn chưa có đơn hàng nào</h3>

                <a href="trangchu"
                   class="btn btn-dark mt-3">

                    Tiếp tục mua sắm

                </a>

            </div>

            <%
                }
            %>

        </div>

        <!-- FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-5">

            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>

        </div>

        <script src="css/css/js/bootstrap.bundle.min.js"></script>

    </body>
</html>