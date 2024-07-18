<%-- 
    Document   : profile
    Created on : Jul 14, 2024, 3:42:03 PM
    Author     : test
--%>

<%@page import="app.classes.User"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="java.util.List"%>
<%@page session="true" %>
<% 
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");
    String username = (String) session.getAttribute("username");

    Connection con = null;
    User student = null;
    try {
        con = DbConnector.getConnection();
        List<User> users = User.DisplayUserbyID(con, username);
        if (!users.isEmpty()) {
            student = users.get(0);
        }
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
    <title>About Us</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../CSS/Student.css">
    <style>
        .profile-container {
    display: flex;
    align-items: center;
    margin: 20px;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 10px;
    background-color: #f9f9f9;
    max-width: 70vw;
    margin: 60px auto;
    margin-bottom: 120px;
    margin-top: 140px;
}
.profile-image {
    flex: 1;
    text-align: center;
}
.profile-image img {
    border-radius: 50%;
    width: 250px;
    height: 250px;
}
.profile-details {
    flex: 2;
    margin-left: 20px;
}
.profile-details h3 {
    margin-top: 0;
}
.profile-details button {
    margin: 10px 0;
}
#changePasswordForm {
    display: none;
}
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <nav class="navbar">
        <h2>Logo</h2>
        <div class="navbar-links">
            <p class="navbar-link"><a href="student_dashboard.jsp">Events</a></p>
            <p class="navbar-link"><a href="aboutUs.jsp">AboutUs</a></p>
            <p class="navbar-link"><a href="contactUs.jsp">ContactUs</a></p>
            <p><a href="profile.jsp"><img src="../Images/user.png" class="usericon" alt="User Icon"></a></p>
        </div>
        <div class="navbar-menu" onclick="opennav()">
            <i class="fa-solid fa-bars"></i>
        </div>
    </nav>

    <div class="side-nav">
        <p style="text-align: right;" onclick="closenav()">
            <i class="fa-solid fa-xmark"></i>
        </p>
        <div class="sidenavbar-links">
            <p class="sidenavbar-link"><a href="#">Home</a></p>
            <p class="sidenavbar-link"><a href="#">AboutUs</a></p>
            <p class="sidenavbar-link"><a href="#">ContactUs</a></p>
        </div>
    </div>

    <!-- profile -->
    <div class="profile-container">
        <div class="profile-image">
            <img src="../Images/student.jpeg" alt="User Image">
        </div>
        <div class="profile-details">
            <h3>User information</h3>
           
            <% if (student != null) { %>
                <p>User Name: <%= student.getUsername()%></p>
                <p>First Name: <%= student.getFirstname() %></p>
                <p>Last Name: <%= student.getLastname() %></p>
                <p>Email: <%= student.getEmail()%></p>
                <p>Course: <%= student.getCourse()%></p>
            <% } else { %>
                <p>No user information found.</p>
            <% } %>
            
             
            <button class="btn btn-primary" onclick="showChangePassword()">Change Password</button>
            <a href="logout.jsp"><button class="btn btn-danger"><i class="fa-solid fa-right-from-bracket"></i>Logout</button></a>

            <form id="changePasswordForm" action="changepassword.jsp" method="post">
                <div class="form-group">
                    <label for="oldPassword">Old Password:</label>
                    <input type="password" class="form-control" id="oldPassword" name="oldPassword">
                </div>
                <div class="form-group">
                    <label for="newPassword">New Password:</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <button  class="btn btn-secondary" onclick="hideChangePassword()" >cancel</button>

            </form>
            
        <%
            String status = request.getParameter("s");
            if (status != null) {
                if ("1".equals(status)) {
                    out.println("<p style='color: green;'>Password change successfully!</p>");
                } else if ("0".equals(status)) {
                    out.println("<p style='color: red;'>Failed to change password.check the old password  Please try again.</p>");
                }
            }
        %>
        </div>
    </div>

    <!-- footer -->
    <div class="footer">
        <div class="footer-con">
            <div class="footer-1">
                <h2> Logo</h2>
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Soluta molestiae </p>

                <div class="footer-icon">
                    <i class="fa-brands fa-instagram" style="color:#FFFFFF;"></i>
                    <i class="fa-brands fa-twitter" style="color:#FFFFFF;"></i>
                    <i class="fa-brands fa-facebook" style="color:#FFFFFF;"></i>
                </div>
            </div>
        </div>
        <p><b>Logo</b> copyright &copy; 2024</p>
    </div>

<!--    <script src="../Style/script.js"></script>-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function showChangePassword() {
            document.getElementById('changePasswordForm').style.display = 'block';
        }
        function hideChangePassword() {
            document.getElementById('changePasswordForm').style.display = 'none';
        }
    </script>
</body>
</html>