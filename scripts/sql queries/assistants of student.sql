/* Which assistants does student know from lectures ? */

select assist.Name, assist.StaffId
from Assistants assist,
     Professors p,
     Courses c,
     attend att,
     Students s
# assistants of professor
where assist.Boss = p.StaffId
  # courses of professor
  and p.StaffId = c.CourseId
  # students attending courses
  and c.CourseId = att.CourseId
  # fetch student information
  and att.StuId = s.StuId
  # select (relational algebra)
  and s.Name = 'Fichte';