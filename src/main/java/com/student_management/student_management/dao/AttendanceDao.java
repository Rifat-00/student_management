package com.student_management.student_management.dao;

import com.student_management.student_management.model.Attendance;
import com.student_management.student_management.utility.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDao {
    // Add new attendance entry
    public void addAttendance(int studentId, Date date, boolean present) {
        String sql = "INSERT INTO attendance (student_id, date, present) VALUES (?, ?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, studentId);
            statement.setDate(2, new java.sql.Date(date.getTime()));
            statement.setBoolean(3, present);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Get all attendance records
    public List<Attendance> getAllAttendance() {
        List<Attendance> attendanceList = new ArrayList<>();
        String sql = "SELECT * FROM attendance";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int studentId = resultSet.getInt("student_id");
                Date date = resultSet.getDate("date");
                boolean present = resultSet.getBoolean("present");
                attendanceList.add(new Attendance(id, studentId, date, present));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return attendanceList;
    }
}
