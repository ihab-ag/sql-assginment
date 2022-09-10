-- Q1
SELECT movie.name as name, movie.earnings_rank as earning_rank
FROM movie, oscar
WHERE movie.id=oscar.movie_id
ORDER BY movie.earnings_rank
LIMIT 1