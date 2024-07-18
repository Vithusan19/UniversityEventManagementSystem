<%-- 
    Document   : contactmessage
    Created on : Jul 14, 2024, 3:45:00 PM
    Author     : test
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../CSS/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 6rem">
        <h3>Logo</h3>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="adminDashboard.jsp">Events</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="displayuserpage.jsp">User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contactmessage.jsp">Contact</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="../Images/user.png" class="rounded-circle" alt="User Icon">
                    </a>
                    <div class="dropdown-menu" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Edit Profile</a>
                        <a class="dropdown-item" href="logout.jsp">Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="card"  style="margin-bottom: 20px;">
            <div class="card-body">
                <h5 class="card-title"><i class="fa-solid fa-user"></i> Name: Vithusan</h5>
                <p class="card-text"><i class="fa-solid fa-envelope"></i> Email: cst21012@std.uwu.ac.lk</p>
                <p class="card-text"><i class="fa-solid fa-phone"></i> Phone: 0763915184</p>
                <p class="card-text"><i class="fa-solid fa-message"></i> Message: This is a sample message.</p>
                <p class="card-text"><i class="fa-solid fa-calendar-days"></i>  Date: 2024-07-14</p>
                <button class="btn btn-secondary" style="float: right;" >Cheack <i class="fa-solid fa-check"></i></button>
            </div>
        </div>
        <div class="card"  style="margin-bottom: 20px;">
            <div class="card-body">
                <h5 class="card-title"><i class="fa-solid fa-user"></i> Name: Vithusan</h5>
                <p class="card-text"><i class="fa-solid fa-envelope"></i> Email: cst21012@std.uwu.ac.lk</p>
                <p class="card-text"><i class="fa-solid fa-phone"></i> Phone: 0763915184</p>
                <p class="card-text"><i class="fa-solid fa-message"></i> Message: This is a sample message.</p>
                <p class="card-text"><i class="fa-solid fa-calendar-days"></i>  Date: 2024-07-14</p>
                <button class="btn btn-secondary" style="float: right;" >Cheack <i class="fa-solid fa-check"></i></button>

            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
