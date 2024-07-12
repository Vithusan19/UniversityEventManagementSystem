<%-- 
    Document   : add_event
    Created on : Jul 18, 2023, 5:16:17 AM
    Author     : HP
--%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String eventName = request.getParameter("event_name");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String place = request.getParameter("place");
    String link = request.getParameter("link");
    String description = request.getParameter("description");
    String organizer = request.getParameter("organizer");

    // Assuming event_id is auto-incremented and not provided by user
    Event event = new Event(0, eventName, date, time, place, link, description, organizer);

    if(event.addEvent(DbConnector.getConnection())) {
        response.sendRedirect("add_event.jsp?s=1");
    } else {
        response.sendRedirect("add_event.jsp?s=0");
    }
%>
