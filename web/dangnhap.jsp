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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              rel="stylesheet"/>
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
            .alert-success {
                color: green;
                text-align: center;
                font-weight: bold;
            }
            .back-home {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #2a5298;
                text-decoration: none;
                font-weight: 500;
            }
            .google-btn{
                width:100%;
                height:52px;
                border:none;
                border-radius:14px;
                background:white;
                color:#444;
                font-weight:600;
                font-size:15px;
                border:1px solid #e5e7eb;
                margin-top:15px;
                transition:.25s;
                display:flex;
                align-items:center;
                justify-content:center;
                gap:12px;
                text-decoration:none;
                box-shadow: 0 2px 10px rgba(0,0,0,.05);
            }
            .google-btn:hover{
                background:#fafafa;
                transform:translateY(-2px);
                box-shadow: 0 8px 20px rgba(0,0,0,.08);
                color:#111;
            }
            .divider{
                display:flex;
                align-items:center;
                text-align:center;
                color:#9ca3af;
                margin:24px 0;
                font-size:14px;
                font-weight:500;
            }
            .divider::before,
            .divider::after{
                content:'';
                flex:1;
                border-bottom:1px solid #e5e7eb;
            }
            .divider:not(:empty)::before{
                margin-right:15px;
            }
            .divider:not(:empty)::after{
                margin-left:15px;
            }
        </style>
    </head>
    <body>
        <div class="page-overlay"></div>

        <div class="login-container">
            <h2>ĐĂNG NHẬP</h2>
            <p>NTN SHOP - Thời trang nam</p>

            <%
                String error = (String) request.getAttribute("error");
                String success = (String) request.getAttribute("success");
                if ("1".equals(error)) {
            %>
            <div class="error-msg">Tài khoản hoặc mật khẩu không đúng!</div>
            <%
            } else if ("db".equals(error)) {
            %>
            <div class="error-msg">Lỗi kết nối cơ sở dữ liệu!</div>
            <%
            } else if ("exist".equals(error)) {
            %>
            <div class="error-msg">Tài khoản hoặc email đã tồn tại!</div>
            <%
            } else if ("phone_invalid".equals(error)) {
            %>
            <div class="error-msg">Số điện thoại không hợp lệ!</div>
            <%
            } else if ("not_admin".equals(error)) {
            %>
            <div class="error-msg">Bạn không có quyền admin!</div>
            <%
                }
                if ("1".equals(success)) {
            %>
            <div class="alert alert-success">Đăng ký thành công!Mời đăng nhập</div>
            <%
                }
            %>

            <form action="dangnhap" method="post">
                <div class="mb-3">
                    <input type="text" name="user" class="form-control" placeholder="Tên đăng nhập / Email"
                           value="<%=request.getAttribute("user") != null ? request.getAttribute("user") : ""%>" required>
                </div>
                <div class="mb-3">
                    <input type="password" name="pass" class="form-control" placeholder="Mật khẩu" required>
                </div>
                <!-- Đăng nhập -->
                <button type="submit" name="loginType" value="user" class="btn-login-submit">
                    ĐĂNG NHẬP
                </button>

                <button type="submit" name="loginType" value="Admin"
                        class="btn-login-submit mt-3"
                        style="background: linear-gradient(135deg,#8B0000,#c0392b);">
                    ĐĂNG NHẬP VỚI TƯ CÁCH ADMIN
                </button>
                <div class="divider">
                    HOẶC
                </div>
                <!-- GOOGLE LOGIN -->
                <a href="GoogleLogin" class="google-btn">
                    <img src="https://cdn-icons-png.flaticon.com/512/300/300221.png" width="22" height="22">
                    <span> Đăng nhập với Google </span>
                </a>
            </form>

            <div class="text-center mt-3">
                <span>Chưa có tài khoản? </span>
                <a href="dangky.jsp" style="color: #d4a017; font-weight: bold; text-decoration: none;">Đăng ký ngay</a>
            </div>

            <a href="trangchu" class="back-home">← Quay lại trang chủ</a>
        </div>

        <script src="css/css/js/bootstrap.bundle.min.js"></script>
    </body>
</html>