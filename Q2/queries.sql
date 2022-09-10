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