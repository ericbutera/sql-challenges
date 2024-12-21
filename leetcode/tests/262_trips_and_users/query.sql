
WITH data AS (
SELECT
	t.request_at,
	CASE 
		WHEN status='cancelled_by_driver' THEN 1	
		WHEN status='cancelled_by_client' THEN 1
		ELSE 0
	END AS cancelled
FROM Trips t
INNER JOIN Users client ON (client.users_id = t.client_id AND client.banned='No')
INNER JOIN Users driver ON (driver.users_id = t.driver_id AND driver.banned='No')
WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
ORDER BY t.request_at
)
SELECT 
	request_at AS 'Day',
    ROUND(CAST(cancelled AS FLOAT) / total, 2) AS 'Cancellation Rate'
FROM (
	SELECT 
		request_at,
		SUM(cancelled) AS cancelled,
		COUNT(*) AS total
	FROM data
	GROUP BY request_at
) AS trips_users
ORDER BY request_at;