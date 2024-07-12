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
        <h1>LOGO</h1>
    </div>
    <div class="img-con">
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
                <input type="text" class="form-control" placeholder="Enter username" name="username" required/><br />
                <input type="password" class="form-control" placeholder="Enter password" name="password" required/><br />
                <button type="submit" class="btn btn-primary">Login here</button>
            </form>
        </div>
    </div>
    <div class="footer">
        <span> Copyright &copy; All rights reserved.</span>
    </div>
</body>
</html>
