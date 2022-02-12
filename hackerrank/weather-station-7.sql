SELECT
	city
FROM (SELECT DISTINCT city FROM station ORDER BY city) AS cities
WHERE
	SUBSTR(city, -1) IN ('A','E','I','O','U')