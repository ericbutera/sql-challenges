SELECT city FROM (
SELECT
	SUBSTR(city, -1) AS last_letter,
	SUBSTR(city, 1, 1) AS first_letter,
	city
FROM (SELECT DISTINCT city FROM station ORDER BY city) AS cities
) letters
WHERE
	first_letter IN ('A','E','I','O','U') AND
	last_letter IN ('A','E','I','O','U')
