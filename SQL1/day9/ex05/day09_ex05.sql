DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (id INT, name VARCHAR, age INT, gender VARCHAR, address VARCHAR)
AS $$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = pgender;
$$
 LANGUAGE SQL;

SELECT * FROM fnc_persons('male');
SELECT * FROM fnc_persons();