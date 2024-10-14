package com.student_management.student_management.controller;

import com.student_management.student_management.utility.DatabaseUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean loginSuccess = false;

        // Database connection and user validation logic
        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "SELECT password FROM users WHERE username = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String storedPassword = resultSet.getString("password");
                        // Verify the password using bcrypt
                        if (BCrypt.checkpw(password, storedPassword)) {
                            loginSuccess = true; // Authentication successful
                        }
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (loginSuccess) {
            // Create a session object
            HttpSession session = request.getSession();
            // Set the username in the session
            session.setAttribute("username", username);
            // Redirect to dashboard
            response.sendRedirect("dashboard.jsp");
        } else {
            // Set error message and redirect back to login page
            request.setAttribute("error", "Invalid username or password.");
            request.setAttribute("loginAttempt", true);
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}

