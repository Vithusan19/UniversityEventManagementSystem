package app.classes;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.List;

public class User {
    private int id;
    private String firstname;
    private String lastname;
    private String username;
    private String email;
    private String course;
    private String role;
    private String password;

    public User(String firstname, String lastname, String username, String email,String course, String Userrole, String password) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.email = email;
        this.course = course;
        this.role = Userrole;
        this.password =MD5.getMd5(password);
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
    public String getUsername() {
        return username;
    }
     public String getCourse() {
        return course;
    }
    public String getEmail() {
        return email;
    }
    public void setFirstname(String fname) {
        this.firstname =fname;
    }

    public void setLastname(String lname) {
        this.lastname =lname;
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
    public String getPassword(){
        return this.password;
    }
      public void setPassword(String pass){
         this.password=pass;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = MD5.getMd5(password);
    }

    public Boolean AddStudent(Connection con) throws SQLException {
    String checkQuery = "SELECT COUNT(*) FROM user WHERE username = ?";
    try (PreparedStatement checkPstmt = con.prepareStatement(checkQuery)) {
        checkPstmt.setString(1, this.username);
        ResultSet rs = checkPstmt.executeQuery();
        if (rs.next() && rs.getInt(1) > 0) {
            // User already exists
            return false;
        }
    } catch (SQLException ex) {
        Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        return false;
    }

    String query = "INSERT INTO user(firstname, lastname, username, email,course, userrole, password) VALUES(?,?,?,?,?,?,?)";
    try (PreparedStatement pstmt = con.prepareStatement(query)) {
        pstmt.setString(1, this.firstname);
        pstmt.setString(2, this.lastname);
        pstmt.setString(3, this.username);
        pstmt.setString(4, this.email);
        pstmt.setString(5, this.course);
        pstmt.setString(6, this.role);
        pstmt.setString(7,this.password);
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
                    this.firstname = user.getString("firstname");
                    this.id=user.getInt("id");
                    this.lastname = user.getString("lastname");

                    return true;
                }
            }
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

  public static List<User> DisplayUserbyID(Connection con, String username) {
    List<User> userList = new ArrayList<>();
    String query = "SELECT * FROM user WHERE username = ?";
    try (PreparedStatement pstmt = con.prepareStatement(query)) {
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            User user = new User(
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("course"), // Correct order
                    rs.getString("userrole"), // Correct order
                    rs.getString("password")
            );
            user.setId(rs.getInt("id"));
            userList.add(user);
        }
    } catch (SQLException ex) {
        Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
    }
    return userList;
}


     public static boolean deleteUserById(Connection con, int userId) {
        String query = "DELETE FROM user WHERE id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public Boolean updateUser(Connection con) throws SQLException {
        String query = "UPDATE user SET firstname = ?, lastname = ?, username = ?, email = ?,course=?, userrole = ?, password = ? WHERE id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, this.firstname);
            pstmt.setString(2, this.lastname);
            pstmt.setString(3, this.username);
            pstmt.setString(4, this.email);
            pstmt.setString(5, this.course);
            pstmt.setString(6, this.role);
            pstmt.setString(7, this.password);
            pstmt.setInt(8, this.id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
      public static List<User> getAllStudents(Connection con) {
    List<User> studentList = new ArrayList<>();
    String query = "SELECT * FROM user WHERE userrole = 'student'";
    try (PreparedStatement pstmt = con.prepareStatement(query)) {
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            User student = new User(
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("course"),
                    rs.getString("userrole"),
                    rs.getString("password")
            );
            student.setId(rs.getInt("id"));
            studentList.add(student);
        }
    } catch (SQLException ex) {
        Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
    }
    return studentList;
}
      public Boolean changePassword (Connection con,String newpassword,String oldpassword,String username) throws SQLException{
        try  {
            String query = "SELECT * FROM user WHERE username = ?";
       PreparedStatement pstmt = con.prepareStatement(query);
           pstmt.setString(1,username);
           ResultSet user = pstmt.executeQuery();
           if (user.next()) {
               String db_pass = user.getString("password");
               if (db_pass.equals(MD5.getMd5(oldpassword))) 
               {
                String query1="UPDATE user SET password=? WHERE username=?";
                PreparedStatement pstmt1 = con.prepareStatement(query1);
                pstmt1.setString(1,MD5.getMd5(newpassword));
                pstmt1.setString(2, username);
                return pstmt1.executeUpdate() > 0;

               }
               else
               {
                return false;
              
               }
           }
           else
           {
            return false;
           }
          
       } catch (SQLException ex) {
           Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
           return false;
       }
    }
}