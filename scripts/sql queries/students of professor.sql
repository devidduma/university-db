/* Which students does Professor with given name have, in current semester?
   Outputs the student's and the corresponding course's information. Duplicates of students means
   the student takes multiple courses with the same professor.
   */

select c.CourseId, c.Title, s.StuId, s.Name
# cross product
from Students s,
     attend a,
     Courses c,
     Professors p
# select criterias
where s.StuId = a.StuId
    and a.CourseId = c.CourseId
    and c.taughtBy = p.StaffId
    and p.Name = 'Levine'
order by c.CourseId;