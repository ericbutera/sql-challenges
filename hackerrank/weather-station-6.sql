-- https://www.hackerrank.com/challenges/weather-observation-station-6
SELECT
	city
FROM (SELECT DISTINCT city FROM station ORDER BY city) AS cities
WHERE
	SUBSTR(city, 1, 1) IN ('A','E','I','O','U')
