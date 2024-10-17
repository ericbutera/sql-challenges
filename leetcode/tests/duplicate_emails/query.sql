SELECT Email FROM (
    SELECT
        count(email) dupes,
        email `Email`
    FROM Person p
    GROUP BY (email)
    HAVING dupes > 1
) Duplicates
