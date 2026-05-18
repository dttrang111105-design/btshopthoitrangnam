/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.dbConnect;

/**
 *
 * @author ADMIN
 */
public class OrderDetailDAO {

    Connection con = null;
    PreparedStatement ps = null;

    public void addOrderDetail(OrderDetail od) throws Exception {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "INSERT INTO order_detail" + "(order_id,product_id,quantity,price)" + " VALUES(?,?,?,?)";
        ps = con.prepareStatement(sql);

        ps.setInt(1, od.getOrderId());
        ps.setInt(2, od.getProductId());
        ps.setInt(3, od.getQuantity());
        ps.setDouble(4, od.getPrice());

        ps.executeUpdate();
    }

    public List<OrderDetail> getByOrderId(int orderId) throws SQLException {

        List<OrderDetail> list = new ArrayList<>();
        if (con == null) {
            con = dbConnect.getConnect();
        }

        String sql = """
            SELECT od.*, p.name, p.image
            FROM order_detail od
            JOIN product p ON od.product_id = p.id
            WHERE od.order_id = ?
        """;

        ps = con.prepareStatement(sql);
        ps.setInt(1, orderId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            OrderDetail od = new OrderDetail();
            od.setId(rs.getInt("id"));
            od.setOrderId(rs.getInt("order_id"));
            od.setProductId(rs.getInt("product_id"));
            od.setQuantity(rs.getInt("quantity"));
            od.setPrice(rs.getDouble("price"));
            od.setProductName(rs.getString("name"));
            od.setImage(rs.getString("image"));
            list.add(od);
        }

        return list;
    }
}
