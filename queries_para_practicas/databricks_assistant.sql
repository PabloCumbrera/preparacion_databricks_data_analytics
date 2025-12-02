SELECT 
    ID_Producto,
    Total_Venta,
    RANK() OVER (PARTITION BY Region ORDER BY Total_Venta DESC) as Ranking_Regional
FROM catalogo.ventas.raw_ventas
QUALIFY Ranking_Regional <= 3;