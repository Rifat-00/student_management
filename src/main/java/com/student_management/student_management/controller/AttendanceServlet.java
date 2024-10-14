package com.student_management.student_management.controller;

import com.student_management.student_management.dao.AttendanceDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

public class AttendanceServlet extends HttpServlet {
    private AttendanceDao attendanceDao = new AttendanceDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentIdStr = request.getParameter("studentId");
        String dateStr = request.getParameter("date");
        String presentStr = request.getParameter("present");

        int studentId = Integer.parseInt(studentIdStr);

        // Converting the String date to java.sql.Date
        Date date = java.sql.Date.valueOf(dateStr); // java.sql.Date is used here

        boolean present = Boolean.parseBoolean(presentStr);

        // Adding the attendance entry
        attendanceDao.addAttendance(studentId, date, present);

        // Redirecting to attendance.jsp
        response.sendRedirect("attendanceEntry.jsp");
    }

}
