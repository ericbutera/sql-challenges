-- how many copies of <movie> do we have in-stock right now?
SELECT 
  `id`, 
  `name`
FROM movies 
WHERE available > 0

SELECT
*
FROM rental
