package com.student_management.student_management.dao;


import java.sql.*;

    public class UserDao {
        private final Connection conn;

        public UserDao(Connection conn) {
            this.conn = conn;
        }

        public boolean registerUser(String username, String email, String password) {
            try {
                String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, email);
                ps.setString(3, password);
                int result = ps.executeUpdate();
                return result > 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return false;
        }

        public boolean validateLogin(String username, String password) {
            try {
                String query = "SELECT * FROM users WHERE username = ? AND password = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                return rs.next();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return false;
        }
    }


