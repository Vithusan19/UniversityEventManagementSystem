
package app.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DbConnector {
    final static String URL = "jdbc:mysql://localhost:3308/UEMS";
    final static String USER = "root"; //your username
    final static String PASSWORD = ""; // your password
    final static String DRIVER = "com.mysql.jdbc.Driver";
//    mac
   // final static String DRIVER ="com.mysql.cj.jdbc.Driver";
    
    public static Connection getConnection(){
    Connection con = null;
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DbConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    return con;
    }
}
