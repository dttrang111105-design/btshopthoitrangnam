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
        <div class="container py-5">
            <div class="order-confirm-box product-card mx-auto">
                <!-- HEADER -->
                <div class="success-header text-center p-4">
                    <h1>✔</h1>
                    <h2 class="fw-bold">
                        ĐẶT HÀNG THÀNH CÔNG
                    </h2>
                    <p>
                        Mã đơn: #NTN<%= System.currentTimeMillis()%>
                    </p>
                </div>
                <!-- BODY -->
                <div class="p-4">
                    <h4 class="text-center mb-4">
                        Cảm ơn bạn đã ủng hộ NTN SHOP!
                    </h4>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Hình thức:</span>
                        <span class="fw-bold">
                            Thanh toán tất cả sản phẩm
                        </span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Phương thức:</span>
                        <span class="fw-bold">
                            Thanh toán khi nhận hàng (COD)
                        </span>
                    </div>

                    <div class="dashed-line"></div>
                    <div class="text-center mt-4">
                        <p class="mb-2">
                            Đơn hàng của bạn đã được ghi nhận thành công.
                        </p>
                        <p class="text-muted">
                            NTN SHOP sẽ liên hệ xác nhận và giao hàng sớm nhất.
                        </p>
                    </div>

                    <div class="bg-light rounded text-center p-4 mt-4">
                        <p class="mb-2">
                            Cảm ơn bạn đã mua sắm tại NTN SHOP ❤️
                        </p>
                    </div>
                    <a href="trangchu" class="btn btn-detail btn-back">
                        Quay lại mua sắm
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>