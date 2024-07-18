<%-- 
    Document   : contactUs
    Created on : Jul 14, 2024, 1:07:32 AM
    Author     : test
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>contact</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../CSS/Student.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <nav class="navbar">
        <h2>Logo</h2>
        <div class="navbar-links">
            <p class="navbar-link"><a href="student_dashboard.jsp">Events</a></p>
            <p class="navbar-link"><a href="aboutUs.jsp">AboutUs</a></p>
            <p class="navbar-link"><a href="contactUs.jsp">ContactUs</a></p>
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
            <p class="sidenavbar-link"><a href="#">AboutUs</a></p>
            <p class="sidenavbar-link"><a href="#">ContactUs</a></p>
        </div>
    </div>
    <!-- contactus -->
    <div class="container mt-5" style="width: 50%; margin: 30px auto;padding: 20px;">
        <div class="row">
            <div class="col-md-12">
                <h2>Contact Us</h2>
                <form>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your name">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email">
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea class="form-control" id="message" rows="5" placeholder="Enter your message"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
   

   
    <!-- footer -->
    <div class="footer">
        <div class="footer-con">
            <div class="footer-1">
                <h2> Logo</h2>
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Soluta molestiae </p>

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

