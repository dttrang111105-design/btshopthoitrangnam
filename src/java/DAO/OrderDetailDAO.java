/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
        if(con == null) con = dbConnect.getConnect();
        String sql = "INSERT INTO order_detail" + "(order_id,product_id,quantity,price)" + " VALUES(?,?,?,?)";
        ps = con.prepareStatement(sql);

        ps.setInt(1, od.getOrderId());
        ps.setInt(2, od.getProductId());
        ps.setInt(3, od.getQuantity());
        ps.setDouble(4, od.getPrice());

        ps.executeUpdate();
    }
}
