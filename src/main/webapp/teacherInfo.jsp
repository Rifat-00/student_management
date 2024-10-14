<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.student_management.student_management.model.Teacher" %>
<%@ page import="com.student_management.student_management.dao.TeacherDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="py-5">Teacher Management</h2>

    <!-- Add Teacher Form -->
    <form class="mb-2" action="teacher" method="post">
        <input type="hidden" name="action" value="add">
        <div class="form-group">
            <label for="teacherName">Teacher Name:</label>
            <input type="text" class="form-control" id="teacherName" name="teacherName" required>
        </div>
        <div class="form-group">
            <label for="teacherDepartment">Department:</label>  <!-- Updated label -->
            <input type="text" class="form-control" id="teacherDepartment" name="teacherDepartment" required>  <!-- Updated name -->
        </div>
        <button type="submit" class="btn btn-primary mt-1">Add Teacher</button>
    </form>

    <hr>

    <!-- Update and Delete Teacher Form -->
    <form class="mb-2" action="teacher" method="post">
        <input type="hidden" name="action" value="update">
        <div class="form-group">
            <label for="teacherId">Select Teacher to Update/Delete:</label>
            <select class="form-control" id="teacherId" name="teacherId" required>
                <option value="">Select a teacher</option>
                <%
                    TeacherDao teacherDao = new TeacherDao();
                    List<Teacher> teachers = teacherDao.getAllTeachers();
                    for (Teacher teacher : teachers) {
                %>
                <option value="<%= teacher.getId() %>"><%= teacher.getName() %></option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <label for="teacherDepartmentUpdate">New Department:</label>  <!-- Updated label -->
            <input type="text" class="form-control" id="teacherDepartmentUpdate" name="teacherDepartment" required>  <!-- Updated name -->
        </div>
        <button type="submit" class="btn btn-success mt-1">Update Teacher</button>
    </form>

    <hr>

    <!-- Delete Teacher Form -->
    <form class="mb-2" action="teacher" method="post">
        <input type="hidden" name="action" value="delete">
        <div class="form-group">
            <label for="teacherIdDelete">Select Teacher to Delete:</label>
            <select class="form-control" id="teacherIdDelete" name="teacherId" required>
                <option value="">Select a teacher</option>
                <%
                    for (Teacher teacher : teachers) {
                %>
                <option value="<%= teacher.getId() %>"><%= teacher.getName() %></option>
                <%
                    }
                %>
            </select>
        </div>
        <button type="submit" class="btn btn-danger mt-1">Delete Teacher</button>
    </form>

    <!-- Table to Display Programs -->
    <h3 class="pt-5">Existing Programs</h3>
    <table class="table mb-3 pb-3">
        <thead>
        <tr>
            <th>Teacher ID</th>
            <th>Teacher Name</th>
            <th>Department</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Fetch and display existing programs
            TeacherDao teacherDAO = new TeacherDao();
            List<Teacher> teachersList = teacherDAO.getAllTeachers();
            for (Teacher teacher : teachersList) {
        %>
        <tr>
            <td><%= teacher.getId() %></td>
            <td><%= teacher.getName() %></td>
            <td><%= teacher.getDepartment() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
