//package app.classes;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.*;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//public class User {
//    private int id;
//    private String firstname;
//    private String lastname;
//    private String username;
//    private String email;
//   
//    private String role;
//    private String password;
//
//    public User(String firstname, String lastname, String username,String email ,String Userrole, String password) {
//      
//        this.firstname = firstname;
//        this.lastname = lastname;
//        this.username = username;
//        this.email = email;
//       
//        this.role = Userrole;
//        this.password = password;
//    }
//
//    public int getId() {
//        return id;
//    }
//
//    public String getFirstname() {
//        return firstname;
//    }
//
//    public String getLastname() {
//        return lastname;
//    }
//
//   public String getRole() {
//    return role;
//}
//
//public void setRole(String role) {
//    this.role = role;
//}
//
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public User(String username, String password) {
//        this.username = username;
//        this.password = MD5.getMd5(password);
//    }
//    public Boolean Addstudent(Connection con) throws SQLException{
//         String query="INSERT INTO user(firstname,lastname,username,userrole,password) VALUES(?,?,?,?,?,?)";
//            PreparedStatement pstmt=con.prepareStatement(query);
//        try {
//           
//            pstmt.setString(1,this.firstname);
//            pstmt.setString(2,this.lastname);
//            pstmt.setString(3,this.username);
//            pstmt.setString(4,this.email);
//            pstmt.setString(5,this.role);
//            pstmt.setString(6,this.password);
//              return pstmt.executeUpdate()>0;
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
//              return false;
//        }
//      
//    }
//    public Boolean Login(Connection con) throws SQLException {
//    try {
//        String query = "SELECT * FROM user WHERE username = ?";
//        PreparedStatement pstmt = con.prepareStatement(query);
//        pstmt.setString(1, this.username);
//        ResultSet user = pstmt.executeQuery();
//        if (user.next()) {
//            String db_pass = user.getString("password");
//            if (db_pass.equals(this.password)) {
//                this.role = user.getString("userrole");
//                return true;
//            } else {
//                return false;
//            }
//        } else {
//            return false;
//        }
//    } catch (SQLException ex) {
//        Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
//        return false;
//    }
//}
//
//    
//
//}
package app.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User {
    private int id;
    private String firstname;
    private String lastname;
    private String username;
    private String email;
    private String role;
    private String password;

    public User(String firstname, String lastname, String username, String email, String Userrole, String password) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.email = email;
        this.role = Userrole;
        this.password = MD5.getMd5(password);
    }

    public int getId() {
        return id;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = MD5.getMd5(password);
    }

    public Boolean AddStudent(Connection con) throws SQLException {
        String query = "INSERT INTO user(firstname, lastname, username, email, userrole, password) VALUES(?,?,?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        try  {
            pstmt.setString(1, this.firstname);
            pstmt.setString(2, this.lastname);
            pstmt.setString(3, this.username);
            pstmt.setString(4, this.email);
            pstmt.setString(5, this.role);
            pstmt.setString(6, this.password);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public Boolean login(Connection con) throws SQLException {
       
        try  {
             String query = "SELECT * FROM user WHERE username = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.username);
            ResultSet user = pstmt.executeQuery();
            if (user.next()) {
                String db_pass = user.getString("password");
                if (db_pass.equals(this.password)) {
                    this.role = user.getString("userrole");
                    return true;
                }
            }
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public static User DisplayUser(Connection con, int userId) throws SQLException {
        String query = "SELECT * FROM user WHERE id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            ResultSet user = pstmt.executeQuery();
            if (user.next()) {
                User u = new User(
                        user.getString("firstname"),
                        user.getString("lastname"),
                        user.getString("username"),
                        user.getString("email"),
                        user.getString("userrole"),
                        user.getString("password")
                );
                u.setId(user.getInt("id"));
                return u;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Boolean deleteUser(Connection con) throws SQLException {
        String query = "DELETE FROM user WHERE id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, this.id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public Boolean updateUser(Connection con) throws SQLException {
        String query = "UPDATE user SET firstname = ?, lastname = ?, username = ?, email = ?, userrole = ?, password = ? WHERE id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, this.firstname);
            pstmt.setString(2, this.lastname);
            pstmt.setString(3, this.username);
            pstmt.setString(4, this.email);
            pstmt.setString(5, this.role);
            pstmt.setString(6, this.password);
            pstmt.setInt(7, this.id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}