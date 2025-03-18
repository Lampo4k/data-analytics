 CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
 RETURNS TABLE (n1 bigint) AS $$
 WITH RECURSIVE req (n1, n2) AS
 (SELECT 0 AS a, 1 AS b
  UNION ALL
  SELECT n2, n1 + n2 FROM req WHERE n2 < pstop
 )
 SELECT n1
 FROM req;
 $$ LANGUAGE SQL;

 SELECT * FROM fnc_fibonacci(100);
 SELECT * FROM fnc_fibonacci();