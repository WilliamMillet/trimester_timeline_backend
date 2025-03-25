CREATE DATABASE IF NOT EXISTS trimester_timeline;
USE trimester_timeline;

CREATE TABLE users (
  zID INT NOT NULL PRIMARY KEY,
  name TEXT NOT NULL,
  password TEXT NOT NULL,
  degree TEXT,
  year INT
);

CREATE TABLE subjects (
  course_code VARCHAR(10) NOT NULL PRIMARY KEY,
  name TEXT
);

CREATE TABLE assignments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  course_code VARCHAR(10) NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  is_obsolete BOOLEAN NOT NULL DEFAULT FALSE,
  FOREIGN KEY (course_code) REFERENCES subjects(course_code) ON DELETE CASCADE
);

CREATE TABLE reviews (
  user_zid INT NOT NULL,
  assignment_id INT NOT NULL,
  content TEXT,
  time_taken_in_weeks DECIMAL(5,2) CHECK(time_taken_in_weeks >= 0),
  review_date DATE DEFAULT  (CURRENT_DATE),
  release_date DATE,
  due_date DATE,
  is_anonymous BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (user_zid, assignment_id),
  FOREIGN KEY (user_zid) REFERENCES users(zID) ON DELETE CASCADE,
  FOREIGN KEY (assignment_id) REFERENCES assignments(id) ON DELETE CASCADE
);