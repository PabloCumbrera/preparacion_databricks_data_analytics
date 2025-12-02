
-- ¿Qué categorías de venta tienen más movimiento (volumen) frente a cuáles dan más dinero?
SELECT
  Categoria_Producto,
  COUNT(*) AS Numero_Transacciones,
  SUM(Total_Venta) AS Valor_Total_Ventas
FROM
  catalogo.ventas.raw_ventas
GROUP BY
  Categoria_Producto
ORDER BY
  Valor_Total_Ventas DESC;








  SELECT
  Categoria_Producto,
  COUNT(*) AS Numero_Transacciones,
  SUM(Total_Venta) AS Valor_Total_Ventas
FROM
  catalogo.ventas.raw_ventas
WHERE
  Valor_Total_Ventas > 1000 -- ¡Esto daría ERROR!
GROUP BY
  Categoria_Producto
ORDER BY
  Valor_Total_Ventas DESC;









  SELECT
  Categoria_Producto,
  COUNT(*) AS Numero_Transacciones,
  -- SUM(): Aquí se calcula el valor para cada grupo
  SUM(Total_Venta) AS Valor_Total_Ventas
FROM
  catalogo.ventas.raw_ventas
GROUP BY
  Categoria_Producto
-- HAVING: Filtra los GRUPOS después de que SUM() y COUNT() se han ejecutado.
-- Aquí, 'Valor_Total_Ventas' (la suma ya calculada) SÍ existe.
HAVING
  SUM(Total_Venta) > 2000 -- O también puedes usar HAVING Valor_Total_Ventas > 5000
ORDER BY
  Valor_Total_Ventas DESC;








  SELECT
  Categoria_Producto,
  Canal_Venta,
  COUNT(*) AS Numero_Transacciones,
  SUM(Total_Venta) AS Valor_Total_Ventas
FROM
  catalogo.ventas.raw_ventas
WHERE
  Canal_Venta = 'Online' -- Filtra FILAS individuales ANTES de agrupar
GROUP BY
  Categoria_Producto, Canal_Venta
HAVING
  SUM(Total_Venta) > 1000 -- Filtra GRUPOS después de agrupar y sumar
ORDER BY
  Valor_Total_Ventas DESC;