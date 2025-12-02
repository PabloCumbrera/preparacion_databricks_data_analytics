USE CATALOG catalogo;
USE SCHEMA ventas;





SELECT Categoria_Producto, SUM(Total_Venta) as Ventas_Totales
FROM catalogo.ventas.raw_ventas
GROUP BY Categoria_Producto;




-- View dinámica
CREATE OR REPLACE VIEW vista_dinamica_resumen AS
SELECT Categoria_Producto, SUM(Total_Venta) as Ventas_Totales
FROM catalogo.ventas.raw_ventas
GROUP BY Categoria_Producto;




-- View materializada
CREATE MATERIALIZED VIEW vista_materializada_resumen AS
SELECT Categoria_Producto, SUM(Total_Venta) as Ventas_Totales
FROM catalogo.ventas.raw_ventas
GROUP BY Categoria_Producto;




-- DINAMICA
SELECT * FROM vista_dinamica_resumen ORDER BY Categoria_Producto;
-- MATERIALIZADA
SELECT * FROM vista_materializada_resumen ORDER BY Categoria_Producto;





-- Insertamos una nueva fila de datos
INSERT INTO catalogo.ventas.raw_ventas(ID_Venta, Fecha_Venta, Categoria_Producto, Total_Venta, Region, Canal_Venta)
VALUES ('TEST-999', current_date(), 'Electronica', 1000000.00, 'Norte', 'Online');



-- En la DINAMICA si se 'acutaliza' automáticamente, mientras no ocurre asi en la MATERIALIZADA
SELECT * FROM vista_dinamica_resumen WHERE Categoria_Producto = 'Electronica';
SELECT * FROM vista_materializada_resumen WHERE Categoria_Producto = 'Electronica';




-- REFRESCAMOS
REFRESH MATERIALIZED VIEW vista_materializada_resumen;



-- Ahora si vemos los nuevos datos
SELECT * FROM vista_materializada_resumen WHERE Categoria_Producto = 'Electronica';








DELETE FROM catalogo.ventas.raw_ventas WHERE ID_Venta = 'TEST-999';
-- DROP VIEW vista_dinamica_resumen
-- DROP MATERIALIZED VIEW vista_materializada_resumen