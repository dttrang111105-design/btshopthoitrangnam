package controller;

import DAO.CartDAO;
import DAO.CartItemDAO;
import DAO.ContactDAO;
import DAO.UserDAO;
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
import model.Contact;
import model.User;

/**
 *
 * @author XPS
 */
public class lienhe extends HttpServlet {

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
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            String username = "";
            String msg = request.getParameter("msg");
            User user = (User) session.getAttribute("user");
            if (user != null) {
                username = user.getUserName();
            } else {
                username = request.getParameter("username");
            }
            Contact c = new Contact(username, msg);
            if (new ContactDAO().Add(c)) {
                request.setAttribute("mess", "Gửi liên hệ thành công!");
            } else {
                request.setAttribute("mess", "Gửi liên hệ thất bại!");
            }

            int cartCount = 0;
            if (user != null) {
                Cart cart = new CartDAO().getCartByUserId(user.getId());
                if (cart != null) {
                    List<CartItem> cartItems
                            = new CartItemDAO().getItemsByCartId(cart.getId());
                    for (CartItem item : cartItems) {
                        cartCount += cartItems.size();
                    }
                }
            }
            request.setAttribute("cartCount", cartCount);
            request.getRequestDispatcher("lienhe.jsp").forward(request, response);

            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet lienhe</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet lienhe at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(lienhe.class.getName()).log(Level.SEVERE, null, ex);
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
