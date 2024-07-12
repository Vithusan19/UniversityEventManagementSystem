package app.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Event {
    private int event_id;
    private String event_name;
    private String date;
    private String time;
    private String place;
    private String link;
    private String description;
    private String organizer;

    public Event(int event_id, String event_name, String date, String time, String place, String link, String description, String organizer) {
        this.event_id = event_id;
        this.event_name = event_name;
        this.date = date;
        this.time = time;
        this.place = place;
        this.link = link;
        this.description = description;
        this.organizer = organizer;
    }

    public int getEventId() {
        return event_id;
    }

    public void setEventId(int event_id) {
        this.event_id = event_id;
    }

    public String getEventName() {
        return event_name;
    }

    public void setEventName(String event_name) {
        this.event_name = event_name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }

    public boolean addEvent(Connection con) throws SQLException {
        String query = "INSERT INTO event(event_name, date, time, place, link, description, organizer) VALUES(?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, this.event_name);
            pstmt.setString(2, this.date);
            pstmt.setString(3, this.time);
            pstmt.setString(4, this.place);
            pstmt.setString(5, this.link);
            pstmt.setString(6, this.description);
            pstmt.setString(7, this.organizer);
            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean updateEvent(Connection con) throws SQLException {
        String query = "UPDATE event SET event_name=?, date=?, time=?, place=?, link=?, description=?, organizer=? WHERE event_id=?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, this.event_name);
            pstmt.setString(2, this.date);
            pstmt.setString(3, this.time);
            pstmt.setString(4, this.place);
            pstmt.setString(5, this.link);
            pstmt.setString(6, this.description);
            pstmt.setString(7, this.organizer);
            pstmt.setInt(8, this.event_id);
            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean deleteEvent(Connection con) throws SQLException {
        String query = "DELETE FROM event WHERE event_id=?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, this.event_id);
            return pstmt.executeUpdate() > 0;
        }
    }
}
