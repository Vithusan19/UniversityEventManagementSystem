<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true" %>
<% 
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");
    String username=(String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../CSS/Student.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <nav class="navbar">
        <h2>Logo</h2>
        <div class="navbar-links">
            <p class="navbar-link"><a href="#">Events</a></p>
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
            <p class="sidenavbar-link"><a href="student_dashboard.jsp">Home</a></p>
            <p class="sidenavbar-link"><a href="aboutUs.jsp">AboutUs</a></p>
            <p class="sidenavbar-link"><a href="contactUs.jsp">ContactUs</a></p>
        </div>
    </div>
    
   

    <!-- search -->
    <div class="event-search my-3 text-center" style="margin-top: 20px;">
        <input type="text" placeholder="Search" id="search">
        <i class="fa-solid fa-magnifying-glass"></i>
    </div>

    <div class="container" id="events-container">
        <h2 class="my-4">Today's Events</h2>
        <div class="row">
            <div class="col-md-4 event-item">
                <div class="card mb-3">
                    <img src="../Images/event.png" class="card-img-top" alt="Event 1">
                    <div class="card-body">
                        <h5 class="card-title">Event Title 1</h5>
                        <p class="card-text">Date: July 13, 2024</p>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#eventModal1">More Info</button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 event-item">
                <div class="card mb-3">
                    <img src="../Images/event.png" class="card-img-top" alt="Event 1">
                    <div class="card-body">
                        <h5 class="card-title">Event Title 1</h5>
                        <p class="card-text">Date: July 13, 2024</p>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#eventModal1">More Info</button>
                    </div>
                </div>
            </div>
             <div class="col-md-4 event-item">
                <div class="card mb-3">
                    <img src="../Images/event.png" class="card-img-top" alt="Event 1">
                    <div class="card-body">
                        <h5 class="card-title">Event Title 1</h5>
                        <p class="card-text">Date: July 13, 2024</p>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#eventModal1">More Info</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <div class="container" id="events-container">
        <h2 class="my-4">Upcoming Events</h2>
        <div class="row">
            <div class="col-md-4 event-item">
                <div class="card mb-3">
                    <img src="../Images/event.png" class="card-img-top" alt="Event 1">
                    <div class="card-body">
                        <h5 class="card-title">Event Title 1</h5>
                        <p class="card-text">Date: July 13, 2024</p>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#eventModal1">More Info</button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 event-item">
                <div class="card mb-3">
                    <img src="../Images/event.png" class="card-img-top" alt="Event 1">
                    <div class="card-body">
                        <h5 class="card-title">Event Title 2</h5>
                        <p class="card-text">Date: July 13, 2024</p>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#eventModal1">More Info</button>
                    </div>
                </div>
            </div>
             <div class="col-md-4 event-item">
                <div class="card mb-3">
                    <img src="../Images/event.png" class="card-img-top" alt="Event 1">
                    <div class="card-body">
                        <h5 class="card-title">Event Title </h5>
                        <p class="card-text">Date: July 13, 2024</p>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#eventModal1">More Info</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Modals -->
    <div class="modal fade" id="eventModal1" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel1" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalLabel1">Event Title 1</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   <p>Event Link: <a href="https://meet.google.com/landing" target="_blank">click here</a></p>

                    <p>Event Organizer: Organizer 1</p>
                    <p>Time: 10:00 AM - 2:00 PM</p>
                    <p>Venue: Venue 1</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    

    <!-- No events found message -->
    <div class="container" id="nofound" style="display: none;">
        <h2 class="my-4 text-center">No Events Found</h2>
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

    <script>
        var sidenav = document.querySelector(".side-nav");

        function opennav() {
            sidenav.style.left = "0";
        }

        function closenav() {
            sidenav.style.left = "-60%";
        }

        var search = document.getElementById("search");
        var eventsContainer = document.getElementById("events-container");
        var eventItems = eventsContainer.querySelectorAll(".event-item");
        var noFound = document.getElementById("nofound");

        search.addEventListener('keyup', function(event) {
            var query = event.target.value.toUpperCase();
            var count = 0;
            eventItems.forEach(function(item) {
                var title = item.querySelector('.card-title').textContent.toUpperCase();
                if (title.indexOf(query) < 0) {
                    item.style.display = "none";
                    count++;
                } else {
                    item.style.display = "block";
                }
            });

            if (count >= eventItems.length) {
                noFound.style.display = "block";
            } else {
                noFound.style.display = "none";
            }
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
