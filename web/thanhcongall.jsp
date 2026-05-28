<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán thành công</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            body{
                background:#f3f4f6;
            }
            .success-wrapper{
                max-width:750px;
                margin:auto;
                background:white;
                border-radius:28px;
                overflow:hidden;
                box-shadow:0 10px 35px rgba(0,0,0,.08);
            }
            .success-header{
                background:linear-gradient(
                    135deg,
                    #111827,
                    #1f2937
                );
                color:white;
                text-align:center;
                padding:40px 30px;
            }
            .success-icon{
                width:100px;
                height:100px;
                margin:auto;
                border-radius:50%;
                background:#22c55e;
                display:flex;
                align-items:center;
                justify-content:center;
                font-size:46px;
                margin-bottom:20px;
                color:white;
            }
            .success-title{
                font-size:36px;
                font-weight:800;
                margin-bottom:10px;
            }
            .order-code{
                color:#d1d5db;
                font-size:16px;
            }
            .success-body{
                padding:35px;
            }
            .info-box{
                background:#f9fafb;
                border-radius:18px;
                padding:22px;
                margin-bottom:24px;
            }
            .info-row{
                display:flex;
                justify-content:space-between;
                margin-bottom:14px;
                font-size:17px;
            }
            .info-row:last-child{
                margin-bottom:0;
            }
            .info-label{
                color:#6b7280;
            }
            .info-value{
                font-weight:700;
                color:#111827;
            }
            .thank-box{
                background:#111827;
                color:white;
                border-radius:20px;
                padding:28px;
                text-align:center;
                margin-top:25px;
            }
            .thank-box h4{
                font-weight:800;
                margin-bottom:12px;
            }
            .btn-home{
                width:100%;
                border:none;
                background:#8b4513;
                color:white;
                padding:16px;
                border-radius:18px;
                font-size:18px;
                font-weight:700;
                margin-top:28px;
                transition:.3s;
                text-decoration:none;
                display:block;
                text-align:center;
            }
            .btn-home:hover{
                background:#6d3410;
                color:white;
                transform:translateY(-2px);
            }
            @media(max-width:768px){
                .success-body{
                    padding:24px;
                }
                .success-title{
                    font-size:28px;
                }
                .info-row{
                    flex-direction:column;
                    gap:5px;
                }
            }
        </style>
    </head>

    <body>
        <div class="container py-5">
            <div class="success-wrapper">
                <!-- HEADER -->
                <div class="success-header">
                    <div class="success-icon">
                        <i class="fa fa-check"></i>
                    </div>
                    <div class="success-title">
                        ĐẶT HÀNG THÀNH CÔNG
                    </div>
                    <div class="order-code">
                        Mã đơn hàng:
                        #NTN<%= System.currentTimeMillis()%>
                    </div>
                </div>
                <!-- BODY -->
                <div class="success-body">
                    <div class="text-center mb-4">
                        <h3 class="fw-bold">
                            Cảm ơn bạn đã mua sắm tại NTN SHOP ❤️
                        </h3>
                        <p class="text-muted mt-2">
                            Đơn hàng của bạn đã được ghi nhận thành công.
                        </p>
                    </div>
                    <!-- INFO -->
                    <div class="info-box">
                        <div class="info-row">
                            <div class="info-label">
                                Hình thức thanh toán
                            </div>
                            <div class="info-value">
                                Thanh toán tất cả sản phẩm
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">
                                Phương thức
                            </div>
                            <div class="info-value">
                                QR / COD
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">
                                Trạng thái
                            </div>
                            <div class="info-value text-success">
                                Thành công
                            </div>
                        </div>
                    </div>
                    <!-- THANK -->
                    <div class="thank-box">
                        <h4>
                            NTN SHOP sẽ xử lý đơn hàng ngay 🚚
                        </h4>
                        <p class="mb-0 text-light">
                            Nhân viên sẽ liên hệ xác nhận và giao hàng
                            trong thời gian sớm nhất.
                        </p>
                    </div>
                    <!-- BUTTON -->
                    <a href="trangchu"
                       class="btn-home">
                        <i class="fa fa-house"></i>
                        Quay lại mua sắm
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
