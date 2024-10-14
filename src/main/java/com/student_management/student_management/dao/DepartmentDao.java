package com.student_management.student_management.dao;

import com.student_management.student_management.model.Department;
import com.student_management.student_management.utility.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDao {

    // Method to add a new department
    public void addDepartment(String name) {
        String sql = "INSERT INTO departments (name) VALUES (?)";

        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to update an existing department
    public void updateDepartment(int id, String newName) {
        String sql = "UPDATE departments SET name = ? WHERE id = ?";

        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, newName);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to delete a department
    public void deleteDepartment(int id) {
        String sql = "DELETE FROM departments WHERE id = ?";

        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to get all departments
    public List<Department> getAllDepartments() {
        List<Department> departments = new ArrayList<>();
        String sql = "SELECT * FROM departments";

        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                departments.add(new Department(id, name));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return departments;
    }
}
