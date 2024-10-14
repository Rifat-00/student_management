package com.student_management.student_management.controller;

import com.student_management.student_management.dao.CourseDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CourseServlet extends HttpServlet {
    private final CourseDao courseDao = new CourseDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String courseName = request.getParameter("courseName");
        String creditsStr = request.getParameter("credits"); // Get the credits as a String
        String courseIdStr = request.getParameter("courseId");

        if ("add".equals(action)) {
            int credits = 0; // Default value or you can throw an exception
            if (creditsStr != null && !creditsStr.isEmpty()) {
                credits = Integer.parseInt(creditsStr); // Only parse if creditsStr is not null or empty
            }
            courseDao.addCourse(courseName, credits);
        } else if ("update".equals(action)) {
            if (courseIdStr != null && !courseIdStr.isEmpty()) {
                int courseId = Integer.parseInt(courseIdStr); // Ensure courseIdStr is valid
                int credits = 0; // Default value or you can throw an exception
                if (creditsStr != null && !creditsStr.isEmpty()) {
                    credits = Integer.parseInt(creditsStr); // Only parse if creditsStr is not null or empty
                }
                courseDao.updateCourse(courseId, courseName, credits);
            }
        } else if ("delete".equals(action)) {
            if (courseIdStr != null && !courseIdStr.isEmpty()) {
                int courseId = Integer.parseInt(courseIdStr); // Ensure courseIdStr is valid
                courseDao.deleteCourse(courseId);
            }
        }

        response.sendRedirect("courseInfo.jsp");
    }
}
