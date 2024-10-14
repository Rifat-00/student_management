<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px;
    }
    .card {
      padding: 40px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .btn-primary {
      background-color: #6200ee;
      border-color: #6200ee;
    }
    .btn-primary:hover {
      background-color: #3700b3;
      border-color: #3700b3;
    }
    .btn-outline-primary {
      color: #6200ee;
      border-color: #6200ee;
    }
    .btn-outline-primary:hover {
      background-color: #6200ee;
      color: white;
    }
    .dashboard-btn {
      margin-bottom: 20px;
      display: flex;
      justify-content: center;
    }
    .dashboard-btn a {
      width: 100%;
      height: 60px; /* Same height for all buttons */
      display: flex;
      justify-content: center;
      align-items: center;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card text-center">
        <h2 class="mb-4">Welcome, <%= session.getAttribute("username") %>!</h2>
        <p class="lead mb-5">This is your dashboard. Use the options below to manage the system:</p>

        <div class="row">
          <div class="col-md-6 dashboard-btn">
            <a href="departmentInfo.jsp" class="btn btn-outline-primary btn-lg">Department Information</a>
          </div>
          <div class="col-md-6 dashboard-btn">
            <a href="programInfo.jsp" class="btn btn-outline-primary btn-lg">Program Information</a>
          </div>
          <div class="col-md-6 dashboard-btn">
            <a href="courseInfo.jsp" class="btn btn-outline-primary btn-lg">Course Information</a>
          </div>
          <div class="col-md-6 dashboard-btn">
            <a href="teacherInfo.jsp" class="btn btn-outline-primary btn-lg">Teacher Information</a>
          </div>
          <div class="col-md-6 dashboard-btn">
            <a href="attendanceEntry.jsp" class="btn btn-outline-primary btn-lg">Daily Attendance Entry</a>
          </div>
          <div class="col-md-6 dashboard-btn">
            <a href="studentInfo.jsp" class="btn btn-outline-primary btn-lg">Student Information</a>
          </div>
        </div>

        <a href="logout" class="btn btn-danger btn-lg mt-4">Logout</a>
      </div>
    </div>
  </div>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
