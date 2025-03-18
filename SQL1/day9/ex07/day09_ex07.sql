CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS numeric AS $$
BEGIN
    RETURN (SELECT MIN(val) FROM unnest(arr) val);
END;
$$
 LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC ARRAY[10.0, -1.0, 5.0, 4.4]);
