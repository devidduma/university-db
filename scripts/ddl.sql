DROP TABLE IF EXISTS ProfessorsSemesterlySurvey;
DROP TABLE IF EXISTS attend;
DROP TABLE IF EXISTS requires;
DROP TABLE IF EXISTS exam;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Assistants;
DROP TABLE IF EXISTS SemesterlyBonus;
DROP TABLE IF EXISTS Professors;
DROP TABLE IF EXISTS ProfessorsRang;

CREATE TABLE Students
(
    StuId    INTEGER PRIMARY KEY,
    Name     VARCHAR(30) NOT NULL,
    Semester INTEGER     NOT NULL
);

CREATE TABLE ProfessorsRang
(
    RangId INTEGER PRIMARY KEY,
    Title  VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Professors
(
    StaffId INTEGER PRIMARY KEY,
    Name    VARCHAR(30) NOT NULL,
    RangId  INTEGER     NOT NULL,
    FOREIGN KEY (RangId) REFERENCES ProfessorsRang (RangId) ON DELETE NO ACTION,
    Room    INTEGER     NOT NULL UNIQUE,
    Salary  INTEGER     NOT NULL CHECK ( Salary > 0 )
    #if update set rang to different value and salary set to 0, trigger is executed
);


CREATE TABLE SemesterlyBonus
(
    StaffId INTEGER PRIMARY KEY,
    FOREIGN KEY (StaffId) REFERENCES Professors (StaffId) ON DELETE CASCADE,
    Bonus   INTEGER NOT NULL
);

CREATE TABLE Assistants
(
    StaffId   INTEGER PRIMARY KEY,
    Name      VARCHAR(30) NOT NULL,
    Specialty VARCHAR(30),
    Boss      INTEGER     NOT NULL,
    FOREIGN KEY (Boss) REFERENCES Professors (StaffId) ON DELETE NO ACTION
);

CREATE TABLE Courses
(
    CourseId INTEGER PRIMARY KEY,
    Title    VARCHAR(30) NOT NULL,
    ECTS     INTEGER     NOT NULL CHECK ( ECTS >= 2 and ECTS <= 10),
    taughtBy INTEGER     NOT NULL,
    FOREIGN KEY (taughtBy) REFERENCES Professors (StaffId) ON DELETE NO ACTION
);

# contains attendance information (>=60%) on current semester only
# students are allowed to give exams if they did not attend 60% of the lectures
CREATE TABLE attend
(
    StuId    INTEGER NOT NULL,
    FOREIGN KEY (StuId) REFERENCES Students (StuId) ON DELETE CASCADE,
    CourseId INTEGER NOT NULL,
    FOREIGN KEY (CourseId) REFERENCES Courses (CourseId) ON DELETE CASCADE,
    PRIMARY KEY (StuId, CourseId)
);

CREATE TABLE ProfessorsSemesterlySurvey
(
    StuId    INTEGER,
    CourseId INTEGER,
    Review   INTEGER NOT NULL CHECK ( Review >= 1 and Review <= 4 ),
    FOREIGN KEY (StuId, CourseId) REFERENCES attend (StuId, CourseId) ON DELETE CASCADE,
    PRIMARY KEY (StuId, CourseId)
);

CREATE TABLE requires
(
    Predecessor INTEGER,
    FOREIGN KEY (Predecessor) REFERENCES Courses (CourseId) ON DELETE CASCADE,
    Successor   INTEGER,
    FOREIGN KEY (Successor) REFERENCES Courses (CourseId) ON DELETE NO ACTION,
    PRIMARY KEY (Predecessor, Successor)
);

# contains exam information on current semester only
CREATE TABLE exam
(
    StuId    INTEGER,
    FOREIGN KEY (StuId) REFERENCES Students (StuId) ON DELETE CASCADE,
    CourseId INTEGER,
    FOREIGN KEY (CourseId) REFERENCES Courses (CourseId) ON DELETE NO ACTION,
    Grade    NUMERIC(2, 1) NOT NULL CHECK (Grade between 0.0 and 4.0),
    PRIMARY KEY (StuId, CourseId)
);

