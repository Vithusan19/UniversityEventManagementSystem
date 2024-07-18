<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Event"%>
<%@page import="java.util.List"%>
<%@page session="true" %>
<% 
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");

    Connection con = null;
    List<Event> events = null;
    try {
        con = DbConnector.getConnection();
        events = Event.getAllEvents(con);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Newsfeed</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../CSS/admin.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 6rem">
        <h3>Logo</h3>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Events</a>
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
   
    <div class="container">
        <h2 class="my-4">Events</h2>
        <div class="row">
            <% if (events != null) {
                for (Event event : events) { %>
                    <div class="col-md-4">
                        <div class="card mb-3">
                            <img src="../Images/event.png" class="card-img-top" alt="<%= event.getEventName() %>">
                            <div class="card-body">
                                <h5 class="card-title"><%= event.getEventName() %></h5>
                                <p class="card-text">Date: <%= event.getDate() %></p>
                                <p class="card-text">Time: <%= event.getTime() %></p>
                                <p class="card-text">Place: <%= event.getPlace() %></p>
                                <p class="card-text">Organizer: <%= event.getOrganizer() %></p>
                                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#editEventModal<%= event.getEventId() %>">Edit</button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteEventModal<%= event.getEventId() %>">Delete</button>
                            </div>
                        </div>
                    </div>

                    <!-- Edit Event Modal -->
                    <div class="modal fade" id="editEventModal<%= event.getEventId() %>" tabindex="-1" role="dialog" aria-labelledby="editEventModalLabel<%= event.getEventId() %>" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editEventModalLabel<%= event.getEventId() %>">Edit Event</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="editEventForm<%= event.getEventId() %>">
                                        <div class="form-group">
                                            <label for="editEventName<%= event.getEventId() %>">Event Name</label>
                                            <input type="text" class="form-control" id="editEventName<%= event.getEventId() %>" value="<%= event.getEventName() %>" name="editEventName">
                                        </div>
                                        <div class="form-group">
                                            <label for="editEventDate<%= event.getEventId() %>">Date</label>
                                            <input type="date" class="form-control" id="editEventDate<%= event.getEventId() %>" value="<%= event.getDate() %>" name="editEventDate">
                                        </div>
                                        <div class="form-group">
                                            <label for="editTime<%= event.getEventId() %>">Time</label>
                                            <input type="time" class="form-control" id="editTime<%= event.getEventId() %>" value="<%= event.getTime() %>" name="editTime">
                                        </div>
                                        <div class="form-group">
                                            <label for="editEventPlace<%= event.getEventId() %>">Place</label>
                                            <input type="text" class="form-control" id="editEventPlace<%= event.getEventId() %>" value="<%= event.getPlace() %>" name="editEventPlace">
                                        </div>
                                        <div class="form-group">
                                            <label for="editEventLink<%= event.getEventId() %>">Link</label>
                                            <input type="url" class="form-control" id="editEventLink<%= event.getEventId() %>" value="<%= event.getLink() %>" name="editEventLink">
                                        </div>
                                        <div class="form-group">
                                            <label for="editEventDescription<%= event.getEventId() %>">Description</label>
                                            <input type="text" class="form-control" id="editEventDescription<%= event.getEventId() %>" value="<%= event.getDescription() %>" name="editEventDescription">
                                        </div>
                                        <div class="form-group">
                                            <label for="editEventOrganizer<%= event.getEventId() %>">Organizer</label>
                                            <input type="text" class="form-control" id="editEventOrganizer<%= event.getEventId() %>" value="<%= event.getOrganizer() %>" name="editEventOrganizer">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Delete Event Modal -->
                    <div class="modal fade" id="deleteEventModal<%= event.getEventId() %>" tabindex="-1" role="dialog" aria-labelledby="deleteEventModalLabel<%= event.getEventId() %>" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="deleteEventModalLabel<%= event.getEventId() %>">Delete Event</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want to delete this event?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                    <button type="button" class="btn btn-danger">Yes, delete</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <% }
            } else { %>
                <p>No events found.</p>
            <% } %>
        </div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addEventModal">Add Event</button>
    </div>
        <!-- Add Event Modal -->
    <div class="modal fade" id="addEventModal" tabindex="-1" role="dialog" aria-labelledby="addEventModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addEventModalLabel">Create Event</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="AddEvent.jsp" method="post">
                        <div class="form-group">
                            <label for="eventName">Event Name</label>
                            <input type="text" class="form-control" id="eventName" placeholder="Enter event name" name="eventName" required>
                        </div>
                        <div class="form-group">
                            <label for="eventDate">Date</label>
                            <input type="date" class="form-control" id="eventDate" name="eventDate" required>
                        </div>
                        <div class="form-group">
                            <label for="eventTime">Time</label>
                            <input type="time" class="form-control" id="eventTime" name="eventTime" required>
                        </div>
                        <div class="form-group">
                            <label for="eventPlace">Place</label>
                            <input type="text" class="form-control" id="eventPlace" placeholder="Enter event place" name="eventPlace" required>
                        </div>
                        <div class="form-group">
                            <label for="eventLink">Link</label>
                            <input type="url" class="form-control" id="eventLink" placeholder="Enter event link" name="eventLink">
                        </div>
                        <div class="form-group">
                            <label for="eventDescription">Description</label>
                            <textarea class="form-control" id="eventDescription" rows="3" placeholder="Enter event description" name="eventDescription"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="eventOrganizer">Organizer</label>
                            <input type="text" class="form-control" id="eventOrganizer" placeholder="Enter event organizer" name="eventOrganizer" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function() {
            var status = "<%= request.getParameter("s") %>";
            if (status === "1") {
                alert("Event added successfully!");
            } else if (status === "0") {
                alert("Failed to add event. Please try again.");
            }
        });
    </script>
</body>
</html>
