<%-- 
    Document   : AddstudentPage
    Created on : 12 Jul 2024, 13:30:06
    Author     : vithu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Student</title>
    </head>
    <body>
        <h1>Add Student</h1>

        <%
            String status = request.getParameter("s");
            if (status != null) {
                if ("1".equals(status)) {
                    out.println("<p style='color: green;'>Student added successfully!</p>");
                } else if ("0".equals(status)) {
                    out.println("<p style='color: red;'>Failed to add student. Please try again.</p>");
                }
            }
        %>

        <form action="Addstudent.jsp" method="post">
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" required><br><br>
            
            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" required><br><br>
            
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            
            <input type="submit" value="Add Student">
        </form>
    </body>
</html>
