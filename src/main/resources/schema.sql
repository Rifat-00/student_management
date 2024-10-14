-- Create database
CREATE DATABASE IF NOT EXISTS student_management;

-- Use the created database
USE student_management;


-- Create users table
CREATE TABLE IF NOT EXISTS users (
   id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(50) NOT NULL UNIQUE,
   email VARCHAR(100) NOT NULL UNIQUE,
   password VARCHAR(255) NOT NULL
);


-- Create departments table
CREATE TABLE IF NOT EXISTS departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create programs table
CREATE TABLE IF NOT EXISTS programs
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create courses table
CREATE TABLE IF NOT EXISTS courses
(
     id INT AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(100) NOT NULL,
     credits INT NOT NULL
);

-- Create teachers table
CREATE TABLE IF NOT EXISTS teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Create students table
CREATE TABLE IF NOT EXISTS students
(
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Create attendance table
CREATE TABLE IF NOT EXISTS attendance
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    date DATE NOT NULL,
    present BOOLEAN NOT NULL
);

-- Insert dummy data into departments table
INSERT INTO departments (name) VALUES ('Computer Science');
INSERT INTO departments (name) VALUES ('Mathematics');
INSERT INTO departments (name) VALUES ('Physics');

-- Insert dummy data into programs table
INSERT INTO programs (name) VALUES ('BSc Computer Science');
INSERT INTO programs (name) VALUES ('BSc Mathematics');
INSERT INTO programs (name) VALUES ('BSc Physics');

-- Insert dummy data into courses table
INSERT INTO courses (name, credits) VALUES ('Data Structures', 3);
INSERT INTO courses (name, credits) VALUES ('Algorithms', 4);
INSERT INTO courses (name, credits) VALUES ('Calculus', 3);
INSERT INTO courses (name, credits) VALUES ('Linear Algebra', 4);
INSERT INTO courses (name, credits) VALUES ('Quantum Mechanics', 4);

-- Insert dummy data into teachers table
INSERT INTO teachers (name, email) VALUES ('John Doe', 'john.doe@example.com');
INSERT INTO teachers (name, email) VALUES ('Jane Smith', 'jane.smith@example.com');
INSERT INTO teachers (name, email) VALUES ('Emily Johnson', 'emily.johnson@example.com');

-- Insert dummy data into students table
INSERT INTO students (name, email) VALUES ('Alice Brown', 'alice.brown@example.com');
INSERT INTO students (name, email) VALUES ('Bob White', 'bob.white@example.com');
INSERT INTO students (name, email) VALUES ('Charlie Green', 'charlie.green@example.com');

-- Insert dummy data into attendance table
INSERT INTO attendance (student_id, date, present) VALUES (1, '2024-10-01', TRUE);
INSERT INTO attendance (student_id, date, present) VALUES (1, '2024-10-02', FALSE);
INSERT INTO attendance (student_id, date, present) VALUES (2, '2024-10-01', TRUE);
INSERT INTO attendance (student_id, date, present) VALUES (3, '2024-10-01', TRUE);
