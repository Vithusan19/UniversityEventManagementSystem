
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<% 
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");
     String username=(String) session.getAttribute("username");
     String userrole=(String) session.getAttribute("userrole");
      if (username != null && !username.isEmpty()) {
        if ("admin".equals(userrole)) {
            response.sendRedirect("/WebApplication2/Admin/adminDashboard.jsp");
        } else {
            response.sendRedirect("/WebApplication2/Student/student_dashboard.jsp");
        }
        return; // Ensure the rest of the page does not execute after redirect
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UEMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/register.css">
    
</head>
<body>
    <div class="logo-con">
       
<!--            <img src="./Images/uwulogo.jpg" class="logoimg" alt="User Icon">-->
<h3 style="color:#2f4f8f;">UEMS</h3>
        
    </div>
    <div class="img-con"></div>
    <div class="d-flex justify-content-center align-items-center flex-grow-1">
        <div class="login-con">
            <h4 class="log-title">Login here</h4>
            <%
                String message = "";
                if(request.getParameter("s") != null){
                    if(request.getParameter("s").equals("1")) {
                        message = "<p class=\"alert alert-success\">Login successfully</p>";
                    } else {
                        message = "<p class=\"alert alert-danger\">Username or password is incorrect</p>";
                    }
                    out.println(message);
                }
            %>
           <form action="login.jsp" method="post">
    <div class="mb-3">
        <input type="text" class="form-control" placeholder="Enter username" name="username" required>
    </div>
    <div class="mb-3">
        <input type="password" class="form-control" placeholder="Enter password" name="password" required>
    </div>
    <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
        <label class="form-check-label" for="rememberMe">Remember Me</label>
    </div>
    <div class="d-grid">
        <button type="submit" class="btn btn-primary">Login here</button>
    </div>
</form>

        </div>
    </div>
    <div class="footer">
        <span> Copyright &copy; All rights reserved.</span>
    </div>
</body>
</html>