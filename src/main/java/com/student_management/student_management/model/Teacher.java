package com.student_management.student_management.model;

public class Teacher {
    private int id;
    private String name;
    private String department;  // Changed from subject to department

    public Teacher(int id, String name, String department) {  // Updated constructor
        this.id = id;
        this.name = name;
        this.department = department;  // Updated attribute
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartment() {  // Updated getter
        return department;
    }

    public void setDepartment(String department) {  // Updated setter
        this.department = department;
    }
}
