# 🧠 SQL-toolkit · Repositorio de Consultas Reutilizables

Este repositorio contiene ejemplos reales y reutilizables de SQL avanzados que he usado o estudiado en proyectos con **PostgreSQL**, **SQL Server (SSMS)** y **Snowflake**.

Está pensado como una **colección de soluciones prácticas** para problemas comunes de transformación, limpieza y estructuración de datos en distintos entornos.

---

## 📁 Estructura del repositorio


````
sql-toolkit/
├── postgres/ # Consultas y funciones en PostgreSQL
├── functions/ # funciones de normalizacion de periodos
├── sqlserver/ # Snippets avanzados para SSMS
└── snowflake/ # Ejemplos de uso en Snowflake
````
---

## 🔍 Contenido por carpeta

### 🐘 PostgreSQL

- `pivot_crosstab.sql`: Pivoteo dinámico con `crosstab()`
- `json_multinivel.sql`: Construcción de JSON anidado desde múltiples tablas
- `limpiar_nombres.sql`: Limpieza de campos usando expresiones regulares y `translate()`

### 🪟 SQL Server

- `duplicados_rownum.sql`: Detección de duplicados con `ROW_NUMBER()`
- `pivot_dinamico.sql`: Pivot dinámico usando `PIVOT` + `STRING_AGG()`
- `enmascaramiento.sql`: Enmascarar datos sensibles como nombres y teléfonos

### ❄️ Snowflake

- `qualify_recientes.sql`: Fila más reciente por ID con `QUALIFY`
- `validacion_numeros.sql`: Validación de campos con `TRY_TO_NUMBER`
- `json_construct.sql`: Creación de JSON anidado con `OBJECT_CONSTRUCT()` y `ARRAY_AGG()`

### 🔄 Universales

- `rolling_sum.sql`: Suma acumulada (ventana de 3 filas) válida en PostgreSQL, SSMS y Snowflake

---

## 📌 Objetivo

- Tener plantillas listas para copiar y adaptar en distintos proyectos.
- Documentar técnicas SQL avanzadas que solucionan problemas reales de negocio.
- Centralizar mi conocimiento práctico en SQL y facilitar el acceso a funciones comunes.

---

## ✍️ Autor

Desarrollado por **Juan Rodríguez** ([@LittleWiseGuy93](https://github.com/LittleWiseGuy93)) como parte de mi camino profesional como analista y futuro ingeniero de datos.

---

## 📄 Licencia

MIT — uso libre para cualquier proyecto personal o profesional.
