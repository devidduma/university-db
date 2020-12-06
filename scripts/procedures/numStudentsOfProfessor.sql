DELIMITER $$
drop procedure if exists numStudentsOfProfessorThisSemester$$
create procedure numStudentsOfProfessorThisSemester(IN professorId INTEGER, INOUT numStudents INTEGER)
/* How many students does professor with given name have in this semester?
   */
BEGIN
    SET numStudents = (
            select count(distinct s.StuId)
            # cross product
            from Students s,
                 attend a,
                 Courses c,
                 Professors p
            # join criteria
            where s.StuId = a.StuId
                and a.CourseId = c.CourseId
                and c.taughtBy = p.StaffId
                #select criteria
                and p.StaffId = professorId
        );
end $$