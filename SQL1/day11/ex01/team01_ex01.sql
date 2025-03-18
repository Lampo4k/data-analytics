insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH func AS (
    SELECT
        COALESCE(person.name, '<not defined>') AS name,
        COALESCE(person.lastname, '<not defined>') AS lastname,
        c.name AS currency_name,
        balance.money,
        COALESCE(
            (SELECT currency.rate_to_usd
             FROM currency
             WHERE currency.id = balance.currency_id AND currency.updated < balance.updated
             ORDER BY currency.updated DESC
             LIMIT 1),

            (SELECT currency.rate_to_usd
             FROM currency
             WHERE currency.id = balance.currency_id AND currency.updated > balance.updated
             ORDER BY currency.updated
             LIMIT 1)
        ) AS rate_to_usd
    FROM balance
    JOIN (select currency.id, currency.name
                from currency
                group by currency.id,currency.name) as c ON c.id = balance.currency_id
    LEFT JOIN person ON person.id = balance.user_id
)

SELECT
    func.name,
    func.lastname,
    func.currency_name,
    func.money * func.rate_to_usd AS currency_in_usd
FROM func
ORDER BY func.name DESC, func.lastname, func.currency_name;

