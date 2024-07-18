<%-- 
    Document   : add_event
    Created on : Jul 18, 2023, 5:16:17 AM
    Author     : HP
--%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String eventName = request.getParameter("eventName");
    String date = request.getParameter("eventDate");
    String time = request.getParameter("eventTime");
    String place = request.getParameter("eventPlace");
    String link = request.getParameter("eventLink");
    String description = request.getParameter("eventDescription");
    String organizer = request.getParameter("eventOrganizer");

    // Assuming event_id is auto-incremented and not provided by user
    Event event = new Event(0, eventName, date, time, place, link, description, organizer);

    if(event.addEvent(DbConnector.getConnection())) {
        response.sendRedirect("adminDashboard.jsp?s=1");
    } else {
        response.sendRedirect("adminDashboard.jsp?s=0");
    }
%>
