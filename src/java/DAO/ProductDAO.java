

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
        List<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product p = new Product();
            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setPrice(rs.getDouble(3));
            p.setImage(rs.getString(4));
            p.setDesc(rs.getString(5));
            p.setCategory(rs.getString(6));
            list.add(p);
        }
        return list;
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
            pList.add(p);
        }
        return pList;
    }
    
    public boolean Add(Product p) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Insert into product(name, price, image, descr, category) values(?, ?, ?, ?, ?)";
        ps = con.prepareStatement(sql);
        
        ps.setString(1, p.getName());
        ps.setDouble(2, p.getPrice());
        ps.setString(3, p.getImage());
        ps.setString(4, p.getDesc());
        ps.setString(5, p.getCategory());
        
        return ps.executeUpdate() > 0;
    }
    
    public boolean Update(Product p) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Update product set name = ?, price = ?, image = ?, descr = ?, category = ? where id = ?";
        ps = con.prepareStatement(sql);
        
        ps.setInt(6, p.getId());
        ps.setString(1, p.getName());
        ps.setDouble(2, p.getPrice());
        ps.setString(3, p.getImage());
        ps.setString(4, p.getDesc());
        ps.setString(5, p.getCategory());
        
        return ps.executeUpdate() > 0;
    }
    
    public boolean Delete(int id) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Delete from product where id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        
        return ps.executeUpdate() > 0;
    }
    
    
}
