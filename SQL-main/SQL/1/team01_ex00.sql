-- alter table "user" rename to person;

CREATE OR REPLACE FUNCTION last_rate(currency_name VARCHAR)
RETURNS NUMERIC AS $$
DECLARE
    rate NUMERIC;
BEGIN
		if currency_name IS NULL THEN rate = 1.0;
		else
        SELECT rate_to_usd into rate
        FROM currency
        WHERE name = currency_name
        ORDER BY updated DESC
		limit 1;
		end if;
		return rate;

END;
$$ LANGUAGE plpgsql;

SELECT
    COALESCE(person.name, 'not defined') AS name,
    COALESCE(person.lastname, 'not defined') AS lastname,
    result.type,
    result.volume,
    COALESCE(cur.name, 'not defined') AS currency_name,
    last_rate(cur.name) AS last_rate_to_usd,
    result.volume::numeric  *  last_rate(cur.name) AS total_volume_in_usd
FROM (
    SELECT
        user_id,
        type,
        currency_id,
        SUM(money) AS volume
    FROM balance
    GROUP BY user_id, type, currency_id
) AS result
FULL JOIN person ON person.id = result.user_id
FULL JOIN (
    SELECT
        id,
        name,
        MAX(updated) AS last_updated
    FROM currency
    GROUP BY id, name
) AS cur ON cur.id = result.currency_id
ORDER BY 1 DESC, 2, 3;

