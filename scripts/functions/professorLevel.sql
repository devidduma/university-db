DELIMITER $$
DROP FUNCTION if exists professorLevel$$
CREATE FUNCTION professorLevel(
	professorId integer
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE professorLevel VARCHAR(20);
    DECLARE sumECTSTaught INTEGER;

    SET sumECTSTaught = (
            select sum(c.ECTS)
            from Professors p
            join Courses c
                on p.StaffId = c.taughtBy
            where p.StaffId = professorId
        );
    if(sumECTSTaught is null) then
        set professorLevel = 'Unoccupied';
    elseif(sumECTSTaught > 12) then
        set professorLevel = 'Busy Bee';
    elseif(sumECTSTaught > 8) then
        set professorLevel = 'Relatively busy';
    else
        set professorLevel = 'Not too occupied';
    end if ;

    return professorLevel;
END $$
DELIMITER ;