
-- Pivotamos la tabla product_sales para mostrar los años como columnas (2022, 2023, 2024) 
-- y las ventas como valores, agrupadas por producto.
-- Requiere la extensión tablefunc
SELECT *
FROM crosstab(
  $$SELECT product, year, sales FROM product_sales ORDER BY 1,2$$,
  $$VALUES ('2022'), ('2023'), ('2024')$$
) AS ct (product text, "2022" int, "2023" int, "2024" int);

-- input:
/*
product     year     sales
A           2022     100
A           2023     150
B           2022     80
B           2024     120
*/

---- output:

/*
product   2022   2023   2024
A         100    150    NULL
B         80     NULL   120
*/
