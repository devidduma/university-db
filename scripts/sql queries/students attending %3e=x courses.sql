/* Students attending more than or equal to a given amount of courses. */

select s.StuId, s.Name
from Students s join attend a
    on s.StuId = a.StuId
# count on a per student (StudId) basis
group by s.StuId, s.Name
having count(*) >= 3