package controller.giohang;

import DAO.CartDAO;
import DAO.CartItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
import model.User;

/**
 *
 * @author XPS
 */
public class themvaogiohang extends HttpServlet {

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
            throws ServletException, IOException {

        try {
<<<<<<< HEAD
            response.setContentType("text/html;charset=UTF-8");           
            //Session để lưu thông tin người dùng đăng nhập
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
=======
            response.setContentType("text/html;charset=UTF-8");
            
            //Session để lưu thông tin người dùng đăng nhập
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

>>>>>>> ntnam
            //Kiểm tra người dùng đã đăng nhập chưa, null là chưa và chuyển hướng đến trang đăng nhập
            if (user == null) {
                response.sendRedirect("dangnhap");
                return;
            }
<<<<<<< HEAD
            //Lấy id người dùng
            int userId = user.getId();
            int quantity = Integer.parseInt(request.getParameter("quantity"));            
            //Lấy id sản phẩm
            int productId = Integer.parseInt(request.getParameter("id"));
            // Lấy thông tin giỏ hàng của người dùng
            Cart cart = new CartDAO().getCartByUserId(userId);
=======

            //Lấy id người dùng
            int userId = user.getId();
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            //Lấy id sản phẩm
            int productId = Integer.parseInt(request.getParameter("id"));

            // Lấy thông tin giỏ hàng của người dùng
            Cart cart = new CartDAO().getCartByUserId(userId);

>>>>>>> ntnam
            //Nếu user chưa có cart thì tạo cart mới
            if (cart == null) {
                cart = new CartDAO().createCart(userId);
            }
<<<<<<< HEAD
            //Kiểm tra xem sản phẩm đã có trong giỏ hàng hay chưa
            CartItem item = new CartItemDAO().getItem(cart.getId(), productId);
=======

            //Kiểm tra xem sản phẩm đã có trong giỏ hàng hay chưa
            CartItem item = new CartItemDAO().getItem(cart.getId(), productId);

>>>>>>> ntnam
            //Nếu đã có sản phẩm thì tăng số lượng, nếu chưa có thì thêm sản phẩm vào giỏ hàng
            if (item != null) {
                int newQuantity = item.getQuantity() + quantity;
                new CartItemDAO().UpdateQuantity(item.getId(), newQuantity);
            } else {
                new CartItemDAO().Add(cart.getId(), productId, quantity);
            }
<<<<<<< HEAD
            //chuyển đến trang giỏ hàng
            response.sendRedirect("giohang"); // hoặc trang bạn muốn
=======

            //chuyển đến trang giỏ hàng
            response.sendRedirect("giohang"); // hoặc trang bạn muốn

>>>>>>> ntnam
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet themvaogiohang</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet themvaogiohang at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(themvaogiohang.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
