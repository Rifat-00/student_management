<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.student_management.student_management.dao.AttendanceDao" %>
<%@ page import="com.student_management.student_management.model.Attendance" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Daily Attendance</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Daily Attendance</h2>

    <!-- Form to add attendance -->
    <form action="AttendanceServlet" method="post">
        <div class="form-group">
            <label for="studentId">Student ID:</label>
            <input type="number" class="form-control" id="studentId" name="studentId" required>
        </div>
        <div class="form-group">
            <label for="date">Date:</label>
            <input type="date" class="form-control" id="date" name="date" required>
        </div>
        <div class="form-group">
            <label for="present">Present:</label>
            <select class="form-control" id="present" name="present">
                <option value="true">Yes</option>
                <option value="false">No</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <hr>

    <!-- Display attendance records -->
    <h3>Attendance Records</h3>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Student ID</th>
            <th>Date</th>
            <th>Present</th>
        </tr>
        </thead>
        <tbody>
        <%
            AttendanceDao attendanceDao = new AttendanceDao();
            List<Attendance> attendanceList = attendanceDao.getAllAttendance();
            for (Attendance attendance : attendanceList) {
        %>
        <tr>
            <td><%= attendance.getStudentId() %></td>
            <td><%= attendance.getDate() %></td>
            <td><%= attendance.isPresent() ? "Yes" : "No" %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
