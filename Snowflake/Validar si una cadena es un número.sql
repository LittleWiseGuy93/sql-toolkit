-- Intenta convertir el valor del campo a número.
-- Si no es posible (por ejemplo, hay texto), devuelve NULL en lugar de error.

SELECT *,
       TRY_TO_NUMBER(campo) AS numero_valido
FROM tabla;

-- input:
/*
campo
--------
123
45.67
abc
NULL
*/

-- output:
/*
campo   | numero_valido
--------|---------------
123     | 123
45.67   | 45.67
abc     | NULL
NULL    | NULL
*/
