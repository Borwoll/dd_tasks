-- motorcycle_types.sql

-- SQL query to display motorcycle types, total count, discontinued count, and active count
SELECT
    t.name AS type_name,
    COUNT(m.id) AS total_motorcycles,
    SUM(m.discontinued) AS discontinued_motorcycles,
    COUNT(m.id) - SUM(m.discontinued) AS active_motorcycles
FROM
    types AS t
LEFT JOIN
    motorcycles AS m ON t.id = m.type_id
GROUP BY
    t.name;