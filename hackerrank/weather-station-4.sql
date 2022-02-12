-- raw query
-- gets unreadable fast
select
(select count(id) from station)
-
(select count(city) FROM (select distinct city from station) unique_cities)

-- cte
-- forces some structure around concepts
with
	total_cities AS (select count(id) `total` from station),
	unique_cities AS (select count(city) `distinct` FROM (select distinct city from station) AS `distinct_table`)
select (`total` - `distinct`) AS `diff` from total_cities join unique_cities

-- variables
-- clean and tidy
SET @total_cities = (select count(id) from station);
SET @unique_cities = (select count(city) FROM (select distinct city from station) unique_cities);
SELECT @total_cities - @unique_cities;

delimiter ;

CREATE PROCEDURE citycount (IN state_name CHAR(2), OUT cities INT)
   BEGIN
     SELECT COUNT(s.id) INTO cities FROM station s WHERE s.state=state_name;
   END

delimiter ;

CALL citycount('MI', @citiez);
