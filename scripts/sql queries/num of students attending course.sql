/* How many students attend each course ? */

# count attendances grouped by CourseId
select c.CourseId , c.Title , count(a.StuId) as  numAttenders
# if c does not have any attenders, fill in null values
# count will count them as 0
from Courses c left  outer  join attend a
    on c.CourseId = a.CourseId
# we want to count based on CourseId
group by c.CourseId , c.Title
order by  numAttenders  desc;