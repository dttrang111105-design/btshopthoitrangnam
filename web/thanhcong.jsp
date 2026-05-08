<%-- 
    Document   : thanhcong.jsp
    Created on : May 8, 2026, 11:37:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua hàng thành công</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">

        <style>
            .success-box{
                background:white;
                padding:50px;
                border-radius:15px;
                box-shadow:0 5px 20px rgba(0,0,0,0.1);
                text-align:center;
            }
            .success-icon{
                font-size:80px;
            }
        </style>
    </head>
    <body style="background:#f5f5f5;">
        <div class="container mt-5">
            <div class="success-box">
                <div class="success-icon"> 🎉 </div>
                <h1 class="mt-3">Thanh toán thành công</h1>
                <p class="mt-3">Cảm ơn bạn đã mua hàng tại NTN SHOP</p>
                <a href="trangchu" class="btn btn-danger">
                    Về trang chủ
                </a>
            </div>
        </div>
    </body>
</html>
