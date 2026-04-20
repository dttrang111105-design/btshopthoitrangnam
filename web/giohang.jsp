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
    </head>
    <body>
        <h2>🛒 Giỏ hàng của bạn</h2>

        <%
            if (items == null || items.isEmpty()) {
        %>
        <p>Giỏ hàng trống</p>
        <%
        } else {
            //Tổng tiền
            double total = 0;
        %>

        <table border="1" cellpadding="10">
            <tr>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
                <th>Hành động</th>
            </tr>

            <%
                for (CartItem item : items) {
                //Ví dụ: productMap.get(1) -> Quần bò
                    Product p = productMap.get(item.getProductId());

                    if (p == null) {
                        continue;
                    }

                    double price = p.getPrice();
                    int quantity = item.getQuantity();
                    double subtotal = price * quantity;
                    total += subtotal;
            %>

            <tr>
                <td><%= p.getName()%></td>
                <td><%= p.getPrice()%></td>

                //Cập nhật số lượng
                <td>
                    <form action="capnhatgiohang" method="post">
                        <input type="hidden" name="id" value="<%= item.getId()%>">
                        <input type="number" name="quantity" value="<%=item.getQuantity()%>" min="1">
                        <button type="submit">Cập nhật</button>
                    </form>
                </td>

                <td><%=subtotal%></td>

                //Xóa sản phẩm khỏi giỏ hàng
                <td>
                    <a href="xoagiohang?id=<%= item.getId()%>">Xóa</a>
                </td>
            </tr>

            <%
                }
            %>

        </table>

        <h3>💰 Tổng tiền: <%= total%></h3>

        <%
            }
        %>

        <br>
        <a href="trangchu">← Tiếp tục mua hàng</a>
    </body>
</html>
