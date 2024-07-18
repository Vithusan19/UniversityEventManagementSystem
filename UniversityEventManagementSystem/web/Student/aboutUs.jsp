<%-- 
    Document   : aboutUs
    Created on : Jul 14, 2024, 1:02:22 AM
    Author     : test
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../CSS/Student.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <nav class="navbar">
        <h2>Logo</h2>
        <div class="navbar-links">
            <p class="navbar-link"><a href="student_dashboard.jsp">Events</a></p>
            <p class="navbar-link"><a href="#">About Us</a></p>
            <p class="navbar-link"><a href="contactUs.jsp">Contact Us</a></p>
            <p><a href="profile.jsp"><img src="../Images/user.png" class="usericon" alt="User Icon"></a></p>

        </div>
        <div class="navbar-menu" onclick="opennav()">
            <i class="fa-solid fa-bars"></i>
        </div>
    </nav>

    <div class="side-nav">
        <p style="text-align: right;" onclick="closenav()">
            <i class="fa-solid fa-xmark"></i>
        </p>
        <div class="sidenavbar-links">
            <p class="sidenavbar-link"><a href="#">Home</a></p>
            <p class="sidenavbar-link"><a href="#">About Us</a></p>
            <p class="sidenavbar-link"><a href="#">Contact Us</a></p>
        </div>
    </div>

    <!-- About Us Section -->
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h2>About Us</h2>
                <p>
                    Welcome to the University Event Management System! Our platform is designed to streamline the process of organizing and attending university events. Whether you're a student looking to participate in upcoming events or an admin managing event logistics, our system provides all the tools you need.
                </p>
                <p>
                    Our mission is to enhance the university experience by providing a centralized hub for all event-related activities. We believe that university life is enriched by the diverse range of events that take place on campus, from academic conferences and seminars to social gatherings and cultural festivals.
                </p>
                <p>
                    With the University Event Management System, students can easily view and register for events, receive timely notifications, and provide feedback. Administrators can efficiently create, manage, and promote events, ensuring maximum participation and engagement.
                </p>
                <p>
                    Join us in fostering a vibrant and dynamic university community. Stay connected, stay informed, and make the most of your university experience with the University Event Management System.
                </p>
            </div>
        </div>
    </div>

    <!-- Team Members Section -->
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h2 style="margin-bottom: 20px;">Our Team</h2>
                <div class="row" style="margin-bottom: 20px;">
                    <div class="col-md-3 text-center">
                        <img src="../Images/team1.jpeg" class="rounded-circle" alt="Team Member 1" style="width: 150px; height: 150px;">
                        <p>V.VITHUSAN</p>
                       
                    </div>
                    <div class="col-md-3 text-center">
                        <img src="../Images/team2.jpeg" class="rounded-circle" alt="Team Member 2" style="width: 150px; height: 150px;">
                        <p>M.L.Y.JAYASUNDARA</p>
                    </div>
                    <div class="col-md-3 text-center">
                        <img src="../Images/team3.jpeg" class="rounded-circle" alt="Team Member 3" style="width: 150px; height: 150px;">
                        <p>T.N.DHARMARATHNA</p>
                    </div>
                    <div class="col-md-3 text-center">
                        <img src="../Images/team4.jpeg" class="rounded-circle" alt="Team Member 4" style="width: 150px; height: 150px;">
                        <p>M.H.F.RISNA</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="footer-con">
            <div class="footer-1">
                <h2> Logo</h2>
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Soluta molestiae</p>
                <div class="footer-icon">
                    <i class="fa-brands fa-instagram" style="color:#FFFFFF;"></i>
                    <i class="fa-brands fa-twitter" style="color:#FFFFFF;"></i>
                    <i class="fa-brands fa-facebook" style="color:#FFFFFF;"></i>
                </div>
            </div>
           
        </div>
        <p><b>Logo</b> copyright &copy; 2024</p>
    </div>

    <script src="../Style/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

