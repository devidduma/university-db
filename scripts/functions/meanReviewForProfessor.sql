DELIMITER $$
DROP FUNCTION if exists meanReviewForProfessor$$
CREATE FUNCTION meanReviewForProfessor(
	professorId integer
)
RETURNS REAL
DETERMINISTIC
BEGIN
    DECLARE meanReviewForProfessor REAL;

    set meanReviewForProfessor = (
        select sum(ps.Review) / count(ps.Review)
        from ProfessorsSemesterlySurvey ps
        join Courses c
            on ps.CourseId = c.CourseId
        where c.taughtBy = professorId
        );

    return meanReviewForProfessor;
END $$
DELIMITER ;