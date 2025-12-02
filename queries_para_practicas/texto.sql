--1.	Las regiones a veces vienen con espacios o en minúsculas, y necesitan uniformidad.

SELECT
  Region AS Region_Original,
  -- Paso 1: TRIM quita espacios al inicio y al final
  TRIM(Region) AS Region_Sin_Espacios,
  -- Paso 2: UPPER convierte todo a mayúsculas
  -- Podemos anidar funciones: Primero limpia (TRIM), luego convierte (UPPER)
  UPPER(TRIM(Region)) AS Region_Normalizada
  
FROM
  catalogo.ventas.raw_ventas

WHERE Region IS NOT NULL
LIMIT 5;



















--2. Necesitan crear un 'Código de Ticket' único combinando la región y el ID.


SELECT
  ID_Venta,
  Region,
  -- Opción A: CONCAT estándar
  CONCAT(Region, '-',  ID_Venta) AS Ticket_ID_Concat,

  -- Opción B: CONCAT_WS (With Separator) - ¡Muy útil!
  -- El primer argumento es el separador, el resto son las columnas.
  CONCAT_WS('-', Region,  ID_Venta) AS Ticket_ID_Pro
FROM
  catalogo.ventas.raw_ventas

WHERE Region IS NOT NULL
LIMIT 5;




--3. Quieren extraer la primera palabra del nombre del producto para identificar la 'Familia Genérica'.

SELECT
  Nombre_Producto,
  -- SUBSTRING(columna, inicio, longitud)
  -- Empieza en el carácter 1, toma 3 caracteres.
  SUBSTRING(Nombre_Producto, 1, 3) AS Codigo_Corto_Producto
FROM
  catalogo.ventas.raw_ventas

WHERE Region IS NOT NULL
LIMIT 5;








SELECT
  Nombre_Producto,
  -- 1. SPLIT crea un ARRAY (una lista) de palabras
  SPLIT(Nombre_Producto, ' ') AS Array_Palabras,

  -- 2. Para acceder al primer elemento, usamos corchetes [ ]
  -- ¡OJO! Los Arrays en Databricks son base-0 (como Python)
  SPLIT(Nombre_Producto, ' ')[0] AS Primera_Palabra,

  -- Vamos a sacar la segunda palabra también por curiosidad
  SPLIT(Nombre_Producto, ' ')[1] AS Segunda_Palabra
FROM
  catalogo.ventas.raw_ventas

WHERE Region IS NOT NULL
LIMIT 5;

