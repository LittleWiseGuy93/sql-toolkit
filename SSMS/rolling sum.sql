-- Calcula la suma móvil de los últimos 3 registros (incluyendo el actual) por cliente, ordenados por fecha.
-- Usa una ventana con ROWS BETWEEN 2 PRECEDING AND CURRENT ROW.

SELECT
  cliente_id,
  fecha,
  SUM(importe) OVER (PARTITION BY cliente_id ORDER BY fecha ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS suma_ultimos_3
FROM ventas;

-- input:
/*
cliente_id | fecha       | importe
-----------|-------------|---------
1          | 2023-01-01  | 100
1          | 2023-01-05  | 150
1          | 2023-01-10  | 200
1          | 2023-01-15  | 250
2          | 2023-01-03  | 300
2          | 2023-01-08  | 100
*/

-- output:
/*
cliente_id | fecha       | suma_ultimos_3
-----------|-------------|----------------
1          | 2023-01-01  | 100
1          | 2023-01-05  | 250
1          | 2023-01-10  | 450
1          | 2023-01-15  | 600
2          | 2023-01-03  | 300
2          | 2023-01-08  | 400
*/
