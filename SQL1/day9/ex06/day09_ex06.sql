CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy',
                                                              pprice bigint DEFAULT 500,
                                                              pdate date DEFAULT '2022-01-08')
RETURNS TABLE (pizzeria_name character varying) AS $$
BEGIN
    RETURN QUERY
    SELECT pizzeria.name AS pizzeria_name
    FROM menu
    INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    INNER JOIN person ON person.id = person_visits.person_id
    WHERE price < pprice AND person.name = pperson AND visit_date = pdate;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
