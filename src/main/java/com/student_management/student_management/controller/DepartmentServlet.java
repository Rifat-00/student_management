package com.student_management.student_management.controller;

import com.student_management.student_management.dao.DepartmentDao;
import com.student_management.student_management.model.Department;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DepartmentServlet extends HttpServlet {

    private DepartmentDao departmentDao;

    @Override
    public void init() {
        departmentDao = new DepartmentDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String departmentName = request.getParameter("departmentName");
        String updateDepartmentName = request.getParameter("updateDepartmentName");
        String departmentIdStr = request.getParameter("departmentId");

        if ("add".equals(action)) {
            // Add new department
            departmentDao.addDepartment(departmentName);
        } else if ("update".equals(action)) {
            // Update existing department
            int departmentId = Integer.parseInt(departmentIdStr);
            departmentDao.updateDepartment(departmentId, updateDepartmentName);
        } else if ("delete".equals(action)) {
            // Delete department
            int departmentId = Integer.parseInt(departmentIdStr);
            departmentDao.deleteDepartment(departmentId);
        }

        // Redirect back to the same page
        response.sendRedirect("departmentInfo.jsp");
    }
}
