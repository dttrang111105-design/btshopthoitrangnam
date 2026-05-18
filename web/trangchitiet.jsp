<%-- 
    Document   : trangchitiet
    Created on : Apr 17, 2026, 12:54:26 PM
    Author     : Admin
--%>

<%@page import="DAO.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết sản phẩm</title>

        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

        <style>
            body{
                background:#f3f4f6;
                font-family:'Segoe UI',sans-serif;
                color:#111827;
            }

            /* MAIN CARD */
            .detail-wrapper{
                background:white;
                border-radius:24px;
                overflow:hidden;
                box-shadow:0 10px 40px rgba(0,0,0,0.08);
                padding:40px;
            }

            /* IMAGE */
            .product-gallery{
                position:relative;
                overflow:hidden;
                border-radius:20px;
                background:#f9fafb;
            }

            .product-gallery img{
                width:100%;
                height:620px;
                object-fit:cover;
                transition:.5s;
            }

            .product-gallery:hover img{
                transform:scale(1.06);
            }

            /* INFO */
            .product-info{
                padding-left:30px;
            }

            .product-category{
                display:inline-block;
                background:#111827;
                color:white;
                padding:6px 14px;
                border-radius:20px;
                font-size:13px;
                margin-bottom:15px;
            }

            .product-title{
                font-size:42px;
                font-weight:800;
                margin-bottom:10px;
                line-height:1.2;
            }

            .rating{
                color:#f59e0b;
                margin-bottom:18px;
            }

            .price-box{
                background:linear-gradient(135deg,#111827,#1f2937);
                color:white;
                padding:22px;
                border-radius:18px;
                margin-bottom:25px;
            }

            .old-price{
                text-decoration:line-through;
                opacity:.7;
                font-size:18px;
            }

            .new-price{
                font-size:42px;
                font-weight:800;
            }

            .stock{
                display:inline-block;
                background:#dcfce7;
                color:#166534;
                padding:8px 14px;
                border-radius:12px;
                font-weight:600;
                margin-bottom:20px;
            }

            .stock.out{
                background:#fee2e2;
                color:#991b1b;
            }

            /* FEATURES */
            .feature-list{
                margin:25px 0;
            }

            .feature-item{
                display:flex;
                align-items:center;
                gap:12px;
                margin-bottom:12px;
                font-size:15px;
            }

            .feature-item i{
                color:#8b4513;
                font-size:18px;
            }

            /* QUANTITY */
            .qty-box{
                margin:20px 0;
            }

            .qty-input{
                width:110px;
                border:2px solid #e5e7eb;
                border-radius:12px;
                padding:10px;
                text-align:center;
                font-weight:600;
            }

            /* BUTTON */
            .action-group{
                display:flex;
                gap:15px;
                margin-top:25px;
            }

            .btn-cart{
                flex:1;
                background:white;
                border:2px solid #111827;
                color:#111827;
                border-radius:14px;
                padding:14px;
                font-weight:700;
                transition:.3s;
            }

            .btn-cart:hover{
                background:#111827;
                color:white;
            }

            .btn-buy{
                flex:1;
                border:none;
                background:#8b4513;
                color:white;
                border-radius:14px;
                padding:14px;
                font-weight:700;
                transition:.3s;
            }

            .btn-buy:hover{
                background:#6d3410;
            }

            /* SECTION */
            .info-section{
                background:white;
                border-radius:20px;
                padding:30px;
                margin-top:30px;
                box-shadow:0 5px 20px rgba(0,0,0,0.05);
            }

            .section-title{
                font-size:24px;
                font-weight:800;
                margin-bottom:20px;
                position:relative;
            }

            .section-title::after{
                content:"";
                width:70px;
                height:4px;
                background:#8b4513;
                position:absolute;
                left:0;
                bottom:-8px;
                border-radius:10px;
            }

            /* DESCRIPTION */
            .desc-content{
                line-height:1.9;
                color:#4b5563;
                white-space:pre-line;
            }

            /* TABLE */
            .spec-table tr{
                border-bottom:1px solid #f0f0f0;
            }

            .spec-table td{
                padding:14px 10px;
            }

            .spec-table td:first-child{
                font-weight:700;
                width:180px;
            }

            /* MOBILE */
            @media(max-width:991px){

                .product-info{
                    padding-left:0;
                    margin-top:30px;
                }
                .product-gallery img{
                    height:400px;
                }
                .product-title{
                    font-size:32px;
                }
                .new-price{
                    font-size:34px;
                }
                .action-group{
                    flex-direction:column;
                }
            }
        </style>
    </head>
    <body>
        <%
            Integer cartCount = (Integer) request.getAttribute("cartCount");
                if(cartCount == null){
                    cartCount = 0;
                }
            Product d = (Product) request.getAttribute("detail");
            if (d == null) {
        %>
        <h3>Lỗi: Không tìm thấy sản phẩm</h3>
        <%
                return;
            }
        %>
        <!-- 🔵 MENU -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
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
                                <a href="giohang" class="btn btn-light me-2 position-relative">
                                    <i class="fa fa-shopping-cart"></i>
                                    <% if(cartCount > 0){ %>
                                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                            <%=cartCount%>
                                        </span>
                                    <% 
                                        } 
                                    %>
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
        <form action="themvaogiohang" method="get">
            <!-- 🔵 CONTENT -->
            <div class="container my-5">
                <div class="detail-wrapper">
                    <div class="row align-items-center">
                        <!-- IMAGE -->
                        <div class="col-lg-6">
                            <div class="product-gallery">
                                <img src="<%=request.getContextPath()%>/<%=d.getImage()%>">
                            </div>
                        </div>
                        <!-- INFO -->
                        <div class="col-lg-6">
                            <div class="product-info">
                                <div class="product-category">
                                    <%=d.getCategory()%>
                                </div>
                                <h1 class="product-title">
                                    <%=d.getName()%>
                                </h1>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <span class="text-muted ms-2">
                                        (120 đánh giá)
                                    </span>
                                </div>
                                <div class="price-box">
                                    <% if ("sale".equalsIgnoreCase(d.getType())) { %>
                                        <div class="old-price">
                                            <%= (int)(d.getPrice()/0.8) %> VNĐ
                                        </div>
                                    <% 
                                        } 
                                    %>
                                    <div class="new-price">
                                        <%=d.getFormattedPrice()%> VNĐ
                                    </div>
                                </div>
                                <% 
                                    if(d.getStock() > 0){ 
                                %>
                                    <div class="stock">
                                        Còn <%=d.getStock()%> sản phẩm
                                    </div>
                                <% 
                                    } else { 
                                %>
                                    <div class="stock out">
                                        Hết hàng
                                    </div>
                                <% 
                                    } 
                                %>
                                <div class="feature-list">
                                    <div class="feature-item">
                                        <i class="fa fa-truck"></i>
                                        Giao hàng toàn quốc
                                    </div>
                                    <div class="feature-item">
                                        <i class="fa fa-shield"></i>
                                        Cam kết chính hãng 100%
                                    </div>
                                    <div class="feature-item">
                                        <i class="fa fa-rotate-left"></i>
                                        Đổi trả trong 7 ngày
                                    </div>
                                </div>
                                <input type="hidden" name="id" value="<%=d.getId()%>">
                                <div class="qty-box">
                                    <label class="fw-bold mb-2">
                                        Số lượng
                                    </label>
                                    <br>
                                    <input type="number" class="qty-input" name="quantity" value="1" min="1">
                                </div>
                                <div class="action-group">
                                    <%
                                         if(user != null){ 
                                    %>
                                    <% 
                                        if(d.getStock() > 0){ 
                                    %>
                                            <button type="submit" class="btn-cart">
                                                <i class="fa fa-cart-plus"></i>
                                                Thêm vào giỏ
                                            </button>
                                            <button type="submit" formaction="ThanhToan" class="btn-buy">
                                                Mua ngay
                                            </button>
                                        <% 
                                            } else { 
                                        %>
                                            <button class="btn btn-secondary w-100" disabled>
                                                Hết hàng
                                            </button>
                                        <% 
                                            } 
                                        %>

                                    <% 
                                        } else { 
                                    %>
                                        <a href="dangnhap.jsp" class="btn-buy text-center text-decoration-none">
                                            Đăng nhập để mua hàng
                                        </a>
                                    <% 
                                        } 
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- DESCRIPTION -->
                <div class="info-section">
                    <div class="section-title">
                        Mô tả sản phẩm
                    </div>
                    <div class="desc-content">
                        <%=d.getDesc()%>
                    </div>
                </div>
                <!-- SPEC -->
                <div class="info-section">
                    <div class="section-title">
                        Thông tin chi tiết
                    </div>
                    <table class="table spec-table">
                        <tr>
                            <td>Danh mục</td>
                            <td><%=d.getCategory()%></td>
                        </tr>
                        <tr>
                            <td>Loại sản phẩm</td>
                            <td><%=d.getType()%></td>
                        </tr>
                        <tr>
                            <td>Tồn kho</td>
                            <td><%=d.getStock()%> sản phẩm</td>
                        </tr>
                    </table>
                </div>
            </div>
        </form>
        <!-- 🔵 FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-4">
            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>
        </div>
        <jsp:include page="chatbox.jsp"/>
    </body>
</html>
