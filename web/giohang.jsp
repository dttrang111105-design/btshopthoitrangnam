<%-- 
    Document   : giohang
    Created on : Apr 19, 2026, 7:55:51 PM
    Author     : XPS
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Product"%>
<%@page import="model.CartItem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<CartItem> items = (List<CartItem>) request.getAttribute("items");
    Map<Integer, Product> productMap = (Map<Integer, Product>) request.getAttribute("productMap");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="trangchu.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <style>
            /* ảnh sản phẩm */
            .cart-img {
                width: 70px;
                height: 70px;
                object-fit: cover;
                border-radius: 10px;
                border: 1px solid #eee;
                transition: 0.3s;
            }

            .cart-img:hover {
                transform: scale(1.1);
            }
        </style>

    </head>
    <body>
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
        <div class="container mt-5">
            <h2 class="mb-4">🛒 Giỏ hàng của bạn</h2>
            <%
                if(items==null || items.isEmpty()){
                %>
                <div class="alert alert-warning text-center">
                    Giỏ hàng của bạn đang trống 😢
                </div>
                <% 
                } else {
                    double total = 0;
                %>
                <!--Card box-->
                <div class="card shadow-lg p-3">
                    <table class="table table-hover align-middle text-center">
                        <thead class="table-dark">
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(CartItem item : items){
                                    Product p = productMap.get(item.getProductId());
                                    if(p==null) continue;
                                    double price = p.getPrice();
                                    int quantity = item.getQuantity();
                                    double subtotal = price * quantity;
                                    total += subtotal;
                            %>
                            <tr>
                                <!-- Sản phẩm (ảnh+tên) -->
                                <td>
                                    <div class="d-flex align-items-center gap-3">
                                        <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="cart-img"/>
                                        <div class="text-start">
                                            <div class="fw-bold"><%=p.getName()%></div>
                                            <small class="text-muted">Sản phẩm thời trang</small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-primary"><%=p.getFormattedPrice()%> VNĐ</td>

                                <!--Update-->
                                <td>
                                    <form action="capnhatgiohang" method="post" class="d-flex justify-content-center">
                                        <input type="hidden" name="id" value="<%=item.getId()%>">
                                        <input type="number" name="quantity" value="<%=quantity%>" min="1" class="form-control w-50 me-2">
                                        <button class="btn btn-dark btn-sm">
                                            <i class="fa-solid fa-rotate"></i>
                                        </button>
                                    </form>
                                </td>
                                <td class="text-danger fw-bold"><%=Product.formatPrice(subtotal)%> VNĐ</td>
                                <!--Delete-->
                                <td>
                                    <a href="xoagiohang?id=<%=item.getId()%>" class="btn btn-danger btn-sm">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <!--Total-->
                    <div class="text-end mt-3">
                        <h4>
                            Tổng tiền:
                            <span class="text-danger fw-bold">
                                <%=Product.formatPrice(total)%> VNĐ
                            </span>
                        </h4>
                    </div>
                </div>
                <%
                }
                %>
        </div>
        <jsp:include page="chatbox.jsp"/>
    </body>
</html>