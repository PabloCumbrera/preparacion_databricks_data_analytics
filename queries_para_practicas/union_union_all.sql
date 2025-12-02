SELECT ID_Venta, Fecha_Venta, ID_Producto, Canal_Venta
FROM catalogo.ventas.raw_ventas
WHERE ID_Producto = 'P001';



SELECT ID_Venta, Fecha_Venta, ID_Producto, Canal_Venta
FROM catalogo.ventas.raw_ventas
WHERE Canal_Venta = 'Online';










-- Consulta A: Ventas de P001
SELECT ID_Venta, Fecha_Venta, ID_Producto, Canal_Venta
FROM catalogo.ventas.raw_ventas
WHERE ID_Producto = 'P001'

UNION ALL

-- Consulta B: Ventas Online
SELECT ID_Venta, Fecha_Venta, ID_Producto,Canal_Venta
FROM catalogo.ventas.raw_ventas
WHERE Canal_Venta = 'Online'

ORDER BY ID_Venta; -- Ordenamos para ver los duplicados fácilmente








SELECT ID_Venta, Fecha_Venta, ID_Producto, Canal_Venta
FROM catalogo.ventas.raw_ventas
WHERE ID_Producto = 'P001'

UNION -- <-- ¡Aquí está el cambio!

SELECT ID_Venta, Fecha_Venta, ID_Producto, Canal_Venta
FROM catalogo.ventas.raw_ventas
WHERE Canal_Venta = 'Online'

ORDER BY ID_Venta;