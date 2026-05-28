package controller;

import DAO.OrderDAO;
import DAO.OrderDetailDAO;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;

import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrderDetail;
import model.Orders;

public class xuathoadon extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int orderId = Integer.parseInt(request.getParameter("id"));
            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO detailDAO = new OrderDetailDAO();
            Orders order = orderDAO.getOrderById(orderId);
            List<OrderDetail> details = detailDAO.getByOrderId(orderId);
            response.setContentType("application/pdf");
            response.setHeader( "Content-Disposition", "inline; filename=hoadon_" + orderId + ".pdf" );
            Document document = new Document();
            PdfWriter.getInstance( document, response.getOutputStream() );
            document.open();
            Font titleFont = FontFactory.getFont( FontFactory.HELVETICA_BOLD, 22 );
            Font normalFont = FontFactory.getFont( FontFactory.HELVETICA, 14 );
            // TITLE
            Paragraph title = new Paragraph( "HOA DON MUA HANG", titleFont );
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph(" "));
            document.add(new Paragraph( "Ma don hang: #" + order.getId(), normalFont ));
            document.add(new Paragraph( "Ngay dat: " + order.getOrderDate(), normalFont ));
            document.add(new Paragraph(" "));
            // TABLE
            PdfPTable table = new PdfPTable(4);

            table.setWidthPercentage(100);
            table.addCell("San pham");
            table.addCell("So luong");
            table.addCell("Don gia");
            table.addCell("Thanh tien");

            double total = 0;
            for (OrderDetail od : details) {
                double sub = od.getPrice() * od.getQuantity();
                total += sub;
                table.addCell(od.getProductName());
                table.addCell( String.valueOf(od.getQuantity()) );
                table.addCell( String.format("%,.0f VNĐ", od.getPrice()) );
                table.addCell( String.format("%,.0f VNĐ", sub) );
            }

            document.add(table);
            document.add(new Paragraph(" "));
            double vat = total * 0.08;
            double totalVat = total + vat;
            Paragraph p1 = new Paragraph( "Tam tinh: " + String.format("%,.0f VNĐ", total), normalFont );
            Paragraph p2 = new Paragraph( "VAT (8%): " + String.format("%,.0f VNĐ", vat), normalFont );
            Paragraph p3 = new Paragraph( "Tong thanh toan: " + String.format("%,.0f VNĐ", totalVat), titleFont );
            document.add(p1);
            document.add(p2);
            document.add(p3);
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}