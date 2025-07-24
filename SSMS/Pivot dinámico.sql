-- Genera dinámicamente un pivot en SQL Server para mostrar los meses como columnas
-- y los montos de ventas por producto. Útil cuando los meses son variables.

DECLARE @cols NVARCHAR(MAX), @sql NVARCHAR(MAX);
SELECT @cols = STRING_AGG(QUOTENAME(Mes), ',') FROM (SELECT DISTINCT Mes FROM Ventas) AS t;

SET @sql = '
SELECT Producto, ' + @cols + '
FROM (
  SELECT Producto, Mes, Monto FROM Ventas
) AS src
PIVOT (
  SUM(Monto) FOR Mes IN (' + @cols + ')
) AS p;';

EXEC sp_executesql @sql;

-- input:
/*
Producto   | Mes     | Monto
-----------|---------|-------
A          | Ene     | 100
A          | Feb     | 150
B          | Ene     | 80
B          | Mar     | 120
*/

-- output:
/*
Producto   | Ene   | Feb   | Mar
-----------|-------|-------|------
A          | 100   | 150   | NULL
B          | 80    | NULL  | 120
*/
