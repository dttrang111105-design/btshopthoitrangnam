package controller;

import DAO.CartDAO;
import DAO.CartItemDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.CartItem;
import model.OrderDetail;
import model.Orders;
import model.Product;
import model.User;

public class ThanhToan extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        try {

            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            String method = request.getMethod();

            // GET
            if (method.equalsIgnoreCase("GET")) {

                String idParam = request.getParameter("id");
                // ================= THANH TOÁN TẤT CẢ =================
                if (idParam == null || idParam.isEmpty()) {
                    HttpSession session = request.getSession();
                    User user = (User) session.getAttribute("user");
                    if (user == null) {
                        response.sendRedirect("dangnhap.jsp");
                        return;
                    }
                    
                    Cart cart = new CartDAO().getCartByUserId(user.getId());
                    if (cart == null) {
                        response.getWriter().println("Không có giỏ hàng");
                        return;
                    }
                    
                    List<CartItem> items = new CartItemDAO().getItemsByCartId(cart.getId());
                    if (items == null || items.isEmpty()) {
                        response.getWriter().println("Giỏ hàng trống");
                        return;
                    }

                    Map<Integer, Product> productMap = new HashMap<>();

                    double total = 0;

                    ProductDAO productDAO = new ProductDAO();

                    for (CartItem item : items) {
                        Product p = productDAO.getByID(item.getProductId());

                        if (p != null) {
                            productMap.put(p.getId(), p);
                            total += p.getPrice() * item.getQuantity();
                        }
                    }

                    //Giỏ hàng
                    int cartCount = 0;
                    if (user != null) {
                        Cart c = new CartDAO().getCartByUserId(user.getId());
                        if (c != null) {
                            List<CartItem> cartItems = new CartItemDAO().getItemsByCartId(c.getId());
                            for (CartItem item : cartItems) {
                                cartCount += item.getQuantity();
                            }
                        }
                    }
                    request.setAttribute("cartCount", cartCount);
                    request.setAttribute("items", items);
                    request.setAttribute("productMap", productMap);
                    request.setAttribute("total", total);

                    request.getRequestDispatcher("thanhtoanall.jsp")
                            .forward(request, response);
                    return;
                }

                // ================= THANH TOÁN 1 SẢN PHẨM =================
                int id = Integer.parseInt(idParam);
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Product p = new ProductDAO().getByID(id);
                if (p == null) {
                    response.getWriter().println("Không tìm thấy sản phẩm");
                    return;
                }
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                int cartCount = 0;
                if (user != null) {
                    Cart c = new CartDAO().getCartByUserId(user.getId());
                    if (c != null) {
                        List<CartItem> cartItems = new CartItemDAO().getItemsByCartId(c.getId());
                        for (CartItem item : cartItems) {
                            cartCount += item.getQuantity();
                        }
                    }
                }
                request.setAttribute("cartCount", cartCount);
                request.setAttribute("p", p);
                request.setAttribute("quantity", quantity);
                request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
                return;
            }

            // POST
            String all = request.getParameter("all");

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("dangnhap.jsp");
                return;
            }

            // ================= THANH TOÁN TẤT CẢ =================
            if (all != null) {
                CartDAO cartDAO = new CartDAO();
                CartItemDAO cartItemDAO = new CartItemDAO();
                ProductDAO productDAO = new ProductDAO();
                OrderDAO orderDAO = new OrderDAO();
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();

                Cart cart = cartDAO.getCartByUserId(user.getId());

                if (cart == null) {
                    response.getWriter().println("Không có giỏ hàng");
                    return;
                }

                List<CartItem> items = cartItemDAO.getItemsByCartId(cart.getId());

                if (items == null || items.isEmpty()) {
                    response.getWriter().println("Giỏ hàng trống");
                    return;
                }

                double total = 0;

                Orders order = new Orders();

                order.setUserId(user.getId());

                int orderId = orderDAO.addOrders(order);

                for (CartItem item : items) {
                    Product p = productDAO.getByID(item.getProductId());
                    if (p == null) {
                        continue;
                    }

                    double sub = p.getPrice() * item.getQuantity();

                    total += sub;

                    OrderDetail od = new OrderDetail();

                    od.setOrderId(orderId);
                    od.setProductId(p.getId());
                    od.setQuantity(item.getQuantity());
                    od.setPrice(p.getPrice());

                    orderDetailDAO.addOrderDetail(od);
                }

                order.setId(orderId);
                order.setTotalMoney(total);
                orderDAO.updateTotal(order);

                cartItemDAO.clearCart(cart.getId());
                
                response.sendRedirect("thanhcongall.jsp");
                return;
            }

            // ================= THANH TOÁN 1 SẢN PHẨM =================
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            Product p = new ProductDAO().getByID(id);
            if (p == null) {
                response.getWriter().println("Không tìm thấy sản phẩm");
                return;
            }

            double total = p.getPrice() * quantity;

            Orders order = new Orders();

            order.setUserId(user.getId());
            order.setTotalMoney(total);

            OrderDAO orderDAO = new OrderDAO();

            int orderId = orderDAO.addOrders(order);

            OrderDetail od = new OrderDetail();

            od.setOrderId(orderId);
            od.setProductId(p.getId());
            od.setQuantity(quantity);
            od.setPrice(p.getPrice());

            new OrderDetailDAO().addOrderDetail(od);

            Cart cart = new CartDAO().getCartByUserId(user.getId());

            if (cart != null) {
                List<CartItem> cartItems = new CartItemDAO().getItemsByCartId(cart.getId());
                for (CartItem item : cartItems) {
                    if (item.getProductId() == p.getId()) {
                        new CartItemDAO().Delete(item.getId());
                        break;
                    }
                }
            }

            request.setAttribute("p", p);
            request.setAttribute("quantity", quantity);
            request.setAttribute("name", name);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("total", total);
            
            request.getRequestDispatcher("thanhcong.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Có lỗi xảy ra: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            processRequest(request, response);

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            processRequest(request, response);

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
