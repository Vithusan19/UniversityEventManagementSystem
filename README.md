# University Event Management System (Backend & Frontend)

This repository contains the University Event Management System, built using Java, JSP (JavaServer Pages), and MySQL. The system enables event organizers to create and manage university events while allowing students to register and participate.

## 🚀 Features

- 🎟️ Event creation and management
- 👥 User authentication (Admin, Student)
- 📅 Event registration and participation
- 🔔 Notifications & event reminders
- 📊 Admin dashboard for managing users & events

## 🛠️ Tech Stack

- **Frontend:** JSP, HTML, CSS, JavaScript
- **Backend:** Java, JSP
- **Database:** MySQL
- **Version Control:** Git & GitHub

## 📌 Getting Started

### 1️⃣ Clone the Repository
```bash
 git clone https://github.com/vithusan19/university-event-management.git
 cd university-event-management
```

### 2️⃣ Configure the Database
Create a database in MySQL and update the connection details in `dbConfig.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/university_events";
private static final String USER = "root";
private static final String PASSWORD = "";
```
Run the SQL script (`database.sql`) to create necessary tables.

### 3️⃣ Install Dependencies
Ensure you have Java (JDK 11+), Tomcat Server, and MySQL installed.

### 4️⃣ Run the Application
1. Deploy the project on Apache Tomcat.
2. Start the Tomcat server.
3. Access the system at `http://localhost:8080/university-event-management/`


## 👥 Contributors
Want to contribute? Feel free to fork the repository and create a pull request!

## 📧 Contact
For any issues or feature requests, contact me at **vithu0919@gmail.com**

---
💡 **Star** the repository if you find it useful! ⭐

