<%@ page import="com.student_management.student_management.dao.CourseDao" %>
<%@ page import="com.student_management.student_management.model.Course" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="pb-5 pt-5">Course Management</h2>

    <!-- Form for adding a new course -->
    <h3 class="pb-2 pt-4">Add Course</h3>
    <form action="course" method="post">
        <input type="hidden" name="action" value="add">
        <div class="form-group">
            <label for="courseName">Course Name:</label>
            <input type="text" class="form-control" id="courseName" name="courseName" required>
        </div>
        <div class="form-group mb-1">
            <label for="credits">Credits:</label>
            <input type="number" class="form-control" id="credits" name="credits" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Course</button>
    </form>

    <!-- Form for updating a course (showing only if a course is selected) -->
    <h3 class="pb-2 pt-4" >Update Course</h3>
    <form action="course" method="post">
        <input type="hidden" name="action" value="update">
        <div class="form-group">
            <label for="courseId">Course ID:</label>
            <input type="number" class="form-control" id="courseId" name="courseId" required>
        </div>
        <div class="form-group">
            <label for="updateCourseName">New Course Name:</label>
            <input type="text" class="form-control" id="updateCourseName" name="courseName" required>
        </div>
        <div class="form-group mb-1">
            <label for="updateCredits">New Credits:</label>
            <input type="number" class="form-control" id="updateCredits" name="credits" required>
        </div>
        <button type="submit" class="btn btn-warning">Update Course</button>
    </form>

    <!-- Form for deleting a course -->
    <h3 class="pb-2 pt-4">Delete Course</h3>
    <form action="course" method="post">
        <input type="hidden" name="action" value="delete">
        <div class="form-group mb-1">
            <label for="deleteCourseId">Course ID:</label>
            <input type="number" class="form-control" id="deleteCourseId" name="courseId" required>
        </div>
        <button type="submit" class="btn btn-danger">Delete Course</button>
    </form>

    <!-- List of all courses -->
    <h3 class="pt-5">Existing Programs</h3>
    <table class="table mb-3 pb-3">
        <thead>
        <tr>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Credits</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Fetch and display existing programs
            CourseDao courseDao = new CourseDao();
            List<Course> courses = courseDao.getAllCourses();
            for (Course course : courses) {
        %>
        <tr>
            <td><%= course.getId() %></td>
            <td><%= course.getName() %></td>
            <td><%= course.getCredits() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
