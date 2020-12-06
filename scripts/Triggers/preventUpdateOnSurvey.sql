DELIMITER $$
drop trigger if exists preventUpdateOnSurvey$$
CREATE TRIGGER preventUpdateOnSurvey
BEFORE UPDATE ON ProfessorsSemesterlySurvey
FOR EACH ROW
BEGIN

SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
SET MESSAGE_TEXT = 'This table is meant to be used for statistical analysis. You can not change the student\'s opinion.';

END$$

DELIMITER ;

/* Test */
UPDATE ProfessorsSemesterlySurvey
SET Review = 4
WHERE CourseId = 4052