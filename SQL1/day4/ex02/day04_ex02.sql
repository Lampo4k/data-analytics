CREATE VIEW v_generated_dates AS
SELECT tb::date AS generated_date
FROM generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day'::interval) AS tb
ORDER BY 1;

