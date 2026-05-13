<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model.CartItem"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thanh toán thành công</title>

        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">

        <style>
            .order-confirm-box{
                max-width: 700px;
                margin:auto;
                background:white;
                padding:25px;
                border-radius:15px;
            }
            .item{
                border-bottom:1px solid #eee;
                padding:10px 0;
            }
            .total-price{
                color:#8b4513;
                font-size:28px;
                font-weight:bold;
            }
        </style>
    </head>

    <body class="bg-light">

        <%
            List<CartItem> items = (List<CartItem>) request.getAttribute("items");
            Map<Integer, Product> productMap = (Map<Integer, Product>) request.getAttribute("productMap");
            Double total = (Double) request.getAttribute("total");
            String name = (String) request.getAttribute("name");
        %>

        <div class="container py-5">

            <div class="order-confirm-box">

                <div class="text-center mb-4">
                    <h1>✔</h1>
                    <h2>ĐẶT HÀNG THÀNH CÔNG</h2>
                </div>

                <h5>Cảm ơn <%=name%> đã mua hàng!</h5>

                <hr>

                <!-- LIST SẢN PHẨM -->
                <%
                    for (CartItem item : items) {
                        Product p = productMap.get(item.getProductId());
                        if (p == null)
                            continue;
                %>

                <div class="item">
                    <b><%=p.getName()%></b><br>
                    SL: x<%=item.getQuantity()%><br>
                    Giá: <%=p.getFormattedPrice()%>
                </div>

                <% }%>

                <hr>

                <h3 class="text-center">
                    Tổng tiền:
                    <div class="total-price">
                        <%=String.format("%,.0f", total)%> VNĐ
                    </div>
                </h3>

                <a href="trangchu" class="btn btn-primary w-100 mt-3">
                    Quay lại mua sắm
                </a>

            </div>

        </div>

    </body>
</html>