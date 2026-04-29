package DAO;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Cart;
import model.dbConnect;

public class CartDAO {

    Connection con = null;
    PreparedStatement ps = null;

    public Cart getCartByUserId(int userId) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        Cart cart = null;
        String sql = "SELECT * FROM carts WHERE user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            cart = new Cart(rs.getInt("id"), rs.getInt("user_id"));
        }
        return cart;
    }

    public Cart createCart(int userId) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "INSERT INTO carts(user_id) VALUES(?)";
        ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, userId);
        ps.executeUpdate();
        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            int cartId = rs.getInt(1);
            return new Cart(cartId, userId);
        }
        return null;
    }

    public int getCartIdByUserId(int userId) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "SELECT id FROM carts WHERE user_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("id");
        }
        return -1;
    }
}
