SELECT address,
       ROUND(MAX(age) - (MIN(age) / MAX(age::numeric)), 2) AS formula,
       ROUND(AVG(age), 2) AS average,
       CASE
           WHEN (MAX(age) - (MIN(age) / MAX(age))) > AVG(age) THEN 'true'
           ELSE 'false'
       END
       AS comparison

FROM person
GROUP BY address
ORDER BY address;