
--¿Cuánto hemos vendido en total en cada región?



SELECT
  Region,
  -- SUM(): Suma todos los valores de la columna para cada grupo.
  -- Es la función estándar para calcular "Ingresos Totales".
  SUM(Total_Venta) AS Ingresos_Totales
FROM
  catalogo.ventas.raw_ventas
-- GROUP BY: La "Regla de Oro".
-- Como 'Region' no está dentro de una función SUM/COUNT,
-- ¡es OBLIGATORIO ponerla aquí para definir las "cubetas"!
WHERE Region IS NOT NULL
GROUP BY
  Region
ORDER BY
  Ingresos_Totales DESC; -- Ordenamos de mayor a menor venta














--¿Cuál es la venta promedio por canal (cuánto gasta un cliente normal por canal)?


  SELECT
  Canal_Venta,
  -- AVG(): Calcula la media aritmética.
  -- ROUND(..., 2): Redondea el resultado a 2 decimales (céntimos).
  ROUND(AVG(Total_Venta), 2) AS Venta_Promedio
FROM
  catalogo.ventas.raw_ventas
-- Agrupamos por la columna que NO es agregada
WHERE Canal_Venta IS NOT NULL
GROUP BY
  Canal_Venta;





--¿Qué categorías tienen más movimiento (volumen) frente a cuáles dan más dinero?

SELECT
  Categoria_Producto,
  -- COUNT(*): Cuenta filas (transacciones). Nos dice el "Volumen de Actividad".
  COUNT(*) AS Numero_Transacciones,
  -- SUM(): Suma dinero. Nos dice el "Valor Económico".
  SUM(Total_Venta) AS Valor_Total_Ventas
FROM
  catalogo.ventas.raw_ventas
WHERE Categoria_Producto IS NOT NULL
GROUP BY
  Categoria_Producto
-- Podemos ordenar por volumen para ver qué sale más rápido del almacén
ORDER BY
  Numero_Transacciones DESC;




