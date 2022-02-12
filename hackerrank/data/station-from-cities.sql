-- select * from station;
-- truncate station;
-- data originally from https://raw.githubusercontent.com/kelvins/US-Cities-Database/main/us_cities.sql
insert into sqlchallenges.station (`city`,`state`,`lat_n`,`long_w`)
select
  SUBSTR(c.CITY, 1, 20) AS `city`,
  s.STATE_CODE `state`,
  c.LATITUDE `lat_n`,
  c.LONGITUDE `long_w`
from US_LOCATIONS.US_CITIES c
inner join US_LOCATIONS.US_STATES s ON (s.ID = c.ID_STATE)
