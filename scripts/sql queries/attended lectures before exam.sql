/* Which students attended the lectures before taking the exam ? */

# we select distinct since there might be duplicates
select distinct s.*
from Students s
    # for each student consider only the courses he attended
    join attend a on s.StuId = a.StuId
    # for course attended consider the exam only if the exam was given
    join exam e on a.CourseId = e.CourseId and s.StuId = e.StuId