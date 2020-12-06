DELIMITER $$
drop procedure if exists incrementStudentsSemester$$
create procedure incrementStudentsSemester()
/* Increments the semester of each student
   */
BEGIN
    UPDATE Students
    SET Semester = Semester + 1;
end $$