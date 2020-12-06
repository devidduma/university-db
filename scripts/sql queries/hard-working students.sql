/* Which students are attending more ECTS than the average ECTS for all students ?*/

# let's find the total ECTS per student
with ECTSPerStudent as (
    select s.StuId,
           # select sum of ECTS grouped by s.StudId
           # case handles null values from left outer join
           (case
                when sum(c.ECTS) is null
                    then 0
                else sum(c.ECTS)
               end) as ECTSSum
    from Students s
             left outer join attend a on s.StuId = a.StuId
             left outer join Courses c on a.CourseId = c.CourseId
    group by s.StuId
)

# output hard-working student info
select s.*,
       # output the average ECTS total
       (select avg(ECTSSum) from ECTSPerStudent) as averageECTSSum,
       # output student ECTS total
       ects.ECTSSum
from Students s
         join ECTSPerStudent ects on s.StuId = ects.StuId
where s.StuId in (select ects.StuId
                  from ECTSPerStudent ects
                  where ects.ECTSSum > (select avg(ECTSSum)
                                        from ECTSPerStudent)
);