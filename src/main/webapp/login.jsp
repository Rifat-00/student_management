<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login to Student Management System</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .login-card {
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      background-color: white;
      width: 100%;
      max-width: 400px;
    }
    .btn-primary {
      background-color: #6200ee;
      border-color: #6200ee;
    }
    .btn-primary:hover {
      background-color: #3700b3;
      border-color: #3700b3;
    }
    .form-control:focus {
      box-shadow: none;
      border-color: #6200ee;
    }
  </style>
</head>
<body>
<div class="login-card">
  <h2 class="text-center mb-4">Login</h2>

  <form action="login" method="post">
    <input type="hidden" name="loginAttempt" value="true"> <!-- Hidden field -->
    <div class="mb-3">
      <label for="username" class="form-label">Username:</label>
      <input type="text" class="form-control" id="username" name="username" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password:</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="submit" class="btn btn-primary w-100">Login</button>
  </form>
  <p class="mt-3 text-center">Don't have an account? <a href="register.jsp">Register here</a>.</p>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
