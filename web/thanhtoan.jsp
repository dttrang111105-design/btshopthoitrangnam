<%-- 
    Document   : thanhtoan
    Created on : May 8, 2026, 11:02:50 PM
    Author     : ADMIN
--%>

<%@page import="DAO.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
        <style>

            .checkout-box{
                background:white;
                padding:30px;
                border-radius:12px;
                box-shadow:0 5px 20px rgba(0,0,0,0.1);
            }

            .product-img{
                height:400px;
                object-fit:cover;
            }

            .total-price{
                color:#8b4513;
                font-size:28px;
                font-weight:bold;
            }

        </style>
    </head>
    <body>
        <%
            Product p = (Product) request.getAttribute("p");
            if(p == null){
        %>
        <div class="container mt-5">
            <h3>Không tìm thấy sản phẩm</h3>
        </div>
        <%
            return;
            }
            int quantity = (Integer) request.getAttribute("quantity");
            double total = p.getPrice()*quantity;
        %>
        <!-- 🔵 MENU -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="trangchu">Trang chủ</a>

                <div class="collapse navbar-collapse" id="mainNav">
                    <ul class="navbar-nav me-auto">

                        <!-- ÁO -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Áo
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=áo polo">Áo polo</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=áo sơ mi">Áo sơ mi</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=áo khoác">Áo khoác</a></li>
                            </ul>
                        </li>

                        <!-- QUẦN -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Quần
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=quần jean">Quần jean</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=quần âu">Quần âu</a></li>
                            </ul>
                        </li>
                        
                        <!-- GIÀY -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Giày
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=giày sneaker">Giày sneaker</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=giày da">Giày da</a></li>
                            </ul>
                        </li>

                        <!-- PHỤ KIỆN -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button">
                                Phụ kiện
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="trangchu?category=đồng hồ">Đồng hồ</a></li>
                                <li><a class="dropdown-item" href="trangchu?category=thắt lưng">Thắt lưng</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="lienhe.jsp">Liên hệ</a></li>
                    </ul>

                    <div class="d-flex align-items-center">
                        <form class="d-flex me-3" action="TimKiem" method="get">
                            <input class="form-control me-2" type="search" name="name" placeholder="Nhập tên sản phẩm">
                            <button class="btn btn-outline-light">Tìm</button>
                        </form>
                        <!-- nút đăng nhập sau khi login sẽ chuyển thành giỏ hàng và ô chat -->
                        <%
                            Object user = session.getAttribute("user");
                            if (user == null) {
                        %>
                            <a href="dangnhap.jsp" class="btn btn-light">Đăng nhập</a>
                        <%
                            } else {
                        %>
                            <!-- ICON GIỎ HÀNG -->
                            <a href="giohang" class="btn btn-light me-2">
                                <i class="fa fa-shopping-cart"></i>
                            </a>
                            <!-- USER -->
                            <a href="dangxuat" class="btn btn-danger">Đăng xuất</a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Thanh toán -->
        <div class="container mt-5 mb-5">
            <div class="checkout-box">
                <div class="row">
                    <!-- Ảnh -->
                    <div class="col-md-5">
                        <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="product-img w-100 rounded">
                    </div>
                    
                    <!-- Thông tin -->
                    <div class="col-md-7">
                        <h2 class="card-title mb-3"><%=p.getName()%></h2>
                        <p class="price"><%=p.getFormattedPrice()%> VNĐ</p>
                        <hr>
                        <p><b>Danh mục: </b><%=p.getCategory()%></p>
                        <p><b>Loại: </b><%=p.getType()%></p>
                        <p><b>Số lượng: </b><%=quantity%></p>
                        <p class="total-price">
                            Tổng tiền:  
                            <%=String.format("%,.0f", total)%> VNĐ
                        </p>
                        <hr>
                        <h4 class="mb-4">Thông tin nhận hàng</h4>
                        <form action="ThanhToan" method="post">
                            <!-- hidden -->
                            <input type="hidden" name="id" value="<%=p.getId()%>"
                            <input type="hidden" name="quantity" value="<%=quantity%>">
                            
                            <!-- họ tên -->
                            <div class="mb-3">
                                <label class="form-label">Họ tên</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            
                            <!-- sđt -->
                            <div class="mb-3">
                                <label class="form-label">Sđt</label>
                                <input type="text" name="phone" class="form-control" required>
                            </div>
                            
                            <!-- địa chỉ -->
                            <div class="mb-3">
                                <label class="form-label">Địa chỉ</label>
                                <textarea type="text" name="address" class="form-control" required></textarea>
                            </div>
                            
                            <a href="thanhcong.jsp" class="btn btn-danger">Xác nhận thanh toán</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 🔵 FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-4">
            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>
        </div>
    </body>
</html>
