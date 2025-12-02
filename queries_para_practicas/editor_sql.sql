
-- QUÉ quieres ver
SELECT columna1, columna2

-- DE DÓNDE vienen los datos
FROM catalogo.esquema.tabla_fuente

-- CÓMO filtrar las filas (condiciones)
WHERE condicion1 AND condicion2

-- CÓMO ordenar los resultados
ORDER BY columna1 DESC

-- CUÁNTOS resultados mostrar (¡Tu mejor amigo!)
LIMIT 100;










-- Extrae de los ID_Venta, Fecha_Venta, ID_Producto, Total_Venta Region y Canal_Venta para 'raw_ventas' los productos vendidos en el Norte de forma Online ordenados desde el más reciente al más antiguo.



-- Usar los nombres de catálogo y esquema definidos en el curso
-- Ej: main.ventas_curso.ventas_raw
SELECT *
FROM catalogo.ventas.raw_ventas
LIMIT 10;







-- Extrae ID_Venta, Fecha_Venta, Nombre_Producto, Total_Venta, Region, Canal_Venta
-- desde 'raw_ventas' los productos vendidos en el Norte de forma Online ordenados desde el más reciente al más antiguo.


SELECT
  ID_Venta,
  Fecha_Venta,
  Nombre_Producto,
  Total_Venta,
  Region,
  Canal_Venta
FROM
  catalogo.ventas.raw_ventas
LIMIT 10;






-- Extrae ID_Venta, Fecha_Venta, Nombre_Producto, Total_Venta, Region, Canal_Venta
-- desde 'raw_ventas' los productos vendidos en el Norte de forma Online ordenados desde el más reciente al más antiguo.




SELECT
  ID_Venta,
  Fecha_Venta,
  Nombre_Producto,
  Total_Venta,
  Region,
  Canal_Venta
FROM
  catalogo.ventas.raw_ventas
WHERE
  Region = 'Norte' -- ¡Ojo con las mayúsculas/minúsculas en los strings!
LIMIT 10;











-- Extrae ID_Venta, Fecha_Venta, Nombre_Producto, Total_Venta, Region, Canal_Venta
-- desde 'raw_ventas' los productos vendidos en el Norte de forma Online ordenados Fecha_Venta DESC

SELECT
  ID_Venta,
  Fecha_Venta,
  Nombre_Producto,
  Total_Venta,
  Region,
  Canal_Venta
FROM
  catalogo.ventas.raw_ventas
WHERE
  Region = 'Norte'
  AND Canal_Venta = 'Online'
ORDER BY
  Fecha_Venta DESC; -- DESC para descendente





