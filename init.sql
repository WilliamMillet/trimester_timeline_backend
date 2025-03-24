CREATE DATABASE IF NOT EXISTS trimester_timeline;
USE trimester_timeline;

CREATE TABLE users (
  zID INT NOT NULL PRIMARY KEY,
  name TEXT NOT NULL,
  passwrd TEXT,
  degree TEXT,
  year INT
);

CREATE TABLE subjects (
  courseCode INT NOT NULL PRIMARY KEY,
  name TEXT
);

CREATE TABLE assignments (
  assignmentId INT NOT NULL PRIMARY KEY,
  name TEXT,
  description TEXT,
  releaseDate DATE,
  dueDate DATE,
  subject INT,
  FOREIGN KEY (subject) REFERENCES subjects(courseCode)
);

CREATE TABLE reviews (
  studentId INT NOT NULL,
  assignmentId INT NOT NULL,
  content TEXT,
  timeTakenInWeeks DECIMAL(5,2),
  reviewDate DATE,
  is_anonymous BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (studentId, assignmentId),
  FOREIGN KEY (studentId) REFERENCES users(zID),
  FOREIGN KEY (assignmentId) REFERENCES assignments(assignmentId)
);