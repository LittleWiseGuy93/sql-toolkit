-- Genera un JSON por cliente que incluye su nombre y un array de sus pedidos con id y total.
-- Usa OBJECT_CONSTRUCT y ARRAY_AGG para estructurar los datos en formato JSON.

SELECT
  cliente_id,
  OBJECT_CONSTRUCT(
    'nombre', nombre,
    'pedidos', ARRAY_AGG(
      OBJECT_CONSTRUCT(
        'id', pedido_id,
        'total', total
      )
    )
  ) AS datos_json
FROM pedidos
JOIN clientes USING (cliente_id)
GROUP BY cliente_id, nombre;

-- input:
/*
clientes
cliente_id | nombre
-----------|---------
1          | Juan
2          | Ana

pedidos
pedido_id | cliente_id | total
----------|------------|-------
101       | 1          | 50
102       | 1          | 75
201       | 2          | 120
*/

-- output:
/*
cliente_id | datos_json
-----------|--------------------------------------------------------
1          | {
           |   "nombre": "Juan",
           |   "pedidos": [
           |     { "id": 101, "total": 50 },
           |     { "id": 102, "total": 75 }
           |   ]
           | }
2          | {
           |   "nombre": "Ana",
           |   "pedidos": [
           |     { "id": 201, "total": 120 }
           |   ]
           | }
*/
