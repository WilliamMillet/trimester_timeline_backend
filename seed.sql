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
INSERT INTO users (zID, name, password, degree, year) VALUES
(5356345, 'Alex Chen', 'password123', 'Computer Science', 2),
(5321553, 'Priya Patel', 'mySecurePass', 'Software Engineering', 3),
(5319042, 'James Nguyen', 'csRocks!', 'Computer Science', 1),
(5308461, 'Sarah Ibrahim', 'pass4321', 'Computer Science', 2),
(5378003, 'Ella Zhang', '1521master', 'Computer Engineering', 2),
(5342209, 'Tom Williams', 'noSleepTilComp', 'Software Engineering', 3),
(5367312, 'Lily Tran', 'code4life', 'Computer Science', 1),
(5398234, 'Haruto Tanaka', 'bitwiseFTW', 'Computer Science', 4),
(5384101, 'Mia Rossi', 'frontendQueen', 'Software Engineering', 2),
(5311758, 'Ben Li', 'dungeonBoss', 'Computer Science', 2),
(5347733, 'Hannah Zhao', 'eventStreamz', 'Computer Engineering', 3),
(5329105, 'Arjun Das', 'learnMIPS', 'Computer Science', 1);
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

INSERT INTO assignments (course_code, name, description) VALUES
('COMP1511', '2D Grid Game', 'Students will develop a small-grid based game in C in which the player navigates a 2D map, interacting with objects or enemies. Past examples include a lunar adventure where players move an astronaut to collect moon cheese, manage oxygen levels and return to a lander while navigating obstacles.');

INSERT INTO reviews (user_zid, assignment_id, content, time_taken_in_weeks, review_date, release_date, due_date, is_anonymous) VALUES
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

INSERT INTO users (zID, name, password, degree, year) VALUES
(5356345, 'Alex Chen', 'password123', 'Computer Science', 2),
(5321553, 'Priya Patel', 'mySecurePass', 'Software Engineering', 3),
(5319042, 'James Nguyen', 'csRocks!', 'Computer Science', 1),
(5308461, 'Sarah Ibrahim', 'pass4321', 'Computer Science', 2),
(5378003, 'Ella Zhang', '1521master', 'Computer Engineering', 2),
(5342209, 'Tom Williams', 'noSleepTilComp', 'Software Engineering', 3),
(5367312, 'Lily Tran', 'code4life', 'Computer Science', 1),
(5398234, 'Haruto Tanaka', 'bitwiseFTW', 'Computer Science', 4),
(5384101, 'Mia Rossi', 'frontendQueen', 'Software Engineering', 2),
(5311758, 'Ben Li', 'dungeonBoss', 'Computer Science', 2),
(5347733, 'Hannah Zhao', 'eventStreamz', 'Computer Engineering', 3),
(5329105, 'Arjun Das', 'learnMIPS', 'Computer Science', 1);

INSERT INTO subjects (course_code, name) VALUES
('COMP1521', 'Computer System Fundamentals'),
('COMP3331', 'Web Front-End Programming'),
('COMP2511', 'Object-Oriented Design & Programming');

INSERT INTO assignments (course_code, name, description) VALUES
('COMP1521', 'C to MIPS', 'Convert C-based game to MIPS assembly'),
('COMP1521', 'Files and Bitwise Operations', 'File I/O and bitwise ops in C'),
('COMP3331', 'Screenshot to HTML/CSS', 'Recreate webpage using HTML/CSS'),
('COMP3331', 'VanillaJS Assignment', 'Make a form interactive using JavaScript'),
('COMP3331', 'VanillaJS SPA with REST API', 'Build SPA with fetch and REST API'),
('COMP3331', 'End-to-End React App with Vercel', 'React SPA connected to backend'),
('COMP2511', 'Train Network Simulation', 'Design train network using OOP'),
('COMP2511', 'Dungeon Refactoring', 'Refactor Java dungeon game'),
('COMP2511', 'Event Streaming System', 'Java message streaming system');

