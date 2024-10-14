<%@ page import="com.student_management.student_management.model.Program" %>
<%@ page import="com.student_management.student_management.dao.ProgramDao" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Program Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mb-3 pb-3 pt-3">Program Management</h2>

    <!-- Form to Add Program -->
    <h3>Add Program</h3>
    <form class="mb-3 pb-3" action="ProgramServlet" method="post">
        <input type="hidden" name="action" value="add">
        <div class="form-group mb-1">
            <label for="programName">Program Name:</label>
            <input type="text" class="form-control" id="programName" name="programName" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Program</button>
    </form>

    <!-- Form to Update Program -->
    <h3 >Update Program</h3>
    <form class="mb-3 pb-3" action="ProgramServlet" method="post">
        <input type="hidden" name="action" value="update">
        <div class="form-group">
            <label for="programId">Program ID:</label>
            <input type="number" class="form-control" id="programId" name="programId" required>
        </div>
        <div class="form-group mb-1">
            <label for="updateProgramName">New Program Name:</label>
            <input type="text" class="form-control" id="updateProgramName" name="updateProgramName" required>
        </div>
        <button type="submit" class="btn btn-warning">Update Program</button>
    </form>

    <!-- Form to Delete Program -->
    <h3 >Delete Program</h3>
    <form class="mb-3 pb-3" action="ProgramServlet" method="post">
        <input type="hidden" name="action" value="delete">
        <div class="form-group mb-1">
            <label for="programIdDelete">Program ID:</label>
            <input type="number" class="form-control" id="programIdDelete" name="programId" required>
        </div>
        <button type="submit" class="btn btn-danger">Delete Program</button>
    </form>

    <!-- Table to Display Programs -->
    <h3 class="pt-5">Existing Programs</h3>
    <table class="table mb-3 pb-3">
        <thead>
        <tr>
            <th>Program ID</th>
            <th>Program Name</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Fetch and display existing programs
            ProgramDao programDao = new ProgramDao();
            List<Program> programs = programDao.getAllPrograms();
            for (Program program : programs) {
        %>
        <tr>
            <td><%= program.getId() %></td>
            <td><%= program.getName() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
