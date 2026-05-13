<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model.CartItem"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thanh toán tất cả</title>

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
                height:120px;
                object-fit:cover;
            }
            .total-price{
                color:#8b4513;
                font-size:28px;
                font-weight:bold;
            }
            .item-box{
                border-bottom:1px solid #eee;
                padding:10px 0;
            }
        </style>
    </head>

    <body>

        <%
            List<CartItem> items = (List<CartItem>) request.getAttribute("items");
            Map<Integer, Product> productMap = (Map<Integer, Product>) request.getAttribute("productMap");
            Double total = (Double) request.getAttribute("total");
        %>

        <div class="container mt-5 mb-5">
            <div class="checkout-box">

                <h2 class="mb-4">Thanh toán tất cả sản phẩm</h2>

                <!-- LIST SẢN PHẨM -->
                <%
                    for (CartItem item : items) {
                        Product p = productMap.get(item.getProductId());
                        if (p == null) {
                            continue;
                        }

                        double sub = p.getPrice() * item.getQuantity();
                %>

                <div class="item-box row align-items-center">
                    <div class="col-md-2">
                        <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" class="product-img w-100 rounded">
                    </div>

                    <div class="col-md-6">
                        <h5><%=p.getName()%></h5>
                        <p>Số lượng: <b>x<%=item.getQuantity()%></b></p>
                        <p><%=p.getFormattedPrice()%> VNĐ</p>
                    </div>

                    <div class="col-md-4 text-end">
                        <h5 class="text-danger">
                            <%=String.format("%,.0f", sub)%> VNĐ
                        </h5>
                    </div>
                </div>

                <% }%>

                <hr>

                <h3 class="text-end">
                    Tổng tiền:
                    <span class="total-price">
                        <%=String.format("%,.0f", total)%> VNĐ
                    </span>
                </h3>

                <hr>

                <!-- FORM GIỐNG HỆT THANHTOAN.JSP -->
                <h4 class="mb-4">Thông tin nhận hàng</h4>

                <form action="ThanhToan" method="post">

                    <!-- KHÔNG cần id vì là ALL -->
                    <input type="hidden" name="all" value="true">

                    <div class="mb-3">
                        <label>Họ tên</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Số điện thoại</label>
                        <input type="tel" name="phone" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Địa chỉ</label>
                        <textarea name="address" class="form-control" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-danger w-100">
                        Xác nhận thanh toán tất cả
                    </button>
                </form>

            </div>
        </div>

    </body>
</html>