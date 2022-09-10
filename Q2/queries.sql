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