<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.student_management.student_management.dao.DepartmentDao" %>
<%@ page import="com.student_management.student_management.model.Department" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Department Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-3 pb-3">Department Management</h2>

    <div class="row mb-3 pb-3">
        <div class="col-md-12">
            <h4>Add New Department</h4>
            <form action="department" method="post">
                <div class="form-group">
                    <label for="departmentName">Department Name:</label>
                    <input type="text" class="form-control" id="departmentName" name="departmentName" required>
                </div>
                <button type="submit" name="action" value="add" class="btn btn-primary mt-2">Add Department</button>
            </form>
        </div>
    </div>

    <div class="mb-3 pb-3">
        <div class="col-md-12">
            <h4>Update Department</h4>
            <form action="department" method="post">
                <div class="form-group">
                    <label for="updateDepartmentId">Department ID:</label>
                    <input type="text" class="form-control" id="updateDepartmentId" name="departmentId" required>
                </div>
                <div class="form-group">
                    <label for="updateDepartmentName">New Department Name:</label>
                    <input type="text" class="form-control" id="updateDepartmentName" name="updateDepartmentName" required>
                </div>
                <button type="submit" name="action" value="update" class="btn btn-warning mt-2">Update Department</button>
            </form>
        </div>
    </div>

    <div class="mb-3 pb-3">
        <div class="col-md-12">
            <h4>Delete Department</h4>
            <form action="department" method="post">
                <div class="form-group">
                    <label for="deleteDepartmentId">Department ID:</label>
                    <input type="text" class="form-control" id="deleteDepartmentId" name="departmentId" required>
                </div>
                <button type="submit" name="action" value="delete" class="btn btn-danger mt-2">Delete Department</button>
            </form>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-12">
            <h4>Current Departments</h4>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                </tr>
                </thead>
                <tbody>
                <%
                    DepartmentDao departmentDao = new DepartmentDao();
                    List<Department> departments = departmentDao.getAllDepartments();
                    for (Department dept : departments) {
                %>
                <tr>
                    <td><%= dept.getId() %></td>
                    <td><%= dept.getName() %></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
