<%@page import="app.classes.User"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Event"%>
<%@page session="true" %>
<% 
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");

    Connection con = null;
    List<User> students = null;
    try {
        con = DbConnector.getConnection();
        students = User.getAllStudents(con);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Users</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../CSS/admin.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 6rem">
        <h3>Logo</h3>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="adminDashboard.jsp">Events</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="displayuserpage.jsp">User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contactmessage.jsp">Contact</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="../Images/user.png" class="rounded-circle" alt="User Icon">
                    </a>
                    <div class="dropdown-menu" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Edit Profile</a>
                        <a class="dropdown-item" href="logout.jsp">Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <h2>All Users</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Course</th>
                      
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (students != null) {
                        for (User user : students) { %>
                            <tr>
                                <td><%= user.getId() %></td>
                                <td><%= user.getFirstname() %></td>
                                <td><%= user.getLastname() %></td>
                                <td><%= user.getUsername() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getCourse()%></td>
                             
                                <td>
                                    <a href="editUser.jsp?id=<%= user.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                                    <a href="deleteuser.jsp?id=<%= user.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
                                </td>
                            </tr>
                        <% }
                    } else { %>
                        <tr>
                            <td colspan="6">No students found</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addStudentModal">Add Student</button>
    </div>

    <!-- Add Student Modal -->
    <div class="modal fade" id="addStudentModal" tabindex="-1" aria-labelledby="addStudentModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addStudentModalLabel">Add Student</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="Addstudent.jsp" method="post">
    <label for="firstname">First Name:</label>
    <input type="text" id="firstname" name="firstname" class="form-control" required>
    
    <label for="lastname">Last Name:</label>
    <input type="text" id="lastname" name="lastname" class="form-control" required>
    
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" class="form-control" required>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" class="form-control" required>
    
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" class="form-control" required><br>
    
    <label for="course">Course:</label>
    <select id="course" name="course" class="form-control" required>
        <option value="CST">CST</option>
        <option value="SCT">SCT</option>
        <option value="MRT">MRT </option>
        <option value="IIT">IIT </option>
        <option value="ANS">ANS </option>
        <option value="EAG">EAG </option>
        <option value="TEA">TEA </option>
        <option value="PLT">PLT </option>
        <option value="AQT">AQT </option>
        <option value="BBST">BBST</option>
    </select><br>
    
    <input type="submit" value="Add Student" class="btn btn-primary">
</form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            var status = "<%= request.getParameter("s") %>";
            if (status === "1") {
                alert("Student added successfully!");
            } else if (status === "0") {
                alert("Failed to add Student. Please try again.");
            }
        });
         $(document).ready(function() {
            var status = "<%= request.getParameter("deletestatus") %>";
            if (status === "1") {
                alert("Student deleted successfully!");
            } else if (status === "0") {
                alert("Failed to delete Student. Please try again.");
            }
        });
    </script>
</body>
</html>
