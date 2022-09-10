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
SELECT DISTINCT course_name
FROM enrolled
WHERE student_id in (
    SELECT student_id
    FROM majorsin
    WHERE dept_name like ('BIF')
);
--5
SELECT name
FROM student
WHERE student.id not in (
    SELECT student_id
    FROM enrolled
    GROUP BY student_id);
--6
