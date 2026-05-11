package controller;
 
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class chatbox extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        // Đặt encoding trước khi đọc tham số
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");
 
        String message = request.getParameter("message");
        String reply;
 
        if (message == null || message.trim().isEmpty()) {
            reply = "Bạn chưa nhập nội dung.";
        } else if (message.toLowerCase().contains("xin chào")
                || message.toLowerCase().contains("hello")
                || message.toLowerCase().contains("hi")) {
            reply = "Xin chào bạn 👋 Tôi có thể giúp gì cho bạn?";
        } else if (message.toLowerCase().contains("áo")) {
            reply = "Shop có áo polo, áo sơ mi và áo khoác. Bạn muốn xem loại nào?";
        } else if (message.toLowerCase().contains("giá")) {
            reply = "Giá sản phẩm dao động từ 150.000đ đến 500.000đ. Bạn muốn xem chi tiết sản phẩm nào?";
        } else if (message.toLowerCase().contains("địa chỉ")
                || message.toLowerCase().contains("địa chi")) {
            reply = "Shop NTN tại 123 Đường ABC, Quận 1, TP.HCM. Mở cửa 8h - 22h mỗi ngày.";
        } else if (message.toLowerCase().contains("cảm ơn")
                || message.toLowerCase().contains("thanks")) {
            reply = "Không có gì 😊 NTN SHOP luôn sẵn sàng phục vụ bạn!";
        } else {
            reply = "Cảm ơn bạn đã liên hệ NTN SHOP ❤️ Bạn có thể hỏi về sản phẩm, giá cả hoặc địa chỉ shop.";
        }
 
        // Chỉ ghi reply, KHÔNG ghi thêm HTML
        PrintWriter out = response.getWriter();
        out.write(reply);
        out.flush();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 
    @Override
    public String getServletInfo() {
        return "Chatbox Servlet";
    }
}