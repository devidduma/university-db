/* How many acquaintances does each student have ?
   Assume that in a lecture everyone knows each other.
   */

# let's find for each student it's acquaintance
# and save the results as (Student, Acquaintance) tuple
with Acquaintances as (
    # since (StuId, CourseId) is primary key in attend table
    # we won't have duplicates, so we don't need distinct keyword
    select a1.StuId as Student,
        a2.StuId as Acquaintance
    # they know each other from lectures
    from attend a1
        join attend a2
        on a1.CourseId = a2.CourseId
    # acquaintances have distinct StuId
    where a2.StuId <> a1.StuId
),
# now let's count the acquaintances for each student
# we count them im a separate with statement, so that we can
# left outer join them in the main statement and be able to do
# case when is null then 0 later
No_Acquaintances as (
    select a.Student, count(*) as No_Acquaintances
    from Acquaintances a
    group by a.Student
)

select s.StuId, s.Name,
       # this is done for the students that have no acquaintances
       # left outer join produces null in the No_Acquaintances field
       # for them, so we 'cast' it to 0
       (case
           when no_a.No_Acquaintances is null then 0
           else no_a.No_Acquaintances end
        ) as No_Acquaintances
# left outer join the number of acquaintances for each student
from Students s
    left outer join No_Acquaintances no_a
    on s.StuId = no_a.Student
order by No_Acquaintances desc;