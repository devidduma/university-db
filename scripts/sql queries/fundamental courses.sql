/* Let's find fundamental courses. A course is a fundamental course,
   if he is a predecessor to two other courses and has at least 4 ECTS.
   */

# output course information
select c.CourseId, c.Title
# lookup on requires table if it is a predecessor
from Courses c join requires req
    on c.CourseId = req.Predecessor
#ECTS constriction
where c.ECTS >= 4
# count on a per course (CourseId) basis
# count gives us how many times it is a predecessor
group by c.CourseId, c.Title
having count(*) >= 2