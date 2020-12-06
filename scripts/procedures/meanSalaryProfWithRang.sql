DELIMITER $$
drop procedure if exists meanSalaryProfWithRang$$
create procedure meanSalaryProfWithRang(IN RangId INTEGER, INOUT MeanSalary INTEGER)
/* What is the mean salary of professors with the given RangId ?
   Important for discussing the salary with a new professor or updating an existing professor's salary
 */
 BEGIN
    SET MeanSalary = (
        SELECT sum(p.Salary) / count(p.Salary)
        FROM Professors p
        WHERE p.RangId = RangId
    );
    # if no professor with that rang was found, MeanSalary = null
end $$