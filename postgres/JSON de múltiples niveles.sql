-- Genera un JSON por cliente con su nombre y un array de sus pedidos (fecha y total).
SELECT jsonb_build_object(
  'cliente', nombre,
  'pedidos', (
    SELECT jsonb_agg(
             jsonb_build_object(
               'fecha', fecha,
               'total', total
             )
           )
    FROM pedidos p
    WHERE p.cliente_id = c.id
  )
)
FROM clientes c;

-- input:
/*
clientes
id  | nombre
----|---------
1   | Juan
2   | Ana

pedidos
id  | cliente_id | fecha       | total
----|------------|-------------|-------
1   | 1          | 2023-01-01  | 100
2   | 1          | 2023-02-15  | 150
3   | 2          | 2023-03-10  | 200
*/

-- output:
/*
{
  "cliente": "Juan",
  "pedidos": [
    { "fecha": "2023-01-01", "total": 100 },
    { "fecha": "2023-02-15", "total": 150 }
  ]
}
{
  "cliente": "Ana",
  "pedidos": [
    { "fecha": "2023-03-10", "total": 200 }
  ]
}
*/
