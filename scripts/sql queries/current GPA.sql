/* What is the curent GPA of students that have given exams ?
   Assume that for each (student, course) tuple only the latest given exam is saved.
   */

# current GPA per student (group by StudId) = sum(grade * ECTS) / sum(ECTS)
select s.StuId, s.Name, sum(e.Grade * c.ECTS) / sum(c.ECTS) as currentGPA
from Students s,
     exam e,
     Courses c
# join criterias
where s.StuId = e.StuId
  and e.CourseId = c.CourseId
# we want the aggregate function to work on a per student basis
group by s.StuId, s.name