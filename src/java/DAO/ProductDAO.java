

package DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.dbConnect;

public class ProductDAO {
    Connection con = null;
    PreparedStatement ps = null;
    
    public List<Product> getAll() throws SQLException{
        if(con == null) con = dbConnect.getConnect();
        String sql = "Select * from product";
        ps = con.prepareStatement(sql);
        List<Product> pList = new ArrayList<>();
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Product p = new Product();
            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setPrice(rs.getDouble(3));
            p.setImage(rs.getString(4));
            p.setDesc(rs.getString(5));
            p.setCategory(rs.getString(6));
            p.setType(rs.getString(7));
            p.setStock(rs.getInt(8));
            pList.add(p);
        }
        return pList;
    }
    
    public List<Product> getByName(String ten) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Select * from product where name like ?";        
        ps = con.prepareStatement(sql);
        ps.setString(1, "%" + ten + "%");
        ResultSet rs = ps.executeQuery();
        List<Product> pList = new ArrayList<>();
        while (rs.next()) {
            Product p = new Product();
            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setPrice(rs.getDouble(3));
            p.setImage(rs.getString(4));
            p.setDesc(rs.getString(5));
            p.setCategory(rs.getString(6));
            p.setType(rs.getString(7));
            p.setStock(rs.getInt(8));
            pList.add(p);
        }
        return pList;
    }
    
    public List<Product> getByType(String type) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Select * from product where type = ?";
        ps = con.prepareStatement(sql);
        List<Product> pList = new ArrayList<>();
        ps.setString(1, type);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Product p = new Product();
            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setPrice(rs.getDouble(3));
            p.setImage(rs.getString(4));
            p.setDesc(rs.getString(5));
            p.setCategory(rs.getString(6));
            p.setType(rs.getString(7));
            p.setStock(rs.getInt(8));
            pList.add(p);
        }
        return pList;
    }
    
    public boolean Add(Product p) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Insert into product(name, price, image, descr, category, type, stock) values(?,?,?,?,?,?,?)";
        ps = con.prepareStatement(sql);
        
        ps.setString(1, p.getName());
        ps.setDouble(2, p.getPrice());
        ps.setString(3, p.getImage());
        ps.setString(4, p.getDesc());
        ps.setString(5, p.getCategory());
        ps.setString(6, p.getType());
        ps.setInt(7, p.getStock());
        return ps.executeUpdate() > 0;
    }
    
    public boolean Update(Product p) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Update product set name=?, price=?, image=?, descr=?, category=?, type=?, stock=? where id=?";
        ps = con.prepareStatement(sql);

        ps.setString(1, p.getName());
        ps.setDouble(2, p.getPrice());
        ps.setString(3, p.getImage());
        ps.setString(4, p.getDesc());
        ps.setString(5, p.getCategory());
        ps.setString(6, p.getType());
        ps.setInt(7, p.getStock());
        ps.setInt(8, p.getId());
        return ps.executeUpdate() > 0;
    }
    
    public boolean Delete(int id) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Delete from product where id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        
        return ps.executeUpdate() > 0;
    }

    public Product getByID(int id) throws SQLException {
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Select * from product where id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Product p = new Product();
            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setPrice(rs.getDouble(3));
            p.setImage(rs.getString(4));
            p.setDesc(rs.getString(5));
            p.setCategory(rs.getString(6));
            p.setType(rs.getString(7));
            p.setStock(rs.getInt(8));
            return p;
        }
        return null;
    }
    public List<Product> getByCategory(String category) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Select * from product where category = ?";
        ps = con.prepareStatement(sql);
        List<Product> pList = new ArrayList<>();
        ps.setString(1, category);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Product p = new Product();
            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setPrice(rs.getDouble(3));
            p.setImage(rs.getString(4));
            p.setDesc(rs.getString(5));
            p.setCategory(rs.getString(6));
            p.setType(rs.getString(7));
            p.setStock(rs.getInt(8));
            pList.add(p);
        }
        return pList;
    }
    public void updateStock(int id, int stock) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Update product set stock=? where id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, stock);
        ps.setInt(2, id);
        ps.executeUpdate();
    }
}
