DELIMITER $$
drop procedure if exists updateBonusForProfessor$$
create procedure updateBonusForProfessor(IN professorId INTEGER, INOUT meanReview REAL)
/* Updates the semesterly bonus for professor given his meanReview so far.
   */
BEGIN
    DECLARE doesEntryExist BOOL;
    DECLARE salaryOfProfessor INTEGER;
    DECLARE bonusOfProfessor INTEGER;
    DECLARE truncatedMeanReview INTEGER;
    set doesEntryExist = (
            select case
                when sum(b.StaffId) is not null or 0 then true
                else false
                end
            from SemesterlyBonus b
            where b.StaffId = professorId
        );

    # calculate bonus: based on performance in reviews
    # and current salary. why current salary? cause life is not fair
    call salaryOfProfessor(professorId, salaryOfProfessor);
    set truncatedMeanReview = meanReview - 2;
    if truncatedMeanReview < 0 then
        set truncatedMeanReview = 0;
    end if ;
    set bonusOfProfessor = salaryOfProfessor * truncatedMeanReview * 0.1;

    if not doesEntryExist then
        INSERT INTO SemesterlyBonus(StaffId, Bonus)
        VALUES (professorId, bonusOfProfessor);
    else
        UPDATE SemesterlyBonus
        SET Bonus = bonusOfProfessor
        WHERE StaffId = professorId;
    end if ;
end $$