/* How many required courses should you complete before taking the course in the given title?
   Assume that alternate paths of required courses have same length, meaning you can not 'cheat'
   your way into taking a course, you don't have that possibility. */

with recursive requirementRecursive(CourseId, Counter) as (
    # Initial select: initialize working recordset
    (
        select c.CourseId, 0
        from Courses c
        where c.Title = 'Quantum Computing'
    )
    # union, we do not care for duplicates
    # recursively update recordset and in the end do union
    union
    (
        # use current recordset's CourseId as Successor and find it's
        # Predecessor. select Predecessor and increment counter
        select req.Predecessor, reqRec.Counter + 1
        from requirementRecursive reqRec join requires req
             on reqRec.CourseId = req.Successor
    )
)

select max(Counter) as no_of_requirements
from requirementRecursive;