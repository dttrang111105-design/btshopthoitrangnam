package controller;

import DAO.ProductDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

@WebServlet("/chat")
public class chatbox extends HttpServlet {

    private static final String API_KEY = "key";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String message = request.getParameter("message");
        ProductDAO dao = new ProductDAO();

        String productInfo = "";
        try {
            List<Product> products = dao.getByName(message);
            if (!products.isEmpty()) {
                productInfo += "Danh sách sản phẩm liên quan:\n";
                for (Product p : products) {
                    productInfo += "Tên: " + p.getName() + ", Giá: " + p.getPrice() + ", Kho: " + p.getStock() + "\n";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (message == null || message.trim().isEmpty()) {
            response.getWriter().write("Vui lòng nhập tin nhắn.");
            return;
        }

        // Escape ký tự đặc biệt để JSON không bị lỗi
        String safeMessage = message
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");

        String apiUrl = "https://api.groq.com/openai/v1/chat/completions";
        String fullPrompt = productInfo + "\nKhách hỏi: " + message;
        String safePrompt = fullPrompt
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");

        String jsonInput = "{"
                + "\"model\":\"llama-3.3-70b-versatile\","
                + "\"messages\":["
                + "{\"role\":\"system\",\"content\":\""
                + "Bạn là AI hỗ trợ shop thời trang nam. "
                + "Trả lời ngắn gọn, đúng trọng tâm, tối đa 5 dòng. "
                + "Ưu tiên tư vấn nhanh như nhân viên bán hàng chuyên nghiệp. "
                + "Nếu có dữ liệu sản phẩm thì dùng dữ liệu đó để trả lời tự nhiên bằng tiếng Việt. "
                + "Không lan man, không giải thích dài dòng."
                + "\"},"
                + "{\"role\":\"user\",\"content\":\""
                + safePrompt
                + "\"}"
                + "],"
                + "\"max_tokens\":1024"
                + "}";

        try {
            java.net.URL url = new java.net.URL(apiUrl);
            java.net.HttpURLConnection conn = (java.net.HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            conn.setRequestProperty("Authorization", "Bearer " + API_KEY);
            conn.setDoOutput(true);
            conn.setConnectTimeout(10000);
            conn.setReadTimeout(20000);

            OutputStream os = conn.getOutputStream();
            os.write(jsonInput.getBytes("UTF-8"));
            os.flush();
            os.close();

            int statusCode = conn.getResponseCode();

            BufferedReader br;
            if (statusCode == 200) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
                StringBuilder errSb = new StringBuilder();
                String errLine;
                while ((errLine = br.readLine()) != null) {
                    errSb.append(errLine);
                }
                br.close();
                response.getWriter().write("Lỗi API (" + statusCode + "): " + errSb.toString());
                return;
            }

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            String output = parseGroqResponse(sb.toString());
            response.getWriter().write(output);

        } catch (Exception e) {
            response.getWriter().write("Lỗi kết nối: " + e.getMessage());
        }
    }

    private String parseGroqResponse(String json) {
        try {
            int idx = json.indexOf("\"content\":\"");
            if (idx == -1) {
                return "Không có phản hồi từ AI.";
            }

            int start = idx + 11;
            StringBuilder sb = new StringBuilder();
            int i = start;
            while (i < json.length()) {
                char c = json.charAt(i);
                if (c == '\\' && i + 1 < json.length()) {
                    char next = json.charAt(i + 1);
                    switch (next) {
                        case '"':
                            sb.append('"');
                            i += 2;
                            continue;
                        case 'n':
                            sb.append('\n');
                            i += 2;
                            continue;
                        case 'r':
                            sb.append('\r');
                            i += 2;
                            continue;
                        case 't':
                            sb.append('\t');
                            i += 2;
                            continue;
                        case '\\':
                            sb.append('\\');
                            i += 2;
                            continue;
                    }
                }
                if (c == '"') {
                    break;
                }
                sb.append(c);
                i++;
            }
            return sb.toString();
        } catch (Exception e) {
            return "Lỗi xử lý phản hồi: " + e.getMessage();
        }
    }

    /**
     * Parse response JSON từ Gemini API. Tìm "text": "..." một cách an toàn
     * hơn.
     */
    private String parseGeminiResponse(String json) {
        try {
            // Tìm vị trí của "text": trong candidates -> content -> parts
            int textIdx = json.indexOf("\"text\":");
            if (textIdx == -1) {
                return "Không có phản hồi từ AI.";
            }

            // Bỏ qua: "text":
            int start = json.indexOf("\"", textIdx + 7); // mở ngoặc kép đầu
            if (start == -1) {
                return "Lỗi parse response.";
            }
            start++; // sau dấu "

            // Tìm dấu " đóng (bỏ qua \" escaped)
            StringBuilder sb = new StringBuilder();
            int i = start;
            while (i < json.length()) {
                char c = json.charAt(i);
                if (c == '\\' && i + 1 < json.length()) {
                    char next = json.charAt(i + 1);
                    switch (next) {
                        case '"':
                            sb.append('"');
                            i += 2;
                            continue;
                        case 'n':
                            sb.append('\n');
                            i += 2;
                            continue;
                        case 'r':
                            sb.append('\r');
                            i += 2;
                            continue;
                        case 't':
                            sb.append('\t');
                            i += 2;
                            continue;
                        case '\\':
                            sb.append('\\');
                            i += 2;
                            continue;
                    }
                }
                if (c == '"') {
                    break; // kết thúc chuỗi
                }
                sb.append(c);
                i++;
            }
            return sb.toString();
        } catch (Exception e) {
            return "Lỗi xử lý phản hồi: " + e.getMessage();
        }
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
