/* How many courses, on average, do students attend ? */

# divide total number of courses attended with number of students
select aCount / cast(sCount as decimal (10 ,4)) as AverageNoCourses
# count pairs (StudentId, CourseId) in attend table
from (select count(*) as aCount
    from attend
    ) a,
     #count students
    (select count(*) as sCount
    from Students
    ) s