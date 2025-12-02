SELECT 
    f.Fecha_Venta,
    f.Region, 
    d.Categoria_Producto,
    SUM(f.Total_Venta) as Ventas
FROM catalogo.ventas.fact_ventas f
JOIN catalogo.ventas.dim_producto d 
    ON f.ID_Producto_FK = d.ID_Producto_PK
WHERE Total_Venta > :importe_minimo
GROUP BY f.Fecha_Venta, d.Categoria_Producto, f.Region
ORDER BY f.Fecha_Venta;