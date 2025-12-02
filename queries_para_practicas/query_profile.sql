
-- Consulta objetivo para analizar (¡Más compleja!)
SELECT
  p.Categoria_Producto,
  v.Region,
  v.Canal_Venta, -- ¡Nueva columna de agrupación!
  COUNT(DISTINCT v.ID_Venta) AS Num_Pedidos_Unicos,
  SUM(v.Total_Venta) AS Ventas_Totales
FROM
  catalogo.ventas.raw_ventas v
JOIN
  catalogo.ventas.productos_dim p ON v.ID_Producto = p.ID_Producto
WHERE
  v.Fecha_Venta >= '2023-01-01' AND v.Fecha_Venta <= '2023-03-31'
GROUP BY
  p.Categoria_Producto,
  v.Region,
  v.Canal_Venta -- ¡Añadida al GROUP BY!
ORDER BY
  Ventas_Totales DESC;