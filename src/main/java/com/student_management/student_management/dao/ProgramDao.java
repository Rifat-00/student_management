package com.student_management.student_management.dao;


import com.student_management.student_management.model.Program;
import com.student_management.student_management.utility.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProgramDao {
    // Method to add a new program
    public void addProgram(String name) {
        String sql = "INSERT INTO programs (name) VALUES (?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to update an existing program
    public void updateProgram(int id, String newName) {
        String sql = "UPDATE programs SET name = ? WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, newName);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to delete a program
    public void deleteProgram(int id) {
        String sql = "DELETE FROM programs WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to get all programs
    public List<Program> getAllPrograms() {
        List<Program> programs = new ArrayList<>();
        String sql = "SELECT * FROM programs";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                programs.add(new Program(id, name));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return programs;
    }
}

