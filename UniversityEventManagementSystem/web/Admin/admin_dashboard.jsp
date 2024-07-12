<%-- 
    Document   : admin_dashboard
    Created on : 12 Jul 2024, 12:43:43
    Author     : vithu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar with Popup</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link rel="stylesheet" href="../CSS/admin.css">
       
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 6rem">
        <h3 >Logo</h3>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Events</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="../Images/user.png" class="rounded-circle" alt="User Icon">
                    </a>
                    <div class="dropdown-menu" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Edit Profile</a>
                        <a class="dropdown-item" href="#">Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <div class="event-container">
        <div class="row row-cols-1 row-cols-md-2 g-4" >
            <div class="card mb-3" style="max-width: 540px; margin-right: 20px;">
                <div class="row g-0">
                    <div class="col-md-4 image-background">
                      
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                           
                            <h5 class="card-title">Event title</h5>
                            <p class="card-text">Event description</p>                          
                              <!-- <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p> -->
                               <div class="event-but">
                                <button type="button" class="btn btn-secondary">Edit</button>
                                    <button type="button" class="btn btn-danger">Delete</button>          
                               </div>
                        </div>
                    </div>
                </div>
            </div>
              <div class="card mb-3" style="max-width: 540px; margin-right: 20px;">
                <div class="row g-0">
                    <div class="col-md-4 image-background">
                      
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                           
                            <h5 class="card-title">Event title</h5>
                            <p class="card-text">Event description</p>                          
                              <!-- <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p> -->
                               <div class="event-but">
                                <button type="button" class="btn btn-secondary">Edit</button>
                                    <button type="button" class="btn btn-danger">Delete</button>          
                               </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="card mb-3" style="max-width: 540px; margin-right: 20px;">
                <div class="row g-0">
                    <div class="col-md-4 image-background">
                      
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                           
                            <h5 class="card-title">Event title</h5>
                            <p class="card-text">Event description</p>                          
                              <!-- <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p> -->
                               <div class="event-but">
                                <button type="button" class="btn btn-secondary">Edit</button>
                                    <button type="button" class="btn btn-danger">Delete</button>          
                               </div>
                        </div>
                    </div>
                </div>
          
            </div>
            <div class="card mb-3" style="max-width: 540px; margin-right: 20px;">
                <div class="row g-0">
                    <div class="col-md-4 image-background">
                      
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                           
                            <h5 class="card-title">Event title</h5>
                            <p class="card-text">Event description</p>                          
                              <!-- <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p> -->
                               <div class="event-but">
                                <button type="button" class="btn btn-secondary">Edit</button>
                                    <button type="button" class="btn btn-danger">Delete</button>          
                               </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

