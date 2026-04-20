package controller.giohang;

import DAO.CartDAO;
import DAO.CartItemDAO;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
import model.Product;
import model.User;

/**
 *
 * @author XPS
 */
public class giohang extends HttpServlet {

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
            response.setContentType("text/html;charset=UTF-8");
            
            //Session để lưu thông tin người dùng đăng nhập
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            //Kiểm tra người dùng đã đăng nhập chưa, null là chưa và chuyển hướng đến trang đăng nhập
            if (user == null) {
                response.sendRedirect("dangnhap");
                return;
            }
            
            //Lấy id người dùng
            int userId = user.getId();
            
            Cart cart = new CartDAO().getCartByUserId(userId);
            
            //Kiểm tra giỏ hàng đang trống hay đã có sản phẩm
            if (cart == null) {
                request.setAttribute("items", null);
                request.getRequestDispatcher("giohang.jsp").forward(request, response);
                return;
            }
            
            //Lấy danh sách sản phẩm trong giỏ hàng
            List<CartItem> items = new CartItemDAO().getItemsByCartId(cart.getId());
            //Dùng map lưu key:productId và value:Product
            //Ví dụ productMap.get(1) → Quần bò
            Map<Integer, Product> productMap = new HashMap<>();
            for (CartItem item : items) {
                Product p = new ProductDAO().getByID(item.getProductId());
                productMap.put(item.getProductId(), p);
            }

            request.setAttribute("items", items);
            request.setAttribute("productMap", productMap);

            request.getRequestDispatcher("giohang.jsp").forward(request, response);

            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet giohang</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet giohang at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(giohang.class.getName()).log(Level.SEVERE, null, ex);
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
