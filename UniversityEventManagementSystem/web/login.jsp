<%--<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    User user = new User(username, password);
    if (user.login(DbConnector.getConnection())) {
        
       response.sendRedirect("index.jsp?s=1");
        //String userRole = user.getRole();
//        if ("admin".equals(userRole)) {
//         response.sendRedirect("index.jsp?s=1");
//            //response.sendRedirect("admin_dashboard.jsp");
//            //response.sendRedirect("/UniversityEventManagement/Admin/admin_dashboard.jsp");
//        } else  {
//         response.sendRedirect("index.jsp?s=1");
//            response.sendRedirect("student_dashboard.jsp");
//            //response.sendRedirect("/UniversityEventManagement/Student/student_dashboard.jsp");
//        }
    } else {
        response.sendRedirect("index.jsp?s=0");
    }    }

%>--%>
<%-- 
    Document   : Addstudent
    Created on : Jul 18, 2023, 5:16:17 AM
    Author     : HP
--%>

<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 
    String username = request.getParameter("username");
    String password = request.getParameter("password");
   

    User user = new User( username, password);
    if (user.login(DbConnector.getConnection())) {
        String userRole=user.getRole();
        String firstname=user.getFirstname();
        String lastname=user.getLastname();
        if("admin".equals(userRole)){
            session.setAttribute("username", username);
            session.setAttribute("firstname", firstname);
            session.setAttribute("lastname", lastname);
            session.setAttribute("userrole", userRole);
            response.sendRedirect("/WebApplication2/Admin/adminDashboard.jsp");
        }
        else{
            session.setAttribute("userrole", userRole);
             session.setAttribute("username", username);
            session.setAttribute("firstname", firstname);
            session.setAttribute("lastname", lastname);
            response.sendRedirect("/WebApplication2/Student/student_dashboard.jsp");
        }
        
    } else {
        response.sendRedirect("index.jsp?s=0");
    }
%>