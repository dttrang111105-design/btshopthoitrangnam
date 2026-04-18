
package model;
import java.sql.*;


public class dbConnect {
    public static Connection getConnect(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/dbshopthoitrangnam";
            return DriverManager.getConnection(url, "root", "");
        } catch (Exception e) {
            return null;
        }
    }
    
    public static void main(String[] args) {
        if(dbConnect.getConnect() != null) System.out.println("tc");
        else System.out.println("tb");
    }
}
