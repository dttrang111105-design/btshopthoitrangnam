<%-- 
    Document   : dangnhap
    Created on : Apr 11, 2026, 3:19:47 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập - NTN Shop</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: url('images/banner1.png') no-repeat center center fixed;
                background-size: cover;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            /* Lớp phủ mờ toàn màn hình */
            .page-overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.6);
                backdrop-filter: blur(5px);
                z-index: 1;
            }

            /* Khung đăng nhập chính */
            .login-container {
                position: relative;
                z-index: 2;
                width: 100%;
                max-width: 400px;
                background: white;
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
            }

            .login-container h2 {
                font-weight: 800;
                text-align: center;
                margin-bottom: 10px;
                color: #333;
                letter-spacing: 2px;
            }

            .login-container p {
                text-align: center;
                color: #777;
                margin-bottom: 30px;
            }

            .form-control {
                border-radius: 10px;
                padding: 12px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
            }

            .btn-login-submit {
                width: 100%;
                padding: 12px;
                border: none;
                border-radius: 10px;
                background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
                color: white;
                font-weight: bold;
                font-size: 16px;
                transition: 0.3s;
            }

            .btn-login-submit:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(42, 82, 152, 0.4);
            }

            .error-msg {
                color: #e74c3c;
                text-align: center;
                font-weight: bold;
                margin-bottom: 15px;
            }

            .back-home {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #2a5298;
                text-decoration: none;
                font-weight: 500;
            }
        </style>
    </head>
    <body>
        <div class="page-overlay"></div>

        <div class="login-container">
            <h2>ĐĂNG NHẬP</h2>
            <p>NTN SHOP - Thời trang nam</p>

            <%
                String error = request.getParameter("error");
                if ("1".equals(error)) {
            %>
                <div class="error-msg">Tài khoản hoặc mật khẩu không đúng!</div>
            <%
                } else if ("db".equals(error)) {
            %>
                <div class="error-msg">Lỗi kết nối cơ sở dữ liệu!</div>
            <%
                }
            %>

            <form action="dangnhap" method="post">
                <div class="mb-3">
                    <input type="text" name="user" class="form-control" placeholder="Tên đăng nhập / Email" required>
                </div>
                <div class="mb-3">
                    <input type="password" name="pass" class="form-control" placeholder="Mật khẩu" required>
                </div>
                <button type="submit" class="btn-login-submit">ĐĂNG NHẬP NGAY</button>
            </form>

            <div class="text-center mt-3">
                <span>Chưa có tài khoản? </span>
                <a href="register.jsp" style="color: #d4a017; font-weight: bold; text-decoration: none;">Đăng ký ngay</a>
            </div>

            <a href="trangchu" class="back-home">← Quay lại trang chủ</a>
        </div>

        <script src="css/css/js/bootstrap.bundle.min.js"></script>
    </body>
</html>