<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin cá nhân - NTN SHOP</title>

    <link href="css/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            background:#f4f6f9;
            min-height:100vh;
        }

        .profile-container{
            padding:40px 0;
        }

        .profile-wrapper{
            display:flex;
            gap:30px;
            align-items:flex-start;
        }

        .profile-sidebar{
            width:320px;
            background:white;
            border-radius:20px;
            padding:30px;
            text-align:center;
            box-shadow:0 5px 20px rgba(0,0,0,.08);
        }

        .avatar{
            width:120px;
            height:120px;
            border-radius:50%;
            background:#8b4513;
            color:white;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;
            font-size:50px;
        }

        .profile-sidebar h3{
            margin-top:20px;
            font-weight:700;
            color:#333;
        }

        .role-badge{
            display:inline-block;
            background:#198754;
            color:white;
            padding:6px 15px;
            border-radius:20px;
            margin-top:10px;
            font-size:14px;
        }

        .sidebar-info{
            margin-top:25px;
            text-align:left;
        }

        .sidebar-item{
            margin-bottom:20px;
            border-bottom:1px solid #eee;
            padding-bottom:10px;
        }

        .sidebar-item label{
            font-weight:700;
            color:#8b4513;
            margin-bottom:5px;
        }

        .sidebar-item p{
            margin:0;
            color:#555;
            word-break:break-word;
        }

        .profile-content{
            flex:1;
            background:white;
            border-radius:20px;
            padding:30px;
            box-shadow:0 5px 20px rgba(0,0,0,.08);
        }

        .profile-header{
            display:flex;
            justify-content:space-between;
            align-items:center;
            margin-bottom:30px;
        }

        .profile-header h2{
            font-weight:700;
            color:#8b4513;
            margin-bottom:5px;
        }

        .profile-header p{
            color:#777;
            margin:0;
        }

        .form-label{
            font-weight:600;
            margin-bottom:8px;
        }

        .form-control{
            border-radius:10px;
            padding:12px;
        }

        .btn-save{
            background:#8b4513;
            color:white;
            border:none;
            padding:12px 30px;
            border-radius:10px;
            font-weight:600;
            transition:0.3s;
        }

        .btn-save:hover{
            background:#6e3410;
        }

        .btn-home{
            border-radius:10px;
        }

        .alert{
            border-radius:10px;
        }

        @media(max-width:992px){

            .profile-wrapper{
                flex-direction:column;
            }

            .profile-sidebar{
                width:100%;
            }

        }

    </style>
</head>

<body>

<%
    User u = (User) request.getAttribute("userInfo");
%>

<div class="container profile-container">

    <div class="profile-wrapper">

        <!-- SIDEBAR -->
        <div class="profile-sidebar">

            <div class="avatar">
                <i class="fa-solid fa-user"></i>
            </div>

            <h3><%=u.getUserName()%></h3>

            <span class="role-badge">
                <%=u.getRole()%>
            </span>

            <div class="sidebar-info">

                <div class="sidebar-item">
                    <label>Email</label>
                    <p><%=u.getEmail()%></p>
                </div>

                <div class="sidebar-item">
                    <label>Số điện thoại</label>
                    <p><%=u.getPhone()%></p>
                </div>

                <div class="sidebar-item">
                    <label>Địa chỉ</label>
                    <p><%=u.getAddress()%></p>
                </div>

            </div>

        </div>

        <!-- CONTENT -->
        <div class="profile-content">

            <div class="profile-header">

                <div>
                    <h2>Thông tin cá nhân</h2>
                    <p>Quản lý và cập nhật thông tin tài khoản của bạn</p>
                </div>

                <a href="trangchu"
                   class="btn btn-outline-secondary btn-home">

                    <i class="fa fa-house"></i>
                    Trang chủ

                </a>

            </div>

            <% if(request.getParameter("success") != null){ %>

            <div class="alert alert-success">
                <i class="fa fa-circle-check"></i>
                Cập nhật thông tin thành công!
            </div>

            <% } %>

            <form action="profile" method="post">

                <div class="row">

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Tên đăng nhập
                        </label>

                        <input
                            type="text"
                            class="form-control"
                            value="<%=u.getUserName()%>"
                            readonly>

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Vai trò
                        </label>

                        <input
                            type="text"
                            class="form-control"
                            value="<%=u.getRole()%>"
                            readonly>

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Email
                        </label>

                        <input
                            type="email"
                            name="email"
                            class="form-control"
                            value="<%=u.getEmail()%>">

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Số điện thoại
                        </label>

                        <input
                            type="text"
                            name="phone"
                            class="form-control"
                            value="<%=u.getPhone()%>">

                    </div>

                    <div class="col-12 mb-4">

                        <label class="form-label">
                            Địa chỉ
                        </label>

                        <textarea
                            name="address"
                            rows="4"
                            class="form-control"><%=u.getAddress()%></textarea>

                    </div>

                </div>

                <button
                    type="submit"
                    class="btn-save">

                    <i class="fa-solid fa-floppy-disk"></i>
                    Lưu thay đổi

                </button>

            </form>

        </div>

    </div>

</div>

<script src="css/js/bootstrap.bundle.min.js"></script>

</body>
</html>

