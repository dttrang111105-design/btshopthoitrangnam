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
import model.ThongKe;
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

    public List<Orders> search(String keyword) throws SQLException {
        if (con == null) {
            con = new dbConnect().getConnect();
        }

        String sql = "SELECT * FROM orders " + "WHERE CAST(id AS CHAR) LIKE ? " + "OR CAST(user_id AS CHAR) LIKE ? " + "ORDER BY id DESC";
        ps = con.prepareStatement(sql);
        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");
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

    public List<Orders> getOrdersByUser(int userId) throws SQLException {
        List<Orders> list = new ArrayList<>();
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC";
        ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
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

    public List<ThongKe> getRevenueByDay() {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        List<ThongKe> list = new ArrayList<>();
        String sql = "SELECT DATE(order_date) ngay, " + "SUM(total_money) doanhthu "
                + "FROM orders " + "GROUP BY DATE(order_date) " + "ORDER BY ngay DESC";
        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ThongKe(rs.getString("ngay"), rs.getDouble("doanhthu")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ThongKe> getRevenueByWeek() {
        List<ThongKe> list = new ArrayList<>();
        String sql = "SELECT " + "WEEK(order_date) AS tuan, " + "YEAR(order_date) AS nam, "
                + "SUM(total_money) AS doanhthu " + "FROM orders "
                + "GROUP BY YEAR(order_date), WEEK(order_date) " + "ORDER BY nam DESC, tuan DESC";

        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String label = "Tuần " + rs.getInt("tuan") + " - " + rs.getInt("nam");
                ThongKe r = new ThongKe(label, rs.getDouble("doanhthu"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ThongKe> getRevenueByMonth() {
        List<ThongKe> list = new ArrayList<>();
        String sql = "SELECT "
                + "MONTH(order_date) AS thang, " + "YEAR(order_date) AS nam, " + "SUM(total_money) AS doanhthu "
                + "FROM orders " + "GROUP BY YEAR(order_date), MONTH(order_date) " + "ORDER BY nam DESC, thang DESC";

        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String label = "Tháng " + rs.getInt("thang") + "/" + rs.getInt("nam");
                ThongKe r = new ThongKe(label, rs.getDouble("doanhthu"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public double getTotalRevenue() throws SQLException {

        if (con == null) {
            con = new dbConnect().getConnect();
        }
        String sql
                = "SELECT IFNULL(SUM(total_money),0) FROM orders";

        PreparedStatement ps
                = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getDouble(1);
        }

        return 0;
    }

    public int getTotalOrders() throws SQLException {

        if (con == null) {
            con = new dbConnect().getConnect();
        }
        String sql
                = "SELECT COUNT(*) FROM orders";

        PreparedStatement ps
                = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt(1);
        }

        return 0;
    }

    public int getTotalProductsSold() throws SQLException {

        if (con == null) {
            con = new dbConnect().getConnect();
        }
        String sql
                = "SELECT IFNULL(SUM(quantity),0) FROM order_detail";

        PreparedStatement ps
                = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt(1);
        }

        return 0;
    }
}
