package com.student_management.student_management.controller;


import com.student_management.student_management.dao.ProgramDao;
import com.student_management.student_management.dao.ProgramDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

    public class ProgramServlet extends HttpServlet {
        private ProgramDao programDao = new ProgramDao();

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            String programName = request.getParameter("programName");
            String updateProgramName = request.getParameter("updateProgramName");
            String programIdStr = request.getParameter("programId");

            if ("add".equals(action)) {
                // Add new program
                programDao.addProgram(programName);
            } else if ("update".equals(action)) {
                // Update existing program
                int programId = Integer.parseInt(programIdStr);
                programDao.updateProgram(programId, updateProgramName);
            } else if ("delete".equals(action)) {
                // Delete program
                int programId = Integer.parseInt(programIdStr);
                programDao.deleteProgram(programId);
            }

            // Redirect back to the same page
            response.sendRedirect("programInfo.jsp");
        }
    }


