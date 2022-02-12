-- not in
SELECT
	DISTINCT city
FROM station
WHERE
	SUBSTR(city, 1, 1) NOT IN ('A','E','I','O','U') AND
	SUBSTR(city, -1) NOT IN ('A','E','I','O','U')

-- using a column to store rows to keep
SELECT city FROM (
	SELECT
		DISTINCT city,
		(case
			when SUBSTR(city, 1, 1) IN ('A','E','I','O','U') then 1
			else 0
		end) as has_vowel
	from station
) base
WHERE has_vowel=1