/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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
public class googlecallback extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try {

            String code = request.getParameter("code");

            // ================= TOKEN =================
            String clientId = "key";

            String clientSecret = "key";

            String redirectUri = "http://localhost:9090/BTLShopThoiTrangNam/googlecallback";

            String params
                    = "code=" + URLEncoder.encode(code, "UTF-8")
                    + "&client_id=" + URLEncoder.encode(clientId, "UTF-8")
                    + "&client_secret=" + URLEncoder.encode(clientSecret, "UTF-8")
                    + "&redirect_uri=" + URLEncoder.encode(redirectUri, "UTF-8")
                    + "&grant_type=authorization_code";

            URL url = new URL( "https://oauth2.googleapis.com/token" );

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");

            conn.setDoOutput(true);

            conn.setRequestProperty( "Content-Type", "application/x-www-form-urlencoded" );

            OutputStream os = conn.getOutputStream();
            os.write(params.getBytes());

            os.flush();

            os.close();

            BufferedReader br = new BufferedReader( new InputStreamReader( conn.getInputStream() ) );
            String line;
            StringBuilder sb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            JsonObject tokenJson = JsonParser.parseString( sb.toString() ).getAsJsonObject();

            String accessToken = tokenJson.get("access_token") .getAsString();

            URL userUrl = new URL( "https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken );

            HttpURLConnection userConn = (HttpURLConnection) userUrl.openConnection();

            userConn.setRequestMethod("GET");

            BufferedReader userBr = new BufferedReader( new InputStreamReader( userConn.getInputStream() ) );
            StringBuilder userSb = new StringBuilder();
            while ((line = userBr.readLine()) != null) {
                userSb.append(line);
            }

            userBr.close();

            JsonObject userJson = JsonParser.parseString( userSb.toString() ).getAsJsonObject();
            String email = userJson.get("email").getAsString();
            String name = userJson.get("name").getAsString();

            UserDAO dao = new UserDAO();
            User user = dao.getByEmail(email);
            // chưa có user
            if (user == null) {
                User newUser = new User();
                newUser.setUserName(name);
                newUser.setEmail(email);
                dao.insertGoogleUser(newUser);
                user = dao.getByEmail(email);
            }

            HttpSession session = request.getSession();
            session.setAttribute( "user", user );
            response.sendRedirect( "trangchu" );
        } catch (Exception e) {
            e.printStackTrace();
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet googlecallback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet googlecallback at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
