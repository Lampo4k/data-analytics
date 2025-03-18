SELECT person2.name AS person_name1, person1.name AS person_name2, person1.address AS common_address
FROM person person1, person person2
WHERE person1.address = person2.address AND person1 != person2 AND person1.id<person2.id
ORDER BY 1, 2, 3;

