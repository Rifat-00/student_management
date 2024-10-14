package com.student_management.student_management.controller;


import com.student_management.student_management.dao.UserDao;
import com.student_management.student_management.utility.DatabaseUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Hash the password using bcrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Database connection and insertion logic
        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, email);
                statement.setString(3, hashedPassword);
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("message", "Registration successful! Please login.");
                    response.sendRedirect("login.jsp");
                    return;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Registration failed. Please try again.");
            request.setAttribute("registerAttempt", true);
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}

