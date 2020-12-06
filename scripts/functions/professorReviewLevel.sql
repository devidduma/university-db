DELIMITER $$
DROP FUNCTION if exists professorReviewLevel$$
CREATE FUNCTION professorReviewLevel(
	professorId integer
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE professorReviewLevel VARCHAR(20);
    DECLARE meanReviewForProfessor REAL;

    # calling a stored function from another stored function
    set meanReviewForProfessor = (
        select meanReviewForProfessor(professorId)
    );

    if(meanReviewForProfessor = 4) then
        set professorReviewLevel = 'Out of this world!';
    elseif(meanReviewForProfessor >= 3.5) then
        set meanReviewForProfessor = 'Astonishing!';
    elseif(meanReviewForProfessor >= 3) then
        set meanReviewForProfessor = 'Very Good!';
    elseif(meanReviewForProfessor >= 2.5) then
        set meanReviewForProfessor = 'Good!';
    elseif(meanReviewForProfessor >= 2) then
        set meanReviewForProfessor = 'Satisfiable';
    else
        set meanReviewForProfessor = 'Not Good';
    end if ;

    return professorReviewLevel;
END $$
DELIMITER ;