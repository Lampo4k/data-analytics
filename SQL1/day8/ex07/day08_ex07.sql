--SESSION 1
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
--SESSION 2
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
--SESSION 1
SHOW TRANSACTION ISOLATION LEVEL;
--SESSION 2
SHOW TRANSACTION ISOLATION LEVEL;
--SESSION 1
UPDATE pizzeria SET rating = 1 WHERE id = 1;
--SESSION 2
UPDATE pizzeria SET rating = 2 WHERE id = 2;
--SESSION 1
UPDATE pizzeria SET rating = 1 WHERE id = 2;
--SESSION 2
UPDATE pizzeria SET rating = 2 WHERE id = 1;
--SESSION 1
COMMIT;
--SESSION 2
COMMIT;
--SESSION 1
SELECT * FROM pizzeria;
--SESSION 2
SELECT * FROM pizzeria;