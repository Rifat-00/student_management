package com.student_management.student_management.dao;

import com.student_management.student_management.model.Student;
import com.student_management.student_management.utility.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
    // Add student
    public void addStudent(String name, String email, String department) {
        String sql = "INSERT INTO students (name, email, department) VALUES (?, ?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, department);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Update student
    public void updateStudent(int id, String name, String email, String department) {
        String sql = "UPDATE students SET name = ?, email = ?, department = ? WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, department);
            statement.setInt(4, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Delete student
    public void deleteStudent(int id) {
        String sql = "DELETE FROM students WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Get all students
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String department = resultSet.getString("department");
                students.add(new Student(id, name, email, department));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return students;
    }
}
