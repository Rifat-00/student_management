<%@ page import="com.student_management.student_management.dao.StudentDao" %>
<%@ page import="com.student_management.student_management.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Student Information Management</h2>

    <!-- Add Student Section -->
    <div class=" mb-4">
        <div class="card-header">
            <h4>Add New Student</h4>
        </div>
        <div class="card-body">
            <form action="StudentServlet?action=add" method="post">
                <div class="form-group mb-3">
                    <label for="studentName">Student Name:</label>
                    <input type="text" class="form-control" id="studentName" name="studentName" required>
                </div>
                <div class="form-group mb-3">
                    <label for="studentEmail">Email:</label>
                    <input type="email" class="form-control" id="studentEmail" name="studentEmail" required>
                </div>
                <div class="form-group mb-3">
                    <label for="studentDepartment">Department:</label>
                    <input type="text" class="form-control" id="studentDepartment" name="studentDepartment" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Student</button>
            </form>
        </div>
    </div>

    <!-- Update Student Section -->
    <div class=" mb-4">
        <div class="card-header">
            <h4>Update Student Information</h4>
        </div>
        <div class="card-body">
            <form action="StudentServlet?action=update" method="post">
                <div class="form-group mb-3">
                    <label for="studentId">Student ID:</label>
                    <input type="number" class="form-control" id="studentId" name="studentId" required>
                </div>
                <div class="form-group mb-3">
                    <label for="newStudentName">New Student Name:</label>
                    <input type="text" class="form-control" id="newStudentName" name="newStudentName" required>
                </div>
                <div class="form-group mb-3">
                    <label for="newStudentEmail">New Email:</label>
                    <input type="email" class="form-control" id="newStudentEmail" name="newStudentEmail" required>
                </div>
                <button type="submit" class="btn btn-warning">Update Student</button>
            </form>
        </div>
    </div>

    <!-- Delete Student Section -->
    <div class=" mb-4">
        <div class="card-header">
            <h4>Delete Student</h4>
        </div>
        <div class="card-body">
            <form action="StudentServlet?action=delete" method="post">
                <div class="form-group mb-3">
                    <label for="deleteStudentId">Student ID:</label>
                    <input type="number" class="form-control" id="deleteStudentId" name="deleteStudentId" required>
                </div>
                <button type="submit" class="btn btn-danger">Delete Student</button>
            </form>
        </div>
    </div>

    <!-- Display Student List -->
    <h3>Existing Students</h3>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
        </tr>
        </thead>
        <tbody>
        <%
            StudentDao studentDao = new StudentDao();
            List<Student> students = studentDao.getAllStudents();
            for (Student student : students) {
        %>
        <tr>
            <td><%= student.getId() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getEmail() %></td>
            <td><%= student.getDepartment() %></td>

        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
