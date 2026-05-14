<%-- 
    Document   : chitietdonhang
    Created on : May 13, 2026, 2:55:25 AM
    Author     : ADMIN
--%>
<%@page import="model.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thanh toán thành công</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            body{
                background:#f5f5f5;
            }
            .success-box{
                max-width:600px;
                margin:auto;
                background:white;
                border-radius:15px;
                overflow:hidden;
                box-shadow:0 5px 20px rgba(0,0,0,0.15);
            }
            .success-header{
                background:linear-gradient(135deg,#111,#2c2c2c);
                color:white;
                text-align:center;
                padding:30px;
            }
            .success-header i{
                font-size:60px;
                color:#c49b63;
                margin-bottom:10px;
            }
            .success-body{
                padding:25px;
            }
            .total-price{
                color:#8b4513;
                font-size:26px;
                font-weight:bold;
            }
            .info-row{
                display:flex;
                justify-content:space-between;
                margin-bottom:10px;
            }
            .btn-back{
                background:black;
                color:white;
                border-radius:25px;
                padding:10px 20px;
                display:block;
                text-align:center;
                margin-top:20px;
            }
            .btn-back:hover{
                background:#8b4513;
                color:white;
            }
        </style>
    </head>
    <body>
        <%
            Orders o = (Orders) request.getAttribute("order");

            if (o == null) {
                response.sendRedirect("Admin");
                return;
            }
        %>
        <div class="container py-5">
            <div class="success-box">
                <!-- HEADER -->
                <div class="success-header">
                    <i class="fa fa-circle-check"></i>
                    <h2>ĐƠN HÀNG ĐÃ ĐƯỢC ĐẶT</h2>
                    <p>Mã đơn: #NTN<%= System.currentTimeMillis()%></p>
                </div>
                <!-- BODY -->
                <div class="success-body">
                    <div class="info-row">
                        <span>Mã đơn:</span>
                        <b>#<%= o.getId()%></b>
                    </div>

                    <div class="info-row">
                        <span>User:</span>
                        <b>USER_<%= o.getUserId()%></b>
                    </div>

                    <div class="info-row">
                        <span>Tổng tiền:</span>
                        <b><%= o.getTotalMoney()%></b>
                    </div>

                    <div class="info-row">
                        <span>Ngày mua:</span>
                        <b><%= o.getOrderDate()%></b>
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>