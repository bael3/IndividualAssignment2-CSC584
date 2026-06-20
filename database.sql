-- StudentProfilesDB 
-- CSC584 Individual Assignment 2
-- Profile Management System

CREATE TABLE Profile (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    studentID VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    programme VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    hobbies VARCHAR(255),
    introduction VARCHAR(500),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

