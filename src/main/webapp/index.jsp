<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to the Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
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
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 text-center">
            <h1 class="display-4 mb-4">Welcome to the Student Management System</h1>
            <p class="lead mb-5">Empower your educational journey with our comprehensive Student Management System. Designed for students and educators alike, we simplify the process of managing student information and enhancing the learning experience.</p>

            <h2 class="h4 mb-4">Why Choose Our System?</h2>
            <div class="row mb-5">
                <div class="col-md-4">
                    <h3 class="h5">Effortless Registration</h3>
                    <p>Sign up quickly and manage your student profile with ease.</p>
                </div>
                <div class="col-md-4">
                    <h3 class="h5">Secure Access</h3>
                    <p>Enjoy peace of mind with our robust security features protecting your data.</p>
                </div>
                <div class="col-md-4">
                    <h3 class="h5">Intuitive Interface</h3>
                    <p>Navigate your student records, grades, and schedules effortlessly with our user-friendly design.</p>
                </div>
            </div>

            <p class="mb-4">Ready to take charge of your academic journey? Join us today!</p>

            <div class="d-grid gap-2 d-md-block">
                <a href="register.jsp" class="btn btn-primary btn-lg me-md-2 mb-2 mb-md-0">Get Started</a>
                <a href="login.jsp" class="btn btn-outline-primary btn-lg">Log In</a>
            </div>
        </div>
    </div>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
