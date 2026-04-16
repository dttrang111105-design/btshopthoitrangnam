

package DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.User;
import model.dbConnect;

public class UserDAO {
    Connection con = null;
    PreparedStatement ps = null;
    
    public List<User> getAll() throws SQLException{
        if(con == null) con = dbConnect.getConnect();
        String sql = "Select * from user";
        ps = con.prepareCall(sql);
        List<User> uList = new ArrayList<>();
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            User u = new User();
            u.setId(rs.getInt(1));
            u.setUserName(rs.getString(2));
            u.setPassWord(rs.getString(3));
            u.setEmail(rs.getString(4));
            u.setPhone(rs.getInt(5));
            u.setAddress(rs.getString(6));
            uList.add(u);
        }
        return uList;
    }
    
    public User getById(int id) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Select * from user where id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            User u = new User();
            u.setId(rs.getInt(1));
            u.setUserName(rs.getString(2));
            u.setPassWord(rs.getString(3));
            u.setEmail(rs.getString(4));
            u.setPhone(rs.getInt(5));
            u.setAddress(rs.getString(6));
            return u;
        }
        return null;
    }
    
    public boolean Add(User u) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Insert into user(username, password, email, phone, address) values(?, ?, ?, ?, ?)";
        ps = con.prepareStatement(sql);
        
        ps.setString(1, u.getUserName());
        ps.setString(2, u.getPassWord());
        ps.setString(3, u.getEmail());
        ps.setInt(4, u.getPhone());
        ps.setString(5, u.getAddress());
        
        return ps.executeUpdate() > 0;
    }
    
    public boolean Update(User u) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Update user set username = ?, password = ?, email = ?, phone = ?, address = ? where id = ?";
        ps = con.prepareStatement(sql);
        
        ps.setInt(6, u.getId());
        ps.setString(1, u.getUserName());
        ps.setString(2, u.getPassWord());
        ps.setString(3, u.getEmail());
        ps.setInt(4, u.getPhone());
        ps.setString(5, u.getAddress());
        
        return ps.executeUpdate() > 0;
    }
    
    public boolean Delete(int id) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Delete from user where id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        
        return ps.executeUpdate() > 0;
    }
    
    public boolean checkExist(String user, String email) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "Select * from user where username=? or email=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, user);
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    }
}
