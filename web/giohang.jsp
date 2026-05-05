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
<<<<<<< HEAD
=======
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
>>>>>>> ntnam
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="trangchu">Trang chủ</a>
                <div class="d-flex">
                    <a href="trangchu" class="btn btn-light me-2"><- Mua tiếp</a>
                    <a href="dangxuat" class="btn btn-danger">Đăng xuất</a>
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
<<<<<<< HEAD
                                <td class="fw-bold"><%=p.getName()%></td>
                                <td class="text-primary"><%=p.getFormattedPrice()%></td>
=======
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
>>>>>>> ntnam
                                <!--Update-->
                                <td>
                                    <form action="capnhatgiohang" method="post" class="d-flex justify-content-center">
                                        <input type="hidden" name="id" value="<%=item.getId()%>">
                                        <input type="number" name="quantity" value="<%=quantity%>" min="1" class="form-control w-50 me-2">
                                        <button class="btn btn-dark btn-sm">
<<<<<<< HEAD
                                            <i class="fa fa-shopping-cart"></i>
=======
                                            <i class="fa-solid fa-rotate"></i>
>>>>>>> ntnam
                                        </button>
                                    </form>
                                </td>
                                <td class="text-danger fw-bold"><%=Product.formatPrice(subtotal)%> VNĐ</td>
                                <!--Delete-->
                                <td>
                                    <a href="xoagiohang?id=<%=item.getId()%>" class="btn btn-danger btn-sm">
<<<<<<< HEAD
                                        <i class="fa fa-cart-plus"></i>
=======
                                        <i class="fa-solid fa-trash"></i>
>>>>>>> ntnam
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
    </body>
</html>