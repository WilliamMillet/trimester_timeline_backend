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

INSERT INTO reviews (
  user_zid, assignment_id, content, time_taken_in_weeks, review_date, release_date, due_date, is_anonymous
) VALUES
(5123456, 1, 'Took about three weeks — the curve was steep at first but got easier once you nailed array indexing.', 3.05, '2023-04-15', '2024-03-01', '2024-03-23', FALSE),
(5234567, 1, 'Definitely underestimated the pointer logic; spent almost 4 weeks debugging that one loop.', 3.85, '2023-09-02', '2024-03-01', '2024-03-28', TRUE),
(5345678, 1, 'Completed in about 2.5 weeks. The game engine setup was straightforward but collision detection took ages.', 2.50, '2023-11-20', '2024-03-03', '2024-03-23', FALSE),
(5456789, 1, '💀💀💀', 3.00, '2024-02-10', '2024-03-02', '2024-03-23', TRUE),
(5567890, 1, 'Roughly 3.2 weeks — the assignment spec was clear but handling edge cases in the map logic was time‑consuming.', 3.20, '2024-06-05', '2024-03-01', '2024-03-23', FALSE),
(5678901, 1, 'Finished in 1.8 weeks. Once I understood structs and enums it was smooth sailing.', 1.80, '2024-08-18', '2024-03-06', '2024-03-23', TRUE),
(5789012, 1, 'About 3.4 weeks — early bugs in tile updates really slowed me down, but final testing was quick.', 3.40, '2024-11-30', '2024-03-02', '2024-03-26', FALSE),
(5890123, 1, 'It took around 2.9 weeks; the hardest part was correctly updating the 2D array each turn.', 2.90, '2025-01-25', '2024-03-04', '2024-03-24', TRUE),
(5901234, 1, 'Nearly 4 weeks. The collision logic and dynamic memory management were trickier than expected.', 3.95, '2025-02-12', '2024-03-01', '2024-03-29', FALSE),
(5012345, 1, 'About 3.1 weeks — enjoyable once set up, but debugging seedling growth states was the biggest time sink.', 3.10, '2025-03-10', '2024-03-05', '2024-03-27', TRUE);