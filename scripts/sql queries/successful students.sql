/* Which students passed all courses that they attended ?
   Note: there might be students that did not attend any lectures and still passed all exams,
   but we do not care for those students.
   */

# for each student that has attended at least one course...
select distinct s.*
# note: the 'join attend' is here to filter out students that don't attend any lecture,
# so that the not exists() does not evaluate to true for such students
from Students s join attend a2 on s.StuId = a2.StuId
    # ...there does not exist an attended course...
    where not exists(
        select *
        from attend a
        where s.StuId = a.StuId
        # ...for which there does not exist an exam
        # with grade >= 1
        and not exists(
            select *
            from exam e
            where s.StuId = e.StuId
            and a.CourseId = e.CourseId
            and e.Grade >= 1.0
        )
    )