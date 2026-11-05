CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

CREATE TABLE IF NOT EXISTS Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    Marks DECIMAL(5,2),
    DeptID INT,
    Email VARCHAR(100),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE IF NOT EXISTS Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    Credits INT
);

INSERT IGNORE INTO Department VALUES
(101,'Computer Science','Block A'),
(102,'Pharmacy','Block B'),
(103,'Commerce','Block C'),
(104,'Mathematics','Block D');

INSERT IGNORE INTO Student VALUES
(1,'Amit',20,'Male',85.50,101,'amit@gmail.com'),
(2,'Priya',21,'Female',92.00,102,'priya@gmail.com'),
(3,'Rahul',19,'Male',76.50,101,'rahul@gmail.com'),
(4,'Neha',22,'Female',88.00,103,'neha@gmail.com'),
(5,'Arjun',20,'Male',69.50,104,'arjun@gmail.com'),
(6,'Sneha',21,'Female',95.00,102,'sneha@gmail.com'),
(7,'Rohit',23,'Male',72.00,103,'rohit@gmail.com'),
(8,'Pooja',20,'Female',81.00,104,'pooja@gmail.com');

INSERT IGNORE INTO Course VALUES
(201,'Database Management System',4),
(202,'Python Programming',4),
(203,'Mathematics',3),
(204,'Computer Networks',3),
(205,'Data Structures',4);
