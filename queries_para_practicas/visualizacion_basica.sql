USE CATALOG catalogo;
USE SCHEMA ventas;

-- 1. Consulta para el KPI Principal
SELECT SUM(Total_Venta) as Ingresos_Totales 
FROM catalogo.ventas.fact_ventas;




-- 2. Consulta para Comparativa Regional
SELECT 
    Region, 
    SUM(Total_Venta) as Total
FROM catalogo.ventas.fact_ventas
GROUP BY Region
ORDER BY Total DESC; -- Importante ordenar para que el gráfico salga bonito




-- 3. Consulta de Tendencia
SELECT 
    Fecha_Venta,
    SUM(Total_Venta) as Ventas_Dia
FROM catalogo.ventas.fact_ventas
GROUP BY Fecha_Venta
ORDER BY Fecha_Venta;


SELECT 
    f.Fecha_Venta,
    d.Categoria_Producto,
    SUM(f.Total_Venta) as Ventas
FROM catalogo.ventas.fact_ventas f
JOIN catalogo.ventas.dim_producto d 
    ON f.ID_Producto_FK = d.ID_Producto_PK
GROUP BY f.Fecha_Venta, d.Categoria_Producto
ORDER BY f.Fecha_Venta;