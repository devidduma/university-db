/* What is the average semester for the students of the given professor ? */

with StudentsOfProfessor as (
    select distinct
           s.StuId,
           s.Semester
    # cross product
    from Students s,
         attend a,
         Courses c,
         Professors p
    # select criterias
    where s.StuId = a.StuId
      and a.CourseId = c.CourseId
      and c.taughtBy = p.StaffId
      and p.Name = 'Sokrates'
)

select avg(Semester)
from StudentsOfProfessor;