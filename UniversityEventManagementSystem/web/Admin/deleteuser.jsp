<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int userId = Integer.parseInt(request.getParameter("id"));
    Connection con = DbConnector.getConnection();
    boolean isDeleted = User.deleteUserById(con, userId);

    if (isDeleted) {
        response.sendRedirect("displayuserpage.jsp?deletestatus=1");
    } else {
        response.sendRedirect("displayuserpage.jsp?deletestatus=0");
    }
%>