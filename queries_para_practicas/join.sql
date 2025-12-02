


SELECT * FROM catalogo.ventas.raw_ventas LIMIT 10;


SELECT * FROM catalogo.ventas.productos_dim LIMIT 10;














SELECT
  v.ID_Venta,
  v.Fecha_Venta,
  v.Total_Venta,
  -- Datos que vienen de la otra tabla
  p.Nombre_Producto_Detallado,
  p.Proveedor
FROM
  catalogo.ventas.raw_ventas AS v
INNER JOIN
  catalogo.ventas.productos_dim AS p
  ON v.ID_Producto = p.ID_Producto;




  SELECT
  v.ID_Venta,
  v.ID_Producto,     -- El ID en la venta
  p.ID_Producto,     -- El ID en la tabla de productos (para comparar)
  p.Proveedor
FROM
  catalogo.ventas.raw_ventas AS v
LEFT JOIN
  catalogo.ventas.productos_dim AS p
  ON v.ID_Producto = p.ID_Producto;