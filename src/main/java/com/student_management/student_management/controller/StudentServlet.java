package com.student_management.student_management.controller;

import com.student_management.student_management.dao.StudentDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class StudentServlet extends HttpServlet {
    private StudentDao studentDao = new StudentDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String name = request.getParameter("studentName");
        String email = request.getParameter("studentEmail");
        String department = request.getParameter("studentDepartment");
        String studentIdStr = request.getParameter("studentId");

        if ("add".equals(action)) {
            studentDao.addStudent(name, email, department);
        } else if ("update".equals(action)) {
            int studentId = Integer.parseInt(studentIdStr);
            studentDao.updateStudent(studentId, name, email, department);
        } else if ("delete".equals(action)) {
            int studentId = Integer.parseInt(studentIdStr);
            studentDao.deleteStudent(studentId);
        }

        response.sendRedirect("studentInfo.jsp");
    }
}
