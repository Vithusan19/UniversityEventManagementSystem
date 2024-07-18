<%-- 
    Document   : logout
    Created on : Jul 14, 2024, 4:44:55 PM
    Author     : test
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
session.invalidate();
response.sendRedirect("/WebApplication2/index.jsp");
%>
