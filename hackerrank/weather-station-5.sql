-- https://www.hackerrank.com/challenges/weather-observation-station-5

-- simple union, the order by and limit are what allow the precise find smallest & largest but always display both in alpha order
-- Eg:
-- Aaa 3
-- Mmmmmm Aa Aaaaa Aaaaa 21

(SELECT city, LENGTH(city) len FROM station GROUP BY city ORDER BY len ASC, city ASC LIMIT 1)
UNION
(SELECT city, LENGTH(city) len FROM station GROUP BY city ORDER BY len DESC, city ASC LIMIT 1)
ORDER BY city

-- use window function
WITH len_data AS (
SELECT
	city,
	length(city) len,
	max(length(city)) over () max_length,
	min(length(city)) over () min_length
from station
group by city
order by len, city
)
(SELECT city, len FROM len_data WHERE len = min_length LIMIT 1)
UNION
(SELECT city, len FROM len_data WHERE len = max_length LIMIT 1)
