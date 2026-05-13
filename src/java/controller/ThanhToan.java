/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CartDAO;
import DAO.CartItemDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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

/**
 *
 * @author ADMIN
 */
public class ThanhToan extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            Product p = new ProductDAO().getByID(id);
            if (p.getStock() < quantity) {
                response.getWriter().println("Không đủ hàng trong kho");
                return;
            }

            // trừ stock
            p.setStock(p.getStock() - quantity);
            new ProductDAO().Update(p);
            
            if( p == null ){
                response.getWriter().println("Không tìm thấy sản phẩm.");
                return;
            }
            request.setAttribute("p", p);
            request.setAttribute("quantity", quantity);

            request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ThanhToan.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            // Lấy thông tin sản phẩm và số lượng từ thẻ <input type="hidden">
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            // Lấy thông tin khách hàng từ Form người dùng vừa nhập
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            // Lấy thông tin sản phẩm từ DAO để lấy giá chính xác
            Product p = new ProductDAO().getByID(id);
            if (p != null) {
                // Tính tổng tiền = giá (đã giảm nếu có) * số lượng
                double total = p.getPrice() * quantity;
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                if(user == null){
                    response.sendRedirect("dangnhap.jsp");
                    return;
                }
                // tạo order
                Orders order = new Orders();
                order.setUserId(user.getId());
                order.setTotalMoney(total);
                OrderDAO orderDAO = new OrderDAO();
                
                int orderId = orderDAO.addOrders(order);
                // tạo order detail
                OrderDetail od = new OrderDetail();
                od.setOrderId(orderId);
                od.setProductId(p.getId());
                od.setQuantity(quantity);
                od.setPrice(p.getPrice());

                new OrderDetailDAO().addOrderDetail(od);
                // Đẩy TẤT CẢ dữ liệu vào request để trang thanhcong.jsp lấy ra
                request.setAttribute("p", p);
                request.setAttribute("quantity", quantity);
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("total", total);

                //Giỏ hàng
                int cartCount = 0;
                if(user != null){
                    Cart cart = new CartDAO().getCartByUserId(user.getId());
                    if(cart != null){
                        List<CartItem> cartItems = new CartItemDAO().getItemsByCartId(cart.getId());
                        for(CartItem item : cartItems){
                            cartCount += item.getQuantity();
                        }
                    }
                }
            request.setAttribute("cartCount", cartCount);
                // Chuyển hướng sang trang thanhcong.jsp bằng forward
                // Dùng forward thì trang JSP mới đọc được request.getAttribute
                request.getRequestDispatcher("thanhcong.jsp").forward(request, response);
            } else {
                response.getWriter().println("Lỗi: Không tìm thấy sản phẩm để thanh toán.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Có lỗi xảy ra: " + e.getMessage());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
