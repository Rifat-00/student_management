package com.student_management.student_management.dao;

import com.student_management.student_management.model.Teacher;
import com.student_management.student_management.utility.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherDao {
    // Method to add a new teacher
    public void addTeacher(String name, String department) {  // Updated parameter name
        String sql = "INSERT INTO teachers (name, department) VALUES (?, ?)";  // Updated SQL
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setString(2, department);  // Updated parameter
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to update an existing teacher
    public void updateTeacher(int id, String newName, String newDepartment) {  // Updated parameter name
        String sql = "UPDATE teachers SET name = ?, department = ? WHERE id = ?";  // Updated SQL
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, newName);
            statement.setString(2, newDepartment);  // Updated parameter
            statement.setInt(3, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to delete a teacher
    public void deleteTeacher(int id) {
        String sql = "DELETE FROM teachers WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to get all teachers
    public List<Teacher> getAllTeachers() {
        List<Teacher> teachers = new ArrayList<>();
        String sql = "SELECT * FROM teachers";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String department = resultSet.getString("department");  // Updated field
                teachers.add(new Teacher(id, name, department));  // Updated constructor
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return teachers;
    }


}
