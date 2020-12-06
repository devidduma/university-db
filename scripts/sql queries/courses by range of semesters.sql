/* Which courses have students of the given range of semesters taken ? */

# attendance list contains duplicate courses
select distinct c.CourseId, c.Title
from Courses c,
     attend a,
     Students s
# fetch course info
where c.CourseId = a.CourseId
  # fetch student info
  and a.StuId = s.StuId
  # select (relational algebra)
  and s.Semester between 1 and 4
order by c.CourseId;