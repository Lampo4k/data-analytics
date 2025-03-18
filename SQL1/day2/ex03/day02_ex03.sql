WITH MissingDaysCTE (missing_day)
AS
(
    SELECT to_char(missing_day, 'YYYY-MM-DD') AS missing_day
    FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_day
    WHERE NOT EXISTS (
        SELECT 1
        FROM person_visits p1
        JOIN person_visits p2 ON p1.visit_date = p2.visit_date
        WHERE p1.person_id IN (1, 2)
        AND p2.person_id IN (1, 2)
        AND missing_day = p1.visit_date
    )
)
SELECT missing_day
FROM MissingDaysCTE
ORDER BY missing_day;