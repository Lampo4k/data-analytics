SELECT to_char(missing_day, 'YYYY-MM-DD') AS missing_day
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) as missing_day
WHERE not exists (
    SELECT 1
    FROM person_visits
    WHERE person_id in (1, 2) and visit_date = missing_day
)
ORDER BY missing_day;
