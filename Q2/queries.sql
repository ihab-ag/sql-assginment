-- 1
SELECT *
FROM room
WHERE capacity > 99;
-- 2
SELECT * FROM  course
WHERE start_time=(
    SELECT start_time 
    FROM course
    order by start_time ASC 
    limit 1);
--3
-
-- 4
SELECT DISTINCT c.name
FROM  course as c, majorsin as m, department as d, enrolled e
WHERE c.crn= e.course_id and e.student_id=m.student_id and m.dept_name=d.id and d.name="BIF";
--5
SELECT s.name
FROM student as s
WHERE s.id not in (SELECT DISTINCT e.student_id FROM  enrolled as e);
--6
SELECT count(student_id)
FROM enrolled
WHERE student_id in (
    SELECT student_id
    FROM majorsin
    WHERE dept_name like ('CS')
) and course_name like ('CSC275');
-- 7
SELECT count(student_id)
FROM enrolled
WHERE student_id in (
    SELECT student_id
    FROM majorsin
    WHERE dept_name like ('CS')
)
GROUP BY student_id;
-- 8
SELECT student_id, count(dept_name)
FROM majorsin
GROUP BY student_id;
--9
SELECT dept_name, count(student_id)
FROM majorsin
GROUP BY dept_name
HAVING count(student_id)>0;