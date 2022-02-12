-- https://www.hackerrank.com/challenges/weather-observation-station-5

-- simple union, the order by and limit are what allow the precise find smallest & largest but always display both in alpha order
-- Eg:
-- Aaa 3
-- Mmmmmm Aa Aaaaa Aaaaa 21

(SELECT city, LENGTH(city) len FROM station GROUP BY city ORDER BY len ASC, city ASC LIMIT 1)
UNION
(SELECT city, LENGTH(city) len FROM station GROUP BY city ORDER BY len DESC, city ASC LIMIT 1)
ORDER BY city

-- something like this would be interesting to lower amont of work against station
WITH city_lengths AS (
SELECT
	city,
	LENGTH(city) len
FROM station
group by city
ORDER BY city
)
SELECT
	MIN(len) as minimum,
	MAX(len) as maximum
FROM city_lengths
