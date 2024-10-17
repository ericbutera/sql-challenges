SELECT
    p.firstName,
    p.lastName,
    COALESCE(a.city, 'null') `city`,
    COALESCE(a.state, 'null') `state`
FROM Person p
LEFT JOIN Address a ON (a.personId = p.personId)
