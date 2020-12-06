DELIMITER $$
drop procedure if exists salaryOfProfessor$$
create procedure salaryOfProfessor(IN professorId INTEGER, INOUT salary INTEGER)
/* Updates the semesterly bonus for professor given his meanReview so far.
   */
BEGIN
    set salary = (
            select p.Salary
            from Professors p
            where p.StaffId = professorId
        );
end $$