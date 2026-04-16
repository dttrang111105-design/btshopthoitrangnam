<%-- 
    Document   : dangki
    Created on : Apr 15, 2026, 11:56:30 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ĐĂNG KÝ</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body{
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI';
                background: url('images/banner1.png') no-repeat center center fixed;
                background-size: cover;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            /*Overlay*/
            .page-overlay{
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.6);
                backdrop-filter: blur(5px);
                z-index: 1;
            }
            /* Container đăng ký */
            .register-container {
                position: relative;
                z-index: 2;
                width: 100%;
                max-width: 450px; /* rộng hơn login */
                background: white;
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
            }
            .register-container h2 {
                font-weight: 800;
                text-align: center;
                margin-bottom: 10px;
                color: #333;
                letter-spacing: 2px;
            }
            .register-container p {
                text-align: center;
                color: #777;
                margin-bottom: 25px;
            }
            .form-control {
                border-radius: 10px;
                padding: 12px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                transition: 0.3s;
            }
            .form-control:focus {
                border-color: #2a5298;
                box-shadow: 0 0 5px rgba(42, 82, 152, 0.3);
            }
            .btn-register {
                width: 100%;
                padding: 12px;
                border: none;
                border-radius: 10px;
                background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
                color: white;
                font-weight: bold;
                font-size: 16px;
                transition: 0.3s;
            }
            .btn-register:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(56, 239, 125, 0.4);
            }
            .error-msg {
                color: #e74c3c;
                text-align: center;
                font-weight: bold;
                margin-bottom: 10px;
            }
            .alert-success {
                color: green;
                text-align: center;
                font-weight: bold;
                margin-bottom: 10px;
            }
            .back-login {
                display: block;
                text-align: center;
                margin-top: 15px;
                color: #2a5298;
                text-decoration: none;
                font-weight: 500;
            }
            .back-login:hover {
                text-decoration: underline;
            }
            /* nhóm input cho gọn */
                .mb-3 {
                    margin-bottom: 18px;
                }
            /* chỉnh lại nút đăng ký nhỏ hơn */
            .btn-register {
                width: 65%;              /* nhỏ lại */
                display: block;
                margin: 20px auto 0;     /* căn giữa */
                padding: 10px;
                font-size: 15px;
            }
        </style>
    </head>
    <body>
        <div class="page-overlay"></div>
        <div class="register-container">
            <h2>ĐĂNG KÝ </h2>
            <p>NTN SHOP - Thời trang nam</p>
            <%
                String error = (String) request.getAttribute("error");
                if ("exist".equals(error)) {
            %>
                <div class="error-msg">Tài khoản hoặc email đã tồn tại!</div>
            <%
                } else if ("phone_invalid".equals(error)) {
            %>
                <div class="error-msg">Số điện thoại không hợp lệ!</div>
            <%
                } else if ("db".equals(error)) {
            %>
                <div class="error-msg">Lỗi hệ thống, vui lòng thử lại!</div>
            <%
                }
            %>
            <form action="dangky" method="post">
                <div class="mb-3">
                    <label>Tên đăng nhập</label>
                    <input type="text" name="user" class="form-control" placeholder="Nhập username" required>
                </div>
                <div class="mb-3">
                    <label>Mật khẩu</label>
                    <input type="password" name="pass" class="form-control" placeholder="Nhập mật khẩu" required>
                </div>
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Nhập email" required>
                </div>
                <div class="mb-3">
                    <label>Số điện thoại</label>
                    <input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại" required>
                </div>
                <div class="mb-3">
                    <label>Địa chỉ</label>
                    <input type="text" name="address" class="form-control" placeholder="Nhập địa chỉ" required>
                </div>
                <button class="btn-register">ĐĂNG KÝ</button>
            </form>
            <a href="dangnhap.jsp" class="d-block text-center mt-3"><- Quay lại đăng nhập</a>
        </div>
    </body>
</html>
