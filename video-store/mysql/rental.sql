SELECT
  r.movie_id,
  m.name AS movie_name,
  r.customer_id,
  c.name AS customer_name,
  r.rented_at,
  r.due_at,
  r.returned_at
FROM rental r
INNER JOIN movies m ON (m.id = r.movie_id)
LEFT JOIN customer c ON (c.id = r.customer_id)
