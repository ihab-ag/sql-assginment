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
SELECT COUNT(e.student_id)
FROM enrolled as e, course as c, majorsin as m, department as d
WHERE e.student_id=m.student_id and m.dept_name=d.id and d.name="CS" and e.course_id=c.crn and c.name="CSC275";
-- 7
SELECT COUNT(s.id)
FROM enrolled as e, majorsin as m, department as d, student as s
WHERE s.id=e.student_id and e.student_id=m.student_id and m.dept_name=d.id and d.name="CS";
-- 8
SELECT s.name, count(m.dept_name)
FROM student as s, majorsin as m
WHERE s.id=m.student_id
GROUP BY m.student_id;
--9
SELECT dept_name, count(student_id)
FROM majorsin
GROUP BY dept_name
HAVING count(student_id)>0;