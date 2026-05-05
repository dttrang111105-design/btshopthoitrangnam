

package DAO;
import java.sql.*;
import model.Contact;
import model.dbConnect;

public class ContactDAO {
    Connection con = null;
    PreparedStatement ps = null;
    
    public boolean Add(Contact contact) throws SQLException{
        if(con == null) con = new dbConnect().getConnect();
        String sql = "INSERT INTO contacts(username, msg) VALUES (?, ?)";
        ps = con.prepareStatement(sql);
        
        ps.setString(1, contact.getName());
        ps.setString(2, contact.getMsg());
        
        return ps.executeUpdate() > 0;
    }
}
