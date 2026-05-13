/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Orders;
import model.dbConnect;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {

    Connection con = null;
    PreparedStatement ps = null;

    public int addOrders(Orders o) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "INSERT INTO orders(user_id,total_money,order_date) " + "VALUES(?,?,NOW())";
        ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, o.getUserId());
        ps.setDouble(2, o.getTotalMoney());
        ps.executeUpdate();
        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public List<Orders> getAll() throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "Select * from orders order by id DESC";
        ps = con.prepareStatement(sql);
        List<Orders> list = new ArrayList<>();
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Orders o = new Orders();
            o.setId(rs.getInt("id"));
            o.setUserId(rs.getInt("user_id"));
            o.setTotalMoney(rs.getDouble("total_money"));
            o.setOrderDate(rs.getTimestamp("order_date"));
            list.add(o);
        }
        return list;
    }

    public Orders getOrderById(int id) throws SQLException {
        if (con == null) {
            con = new dbConnect().getConnect();
        }

        String sql = "SELECT * FROM orders WHERE id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Orders o = new Orders();
            o.setId(rs.getInt(1));
            o.setUserId(rs.getInt(2));
            o.setTotalMoney(rs.getDouble(3));
            o.setOrderDate(rs.getTimestamp(4));
            return o;
        }
        return null;
    }

    public void updateTotal(Orders order) throws SQLException {
        if (con == null) {
            con = new dbConnect().getConnect();
        }
        String sql = "UPDATE orders SET total_money = ? WHERE id = ?";

        ps = con.prepareStatement(sql);

        ps.setDouble(1, order.getTotalMoney());
        ps.setInt(2, order.getId());
        ps.executeUpdate();
    }
}
