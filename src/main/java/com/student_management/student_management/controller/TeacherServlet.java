package com.student_management.student_management.controller;

import com.student_management.student_management.dao.TeacherDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class TeacherServlet extends HttpServlet {
    private TeacherDao teacherDao;

    @Override
    public void init() throws ServletException {
        teacherDao = new TeacherDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String teacherName = request.getParameter("teacherName");
        String teacherDepartment = request.getParameter("teacherDepartment");
        String teacherIdStr = request.getParameter("teacherId");

        if ("add".equals(action)) {
            // Add new teacher
            teacherDao.addTeacher(teacherName, teacherDepartment);
        } else if ("update".equals(action)) {
            // Update existing teacher
            int teacherId = Integer.parseInt(teacherIdStr);
            teacherDao.updateTeacher(teacherId, teacherName, teacherDepartment);
        } else if ("delete".equals(action)) {
            // Delete teacher
            int teacherId = Integer.parseInt(teacherIdStr);
            teacherDao.deleteTeacher(teacherId);
        }

        // Redirect back to the same page
        response.sendRedirect("teacherInfo.jsp");
    }
}
