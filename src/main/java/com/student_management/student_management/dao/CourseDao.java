package com.student_management.student_management.dao;

import com.student_management.student_management.model.Course;
import com.student_management.student_management.model.Program;
import com.student_management.student_management.utility.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDao {


    // Method to add a new course
    public void addCourse(String name, int credits) {
        String sql = "INSERT INTO courses (name, credits) VALUES (?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setInt(2, credits);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to update an existing course
    public void updateCourse(int id, String newName, int newCredits) {
        String sql = "UPDATE courses SET name = ?, credits = ? WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, newName);
            statement.setInt(2, newCredits);
            statement.setInt(3, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to delete a course
    public void deleteCourse(int id) {
        String sql = "DELETE FROM courses WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to get all courses
    public List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM courses";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int credits = resultSet.getInt("credits");
                courses.add(new Course(id, name, credits));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return courses;
    }
}
