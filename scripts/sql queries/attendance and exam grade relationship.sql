/* How does attendance affect the average grade of the students for each course ?
   Let's analyze it.
   Note: if we don't have enough grades for a category (attended or not attended), we output null.
   */

# for each CourseId save the average grade of students that did not attend the lectures
with notAttended as (
    # select from group by is intuitive
    select e.CourseId, avg(e.Grade) as average
    from exam e
    # filter out the exams with StuId that has attended the lectures
    where not exists(select *
                     from attend a
                     where a.StuId = e.StuId
                       and a.CourseId = e.CourseId)
    group by e.CourseId
),
# for each CourseId save the average grade of students that did attend the lectures
attended as (
    # select from group by is intuitive
    select e.CourseId, avg(e.Grade) as average
    from exam e
    # if exam.CourseId is in the list of courses that exam.StuId has attended
    where e.CourseId in (select a.CourseId
                    from attend a
                    where a.StuId = e.StuId)
    group by e.CourseId
)

# Output for each course the CourseId, the Title,
# the average grade for the 'did not attend' group
# and the average grade for the 'did attend' group
select c.CourseId, c.Title, notAttended.average, attended.average
from Courses c
left join attended
    on c.CourseId = attended.CourseId
left join notAttended
    on c.CourseId = notAttended.CourseId;