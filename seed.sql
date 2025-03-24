INSERT INTO users (zID, name, password, degree, year) VALUES
(5123456, 'Alice Smith', 'pass1234', 'Software Engineering', 2),
(5234567, 'Bob Johnson', 'bobby456', 'Computer Science', 3),
(5345678, 'Charlie Brown', 'charlie789', 'Advanced Computer Science', 4),
(5456789, 'Diana Lee', 'diana101', 'Software Engineering', 1),
(5567890, 'Ethan Davis', 'ethan202', 'Computer Science', 2),
(5678901, 'Fiona Green', 'fiona303', 'Advanced Computer Science', 3),
(5789012, 'George Taylor', 'george404', 'Software Engineering', 4),
(5890123, 'Hannah White', 'hannah505', 'Computer Science', 1),
(5901234, 'Ian Black', 'ian606', 'Advanced Computer Science', 2),
(5012345, 'Jane Doe', 'jane707', 'Software Engineering', 3);

INSERT INTO subjects (course_code, name) VALUES
('COMP1511', 'Programming Fundamentals'),
('MATH1131', 'Mathematics 1A'),
('MATH1231', 'Mathematics 1B'),
('MATH1081', 'Discrete Mathematics'),
('COMP1531', 'Software Engineering Fundamentals');

INSERT INTO assignments (course_code, name, description)
VALUES
(
  'COMP1511',
  '2D Grid Game',
  'Students will develop a small-grid based game in C in which the player navigates a 2D map, interacting with objects or enemies. Past examples include a lunar adventure where players move an astronaut to collect moon cheese, manage oxygen levels and return to a lander while navigating obstacles.'
);