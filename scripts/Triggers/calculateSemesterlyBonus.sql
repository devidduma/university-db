DELIMITER $$
drop trigger if exists calculateSemesterlyBonus$$
CREATE TRIGGER calculateSemesterlyBonus
after insert on ProfessorsSemesterlySurvey
for each row
BEGIN

declare professorId integer;
declare numReviewsForProfessor integer;
declare meanReviewForProfessor REAL;
declare numStudentsOfProfessor integer;

# let's find the professor that teaches the course
set professorId = (
    select c.taughtBy
    from Courses c
    where c.CourseId = NEW.CourseId
    );

# number of reviews for that professor for any course he teaches
# guaranteed there is at least one review, since the trigger is executed after inserting new tuple
set numReviewsForProfessor = (
    select count(ps.Review)
    from ProfessorsSemesterlySurvey ps
    join Courses c
        on ps.CourseId = c.CourseId
    where c.taughtBy = professorId
    );

# calling procedure
# if professorId not found (could have quit the job), numStudentsOfProfessor = null, so no semester bonus for him
# numStudentsOfProfessor could also be null if professor did not give any lectures this semester
call numStudentsOfProfessorThisSemester(professorId,numStudentsOfProfessor);

# NOTE: change comparison value for numReviewsForProfessor accordingly
if numStudentsOfProfessor is not null and numReviewsForProfessor > numStudentsOfProfessor*0.1 then
    # calling function
    set meanReviewForProfessor = (
        select meanReviewForProfessor(professorId)
        );

    # calling procedure
    call updateBonusForProfessor(professorId, meanReviewForProfessor);
end if ;
END $$

DELIMITER ;

/* Test */
INSERT INTO ProfessorsSemesterlySurvey(StuId, CourseId, Review)
VALUES (27550,4052, 3);
INSERT INTO ProfessorsSemesterlySurvey(StuId, CourseId, Review)
VALUES (26120,5001, 3.5);
INSERT INTO ProfessorsSemesterlySurvey(StuId, CourseId, Review)
VALUES (27550,5001, 3);
INSERT INTO ProfessorsSemesterlySurvey(StuId, CourseId, Review)
VALUES (29120,5001,3.2);
INSERT INTO ProfessorsSemesterlySurvey(StuId, CourseId, Review)
VALUES (29555,5001,3.1);
