DELIMITER $$
DROP FUNCTION if exists studentLevel$$
CREATE FUNCTION studentLevel(
	studentId integer
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE semester INTEGER;
    DECLARE studentLevel VARCHAR(20);

    SET semester = (
            select s.Semester
            from Students s
            where s.StuId = studentId
        );

    if(semester > 15) then
        set studentLevel = 'Hall of Fame';
    elseif(semester > 10) then
        set studentLevel = 'Veteran';
    elseif(semester > 7) then
        set studentLevel = 'Loyal';
    elseif(semester > 4) then
        set studentLevel = 'Experienced';
    elseif(semester > 2 ) then
        set studentLevel = 'Cadet';
    else
        set studentLevel = 'Newcomer';
    end if;

    return studentLevel;
END $$
DELIMITER ;