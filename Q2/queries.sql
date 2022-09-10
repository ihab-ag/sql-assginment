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
SELECT  count(student_id), dept_name 
FROM majorsin
GROUP BY dept_name;
-- 4
SELECT enrolled.course_name as course_name
FROM majorsin, enrolled
WHERE dept_name like ('BIF') and enrolled.student_id=majorsin.student_id;
--5
SELECT name
FROM student
WHERE student.id not in (
    SELECT student_id
    FROM enrolled
    GROUP BY student_id);
