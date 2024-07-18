<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String newpassword = request.getParameter("newPassword");
    String oldpassword = request.getParameter("oldPassword");

    if (username != null && newpassword != null && oldpassword != null) {
        User user = new User(username, oldpassword); 
        if (user.changePassword(DbConnector.getConnection(), newpassword, oldpassword, username)) {
            response.sendRedirect("profile.jsp?s=1");
        } else {
            response.sendRedirect("profile.jsp?s=0");
        }
    } else {
        response.sendRedirect("profile.jsp?s=0"); 
    }
%>
