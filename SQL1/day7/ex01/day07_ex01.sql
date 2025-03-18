SELECT
    person.name,
    COUNT(person_visits) AS count_of_visits
FROM
    person INNER JOIN person_visits ON person.id = person_visits.person_id
GROUP BY
    person.name
ORDER BY
    count_of_visits DESC,
    1
LIMIT 4;