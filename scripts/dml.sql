INSERT INTO Students(StuId, Name, Semester)
VALUES (24002, 'Devid', 20);

INSERT INTO Students(StuId, Name, Semester)
VALUES (25403, 'Judy', 14);

INSERT INTO Students(StuId, Name, Semester)
VALUES (26120, 'Rachel', 12);

INSERT INTO Students(StuId, Name, Semester)
VALUES (26830, 'Agim', 8);

INSERT INTO Students(StuId, Name, Semester)
VALUES (27550, 'Geris', 6);

INSERT INTO Students(StuId, Name, Semester)
VALUES (28106, 'Flavia', 5);

INSERT INTO Students(StuId, Name, Semester)
VALUES (29120, 'John', 2);

INSERT INTO Students(StuId, Name, Semester)
VALUES (29555, 'Jimmy', 2);



INSERT INTO ProfessorsRang(RangId, Title)
VALUES (1, 'M.Sc.');

INSERT INTO ProfessorsRang(RangId, Title)
VALUES (2, 'Dr.');

INSERT INTO ProfessorsRang(RangId, Title)
VALUES (3, 'Assoc. Prof.');

INSERT INTO ProfessorsRang(RangId, Title)
VALUES (4, 'Prof.');



INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2125, 'Levine', 4, 226, 120000);

INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2126, 'Brunnskill', 4, 232, 110000);

INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2127, 'Mochizuki', 3, 310, 80000);

INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2133, 'Niessner', 3, 052, 75000);

INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2134, 'Esparza', 3, 309, 85000);

INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2136, 'Ng', 4, 036, 100000);

INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2137, 'Cico', 2, 007, 60000);

INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2138, 'Bedalli', 2, 010, 62000);

INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2139, 'Mancellari', 1, 112, 45000);

INSERT INTO Professors(StaffId, Name, RangId, Room, Salary)
VALUES (2140, 'Yozgatli', 1, 220, 50000);



INSERT INTO Assistants(StaffId, Name, Specialty, Boss)
VALUES (3002, 'Rustemi', 'FPGA', 2125);

INSERT INTO Assistants(StaffId, Name, Specialty, Boss)
VALUES (3003, 'Oliver', 'Shooting Arrows', 2125);

INSERT INTO Assistants(StaffId, Name, Specialty, Boss)
VALUES (3004, 'Felicity', 'Hacking', 2126);

INSERT INTO Assistants(StaffId, Name, Specialty, Boss)
VALUES (3005, 'Diggle', 'Shooting guns', 2127);

INSERT INTO Assistants(StaffId, Name, Specialty, Boss)
VALUES (3006, 'Speedy', 'Shooting Arrows', 2127);

INSERT INTO Assistants(StaffId, Name, Specialty, Boss)
VALUES (3007, 'Darhk', 'Magic', 2134);



INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (5001, 'Databases', 8, 2137);

INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (5041, 'Data Structures', 8, 2125);

INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (5043, 'Calculus II', 6, 2126);

INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (5049, 'English II', 4, 2125);

INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (4052, 'Digital Design', 8, 2125);

INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (5052, 'Web Applications', 6, 2126);

INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (5216, 'English I', 4, 2126);

INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (5259, 'Quantum Computing', 8, 2133);

INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (5022, 'Chemistry', 4, 2134);

INSERT INTO Courses(CourseId, Title, ECTS, taughtBy)
VALUES (4630, 'Software Engineering', 8, 2137);



INSERT INTO attend(StuId, CourseId)
VALUES (26120, 5001);

INSERT INTO attend(StuId, CourseId)
VALUES (27550, 5001);

INSERT INTO attend(StuId, CourseId)
VALUES (27550, 4052);

INSERT INTO attend(StuId, CourseId)
VALUES (28106, 5041);

INSERT INTO attend(StuId, CourseId)
VALUES (28106, 5052);

INSERT INTO attend(StuId, CourseId)
VALUES (28106, 5216);

INSERT INTO attend(StuId, CourseId)
VALUES (28106, 5259);

INSERT INTO attend(StuId, CourseId)
VALUES (29120, 5001);

INSERT INTO attend(StuId, CourseId)
VALUES (29120, 5041);

INSERT INTO attend(StuId, CourseId)
VALUES (29120, 5049);

INSERT INTO attend(StuId, CourseId)
VALUES (29555, 5022);

INSERT INTO attend(StuId, CourseId)
VALUES (25403, 5022);

INSERT INTO attend(StuId, CourseId)
VALUES (29555, 5001);



INSERT INTO requires(Predecessor, Successor)
VALUES (5001, 5041);

INSERT INTO requires(Predecessor, Successor)
VALUES (5001, 5043);

INSERT INTO requires(Predecessor, Successor)
VALUES (5001, 5049);

INSERT INTO requires(Predecessor, Successor)
VALUES (5041, 5216);

INSERT INTO requires(Predecessor, Successor)
VALUES (5043, 5052);

INSERT INTO requires(Predecessor, Successor)
VALUES (5041, 5052);

INSERT INTO requires(Predecessor, Successor)
VALUES (5052, 5259);



INSERT INTO exam(StuId, CourseId, Grade)
VALUES (28106, 5001, 4.0);

INSERT INTO exam(StuId, CourseId, Grade)
VALUES (25403, 5041, 3.0);

INSERT INTO exam(StuId, CourseId, Grade)
VALUES (27550, 4630, 3.0);

