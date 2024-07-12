<%-- 
    Document   : Addstudent
    Created on : Jul 18, 2023, 5:16:17 AM
    Author     : HP
--%>

<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String role = "student";
    String password = request.getParameter("password");

    User user = new User(firstname, lastname, username, email, role, password);
    if (user.AddStudent(DbConnector.getConnection())) {
        response.sendRedirect("AddstudentPage.jsp?s=1");
    } else {
        response.sendRedirect("AddstudentPage.jsp?s=0");
    }
%>
