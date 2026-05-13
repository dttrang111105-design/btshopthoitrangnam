package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.dbConnect;

public class CartItemDAO {

    Connection con = null;
    PreparedStatement ps = null;

    public CartItem getItem(int cartId, int productId) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "SELECT * FROM cart_item WHERE cart_id = ? AND product_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, cartId);
        ps.setInt(2, productId);
        ResultSet rs = ps.executeQuery();
        ps = con.prepareStatement(sql);
        ps.setInt(1, cartId);
        ps.setInt(2, productId);
        if (rs.next()) {
            return new CartItem(
                    rs.getInt("id"),
                    rs.getInt("cart_id"),
                    rs.getInt("product_id"),
                    rs.getInt("quantity")
            );
        }
        return null;
    }

    public boolean Add(int cartId, int productId, int quantity) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "INSERT INTO cart_item(cart_id, product_id, quantity) VALUES(?,?,?)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, cartId);
        ps.setInt(2, productId);
        ps.setInt(3, quantity);
        return ps.executeUpdate() > 0;
    }

    public boolean UpdateQuantity(int id, int quantity) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "UPDATE cart_item SET quantity = ? WHERE id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, quantity);
        ps.setInt(2, id);
        return ps.executeUpdate() > 0;
    }

    public List<CartItem> getItemsByCartId(int cartId) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        List<CartItem> list = new ArrayList<>();
        String sql = "SELECT * FROM cart_item WHERE cart_id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, cartId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new CartItem(
                    rs.getInt("id"),
                    rs.getInt("cart_id"),
                    rs.getInt("product_id"),
                    rs.getInt("quantity")
            ));
        }
        return list;
    }

    public boolean Delete(int id) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "DELETE FROM cart_item WHERE id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        return ps.executeUpdate() > 0;

    }

    public void clearCart(int cartId) throws SQLException {
        if (con == null) {
            con = dbConnect.getConnect();
        }
        String sql = "DELETE FROM cart_item WHERE cart_id = ?";

        ps = con.prepareStatement(sql);

        ps.setInt(1, cartId);

        ps.executeUpdate();
    }
}