INSERT INTO reviews (user_zid, assignment_id, content, time_taken_in_weeks, review_date, release_date, due_date, is_anonymous) VALUES
(5356345, 1, 'MIPS was a total mindbend. Took me 2.5 weeks, but once I got past the syscall stuff it kinda clicked.', 2.5, '2024-06-23', '2024-06-09', '2024-06-23', TRUE),
(5321553, 1, 'This one was fun if you like logic puzzles. 1.5 weeks, would've been faster if I didn’t spend a day stuck on a jump instruction.', 1.5, '2024-06-21', '2024-06-09', '2024-06-23', FALSE),
(5384101, 1, 'Assembly hurts my soul. Spent almost 3 weeks on this and I still don’t get why it worked.', 2.9, '2024-06-28', '2024-06-09', '2024-06-23', TRUE),
(5367312, 1, 'Did it in about a week. Just followed the logic of the C code, then translated. Kinda satisfying tbh.', 1.0, '2024-06-20', '2024-06-09', '2024-06-23', FALSE),
(5342209, 1, 'Took me just over 2 weeks. Debugging MIPS is like debugging in the dark. Cool learning though.', 2.2, '2024-06-25', '2024-06-09', '2024-06-23', TRUE),
(5311758, 2, 'Binary files are cursed. Took 2.2 weeks and I still couldn't get one of the test cases to pass.', 2.2, '2024-07-29', '2024-07-14', '2024-07-28', TRUE),
(5308461, 2, '1.7 weeks. The bit masking stuff was chill once you wrap your head around it.', 1.7, '2024-07-26', '2024-07-14', '2024-07-28', FALSE),
(5378003, 2, 'Legit thought I bricked my laptop. But nah, just a pointer issue lol. 2 weeks.', 2.0, '2024-07-27', '2024-07-14', '2024-07-28', TRUE),
(5398234, 2, '1.2 weeks. Pretty direct if you break it into smaller functions.', 1.2, '2024-07-20', '2024-07-14', '2024-07-28', FALSE),
(5329105, 2, 'Took 2.4 weeks. Didn’t really get it until week 2. The file I/O was more annoying than hard.', 2.4, '2024-07-30', '2024-07-14', '2024-07-28', TRUE);

INSERT INTO reviews (user_zid, assignment_id, content, time_taken_in_weeks, review_date, release_date, due_date, is_anonymous) VALUES
(5342209, 3, 'Easy stuff. Did it in 4 days. Mostly CSS flexbox practice.', 0.6, '2024-10-06', '2024-09-22', '2024-10-06', FALSE),
(5321553, 3, '1.3 weeks. Made it pixel perfect, took forever on the nav bar.', 1.3, '2024-10-05', '2024-09-22', '2024-10-06', TRUE),
(5308461, 3, 'Less than a week. Fun if youre into styling.', 0.9, '2024-10-03', '2024-09-22', '2024-10-06', FALSE),
(5311758, 3, 'Took me 2 weeks but only because I kept tweaking things.', 2.0, '2024-10-07', '2024-09-22', '2024-10-06', TRUE),
(5378003, 3, '1.5 weeks. Got stuck on positioning stuff, but overall chill.', 1.5, '2024-10-06', '2024-09-22', '2024-10-06', TRUE),
(5398234, 4, 'This was more annoying than expected. 1.7 weeks. Checkbox logic tripped me up.', 1.7, '2024-10-21', '2024-10-07', '2024-10-21', TRUE),
(5384101, 4, '1 week flat. Testing with edge cases was helpful.', 1.0, '2024-10-20', '2024-10-07', '2024-10-21', FALSE),
(5329105, 4, 'Took me 2.5 weeks, ngl JavaScript feels cursed sometimes.', 2.5, '2024-10-24', '2024-10-07', '2024-10-21', TRUE),
(5319042, 4, 'Just under a week. Kinda satisfying once validation started working.', 0.9, '2024-10-19', '2024-10-07', '2024-10-21', FALSE),
(5347733, 4, '1.9 weeks. Console logging saved my life.', 1.9, '2024-10-21', '2024-10-07', '2024-10-21', TRUE),
(5311758, 5, '1.6 weeks. Dealing with promises and fetch was new but manageable.', 1.6, '2024-11-05', '2024-10-22', '2024-11-05', FALSE),
(5321553, 5, '2 weeks. SPA routing was confusing at first.', 2.0, '2024-11-06', '2024-10-22', '2024-11-05', TRUE),
(5367312, 5, 'Took a week. Working with the fake API felt real tho.', 1.0, '2024-11-03', '2024-10-22', '2024-11-05', FALSE),
(5384101, 5, '2.3 weeks. DOM manipulation was draining.', 2.3, '2024-11-06', '2024-10-22', '2024-11-05', TRUE),
(5308461, 5, 'Just over a week. Didn’t realize how hard state management is without React.', 1.2, '2024-11-04', '2024-10-22', '2024-11-05', FALSE),
(5378003, 6, 'This was a BEAST. 3 weeks and I still didn’t implement all features.', 3.0, '2024-11-20', '2024-11-06', '2024-11-20', TRUE),
(5342209, 6, '2.4 weeks. Learned a lot tho — Tailwind is so clean once you get it.', 2.4, '2024-11-20', '2024-11-06', '2024-11-20', FALSE),
(5321553, 6, 'Took me the whole 2 weeks. React Router gave me grief.', 2.0, '2024-11-20', '2024-11-06', '2024-11-20', TRUE),
(5356345, 6, '1.7 weeks. Deployment was the easiest part somehow.', 1.7, '2024-11-19', '2024-11-06', '2024-11-20', TRUE),
(5347733, 6, '2.5 weeks. Accessibility testing was new to me, but it’s cool they included that.', 2.5, '2024-11-20', '2024-11-06', '2024-11-20', FALSE),
(5319042, 7, 'Designing the classes was hard. Took me 2.1 weeks.', 2.1, '2025-03-15', '2025-03-01', '2025-03-15', TRUE),
(5398234, 7, '1.5 weeks. Had a great group so we smashed it.', 1.5, '2025-03-14', '2025-03-01', '2025-03-15', FALSE),
(5329105, 7, 'Nearly 3 weeks. My UML diagram looked like a spiderweb.', 2.9, '2025-03-17', '2025-03-01', '2025-03-15', TRUE),
(5367312, 7, 'Took 1.7 weeks. Main issue was debugging interactions between trains and tracks.', 1.7, '2025-03-14', '2025-03-01', '2025-03-15', FALSE),
(5308461, 7, '2.2 weeks. Fun but kinda frustrating with the cargo system.', 2.2, '2025-03-16', '2025-03-01', '2025-03-15', TRUE),
(5342209, 8, 'Honestly loved this. Refactoring is lowkey fun. 1.3 weeks.', 1.3, '2025-04-04', '2025-03-22', '2025-04-05', TRUE),
(5378003, 8, '1.9 weeks. State pattern was annoying at first.', 1.9, '2025-04-05', '2025-03-22', '2025-04-05', FALSE),
(5347733, 8, 'Took me nearly 3 weeks. Debugging boss logic was rough.', 2.9, '2025-04-06', '2025-03-22', '2025-04-05', TRUE),
(5311758, 8, '1.6 weeks. Actually made the codebase readable.', 1.6, '2025-04-05', '2025-03-22', '2025-04-05', FALSE),
(5321553, 8, '2.1 weeks. Adding swamp tiles made me cry.', 2.1, '2025-04-06', '2025-03-22', '2025-04-05', TRUE),
(5384101, 9, '2.5 weeks. Making a CLI and handling concurrency was hard but rewarding.', 2.5, '2025-04-21', '2025-04-07', '2025-04-21', FALSE),
(5319042, 9, '1.8 weeks. Message rebalancing was a cool challenge.', 1.8, '2025-04-21', '2025-04-07', '2025-04-21', TRUE),
(5367312, 9, '3 weeks. Multithreading is evil. But I learned a lot.', 3.0, '2025-04-22', '2025-04-07', '2025-04-21', TRUE),
(5356345, 9, '2.1 weeks. Writing design docs helped me understand the system.', 2.1, '2025-04-21', '2025-04-07', '2025-04-21', FALSE),
(5347733, 9, '2.3 weeks. Demo video was the most stressful part lol.', 2.3, '2025-04-22', '2025-04-07', '2025-04-21', TRUE);


INSERT INTO reviews (user_zid, assignment_id, content, time_taken_in_weeks, review_date, release_date, due_date, is_anonymous) VALUES
(5678901, 2, NULL, 2.4, '2024-07-29', '2024-07-14', '2024-07-28', TRUE),
(5789012, 2, NULL, 2.0, '2024-07-26', '2024-07-14', '2024-07-28', FALSE),
(5890123, 2, NULL, 1.8, '2024-07-27', '2024-07-14', '2024-07-28', TRUE),
(5901234, 2, NULL, 1.5, '2024-07-20', '2024-07-14', '2024-07-28', FALSE),
(5012345, 2, NULL, 1.9, '2024-07-30', '2024-07-14', '2024-07-28', TRUE),
(5123456, 3, NULL, 1.0, '2024-10-06', '2024-09-22', '2024-10-06', FALSE),
(5234567, 3, NULL, 1.2, '2024-10-05', '2024-09-22', '2024-10-06', TRUE),
(5345678, 3, NULL, 1.5, '2024-10-03', '2024-09-22', '2024-10-06', FALSE),
(5456789, 3, NULL, 1.8, '2024-10-07', '2024-09-22', '2024-10-06', TRUE),
(5567890, 3, NULL, 2.0, '2024-10-06', '2024-09-22', '2024-10-06', FALSE),
(5678901, 4, NULL, 1.5, '2024-10-21', '2024-10-07', '2024-10-21', TRUE),
(5789012, 4, NULL, 1.0, '2024-10-20', '2024-10-07', '2024-10-21', FALSE),
(5890123, 4, NULL, 1.8, '2024-10-24', '2024-10-07', '2024-10-21', TRUE),
(5901234, 4, NULL, 2.0, '2024-10-19', '2024-10-07', '2024-10-21', FALSE),
(5012345, 4, NULL, 2.2, '2024-10-21', '2024-10-07', '2024-10-21', TRUE),
(5123456, 5, NULL, 1.6, '2024-11-05', '2024-10-22', '2024-11-05', FALSE),
(5234567, 5, NULL, 1.8, '2024-11-06', '2024-10-22', '2024-11-05', TRUE),
(5345678, 5, NULL, 2.0, '2024-11-03', '2024-10-22', '2024-11-05', FALSE),
(5456789, 5, NULL, 2.2, '2024-11-06', '2024-10-22', '2024-11-05', TRUE),
(5567890, 5, NULL, 2.4, '2024-11-04', '2024-10-22', '2024-11-05', FALSE),
(5678901, 6, NULL, 2.0, '2024-11-20', '2024-11-06', '2024-11-20', TRUE),
(5789012, 6, NULL, 2.2, '2024-11-20', '2024-11-06', '2024-11-20', FALSE),
(5890123, 6, NULL, 2.4, '2024-11-19', '2024-11-06', '2024-11-20', TRUE),
(5901234, 6, NULL, 2.6, '2024-11-20', '2024-11-06', '2024-11-20', FALSE),
(5012345, 6, NULL, 2.8, '2024-11-20', '2024-11-06', '2024-11-20', TRUE),
(5123456, 7, NULL, 1.5, '2025-03-15', '2025-03-01', '2025-03-15', FALSE),
(5234567, 7, NULL, 1.8, '2025-03-14', '2025-03-01', '2025-03-15', TRUE),
(5345678, 7, NULL, 2.0, '2025-03-17', '2025-03-01', '2025-03-15', FALSE),
(5456789, 7, NULL, 2.2, '2025-03-14', '2025-03-01', '2025-03-15', TRUE),
(5567890, 7, NULL, 2.4, '2025-03-16', '2025-03-01', '2025-03-15', FALSE),
(5678901, 8, NULL, 1.3, '2025-04-04', '2025-03-22', '2025-04-05', TRUE),
(5789012, 8, NULL, 1.5, '2025-04-05', '2025-03-22', '2025-04-05', FALSE),
(5890123, 8, NULL, 1.7, '2025-04-06', '2025-03-22', '2025-04-05', TRUE),
(5901234, 8, NULL, 1.9, '2025-04-05', '2025-03-22', '2025-04-05', FALSE),
(5012345, 8, NULL, 2.1, '2025-04-06', '2025-03-22', '2025-04-05', TRUE),
(5123456, 9, NULL, 1.8, '2025-04-21', '2025-04-07', '2025-04-21', FALSE),
(5234567, 9, NULL, 2.0, '2025-04-21', '2025-04-07', '2025-04-21', TRUE),
(5345678, 9, NULL, 2.2, '2025-04-22', '2025-04-07', '2025-04-21', FALSE),
(5456789, 9, NULL, 2.4, '2025-04-21', '2025-04-07', '2025-04-21', TRUE),
(5567890, 9, NULL, 2.6, '2025-04-22', '2025-04-07', '2025-04-21', FALSE);


INSERT INTO reviews (user_zid, assignment_id, content, time_taken_in_weeks, review_date, release_date, due_date, is_anonymous) VALUES
(5356345, 1, 'Completed in about 3 weeks; setup was easy but rendering took longer.', 3.00, '2024-10-05', '2024-03-02', '2025-03-30', 1),
(5321553, 1, 'Finished in 2.2 weeks. Most challenging part was pointer arithmetic.', 2.20, '2024-09-12', '2024-03-01', '2025-03-29', 0),
(5319042, 1, 'Roughly 3.6 weeks; debugging logic errors was time-consuming.', 3.60, '2024-12-01', '2024-03-03', '2025-04-01', 1),
(5308461, 1, 'About 1.9 weeks; after initial hurdles it was smooth.', 1.90, '2024-08-01', '2024-03-04', '2025-03-29', 0),
(5378003, 1, 'Took around 3.3 weeks; edge cases slowed progress.', 3.30, '2024-11-15', '2024-03-02', '2025-04-02', 1);