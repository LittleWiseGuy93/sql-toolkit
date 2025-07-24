-- Limpia el campo 'nombre' eliminando tildes, eñes y caracteres especiales, dejando solo letras, números y espacios.
SELECT
  regexp_replace(translate(trim(nombre), 'áéíóúñ', 'aeioun'), '[^a-zA-Z0-9 ]', '', 'g') AS nombre_limpio
FROM usuarios;

-- input:
/*
nombre
---------------------
 José Pérez-Gómez
 María-José Núñez!!
 Andrés Ñuño@2024
*/

-- output:
/*
nombre_limpio
---------------------
Jose PerezGomez
MariaJose Nunez
Andres Nuno2024
*/
