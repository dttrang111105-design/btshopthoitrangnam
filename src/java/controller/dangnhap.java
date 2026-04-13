/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ADMIN
 */
public class dangnhap extends HttpServlet {

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
            String userInput = request.getParameter("user");
            String passInput = request.getParameter("pass");
            UserDAO dao = new UserDAO();
            try {
                List<User> list = dao.getAll();
                boolean found = false;
                User userLogin = null;
                for (User u : list) {
                    // check username/email/sdt + password
                    if ((u.getUserName().equals(userInput)|| u.getEmail().equals(userInput)|| String.valueOf(u.getPhone()).equals(userInput))&& u.getPassWord().equals(passInput)) {
                        found = true;
                        userLogin = u;
                        break;
                    }
                }
                if (found) {
                    // tạo session đăng nhập
                    HttpSession session = request.getSession();
                    session.setAttribute("user", userLogin);
                    // về trang chủ
                    response.sendRedirect("trangchu.jsp");
                } else {
                    // sai login
                    response.sendRedirect("dangnhap.jsp?error=1");
                }             
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("dangnhap.jsp?error=db");
            }
        } catch (Exception e) {
        }
        
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet dangnhap</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet dangnhap at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
