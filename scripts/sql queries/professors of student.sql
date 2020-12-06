/* Which professors does student know from lectures in this semester ? */

select p.StaffId, p.Name
from Professors p,
     attend a,
     Courses c,
     Students s
# courses of professor
where p.StaffId = c.taughtBy
  # courses attended by student
  and c.CourseId = a.CourseId
  # fetch student info
  and a.StuId = s.StuId
  # select (relational algebra)
  and s.Name = 'Devid';