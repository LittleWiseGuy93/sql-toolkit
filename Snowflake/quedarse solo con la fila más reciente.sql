-- Devuelve solo el registro más reciente por empleado (según fecha_actualizacion).
-- Usa QUALIFY para filtrar directamente sobre la función ROW_NUMBER().

SELECT *
FROM empleados
QUALIFY ROW_NUMBER() OVER (PARTITION BY empleado_id ORDER BY fecha_actualizacion DESC) = 1;

-- input:
/*
empleado_id | nombre   | fecha_actualizacion
------------|----------|---------------------
1           | Ana      | 2023-01-01
1           | Ana M.   | 2023-05-10
2           | Luis     | 2023-02-20
2           | Luis M.  | 2023-03-15
*/

-- output:
/*
empleado_id | nombre   | fecha_actualizacion
------------|----------|---------------------
1           | Ana M.   | 2023-05-10
2           | Luis M.  | 2023-03-15
*/
