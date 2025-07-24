-- Busca registros duplicados por email y muestra solo los duplicados (excluye el primero de cada grupo).
WITH cte AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
  FROM usuarios
)
SELECT * FROM cte WHERE rn > 1;

-- input:
/*
id  | nombre     | email
----|------------|---------------------
1   | Ana        | ana@mail.com
2   | Ana M.     | ana@mail.com
3   | Juan       | juan@mail.com
4   | Ana López  | ana@mail.com
5   | Pedro      | pedro@mail.com
*/

-- output:
/*
id  | nombre     | email          | rn
----|------------|----------------|----
2   | Ana M.     | ana@mail.com   | 2
4   | Ana López  | ana@mail.com   | 3
*/
