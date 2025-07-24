-- Enmascara el nombre mostrando solo la primera letra y oculta los demás caracteres con asteriscos.
-- También muestra solo los últimos 4 dígitos del teléfono.

SELECT 
  LEFT(nombre, 1) + REPLICATE('*', LEN(nombre)-1) AS nombre_enmascarado,
  RIGHT(telefono, 4) AS ultimos_digitos
FROM clientes;

-- input:
/*
nombre     | telefono
-----------|------------
Ana        | 654123789
Roberto    | 612345678
Luis       | 600987654
*/

-- output:
/*
nombre_enmascarado | ultimos_digitos
-------------------|-----------------
A**                | 3789
R******            | 5678
L***               | 7654
*/
