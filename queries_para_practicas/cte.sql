

-- Cebolla (Consulta anidada)
SELECT ... FROM (
  SELECT ... FROM (
    SELECT ... ) 
    )



























--"Queremos encontrar las Regiones cuyas ventas totales son superiores al promedio de ventas de todas las regiones."

SELECT Region, SUM(Total_Venta) as Ventas_Region
FROM catalogo.ventas.raw_ventas
GROUP BY Region
HAVING SUM(Total_Venta) > (
    SELECT AVG(Ventas_Totales)
    FROM (
        SELECT Region, SUM(Total_Venta) as Ventas_Totales
        FROM catalogo.ventas.raw_ventas
        GROUP BY Region
    ) -- Subconsulta anidada para el promedio
);






-- Paso 1: Definimos el resumen por región una sola vez
WITH Resumen_Regional AS (
    SELECT
        Region,
        SUM(Total_Venta) AS Ventas_Totales
    FROM catalogo.ventas.raw_ventas
    GROUP BY Region
)

-- Paso 2: Usamos esa "tabla temporal" para comparar
SELECT *
FROM Resumen_Regional
WHERE Ventas_Totales > (SELECT AVG(Ventas_Totales) FROM Resumen_Regional);