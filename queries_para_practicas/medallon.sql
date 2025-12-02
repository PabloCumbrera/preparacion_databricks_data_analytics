USE CATALOG catalogo;
USE SCHEMA ventas;

CREATE OR REPLACE TABLE ventas_silver AS
SELECT
    -- 1. ARREGLANDO EL ID
    -- Si Fecha es nula, sacamos el ID del csv (posición 0), si no, usamos el original
    CASE WHEN Fecha_Venta IS NULL THEN split(ID_Venta, ',')[0] 
         ELSE ID_Venta 
    END as ID_Venta,

    -- 2. ARREGLANDO LA FECHA
    -- Casteamos a DATE. Si viene del CSV (pos 1), lo convertimos.
    try_cast(
        CASE WHEN Fecha_Venta IS NULL THEN split(ID_Venta, ',')[1] 
             ELSE Fecha_Venta 
        END as DATE
    ) as Fecha_Venta,

    -- 3. ARREGLANDO PRODUCTO Y PRECIOS
    CASE WHEN Fecha_Venta IS NULL THEN split(ID_Venta, ',')[2] ELSE ID_Producto END as ID_Producto,
    
    -- Limpiamos comillas extrañas que puedan venir en el CSV con la función replace o trim
    replace(
        CASE WHEN Fecha_Venta IS NULL THEN split(ID_Venta, ',')[3] ELSE Nombre_Producto END, 
        '"', ''
    ) as Nombre_Producto,

    CASE WHEN Fecha_Venta IS NULL THEN split(ID_Venta, ',')[4] ELSE Categoria_Producto END as Categoria_Producto,
    
    -- Convertimos cantidades y precios a números reales
    try_cast(CASE WHEN Fecha_Venta IS NULL THEN split(ID_Venta, ',')[5] ELSE Cantidad END as INT) as Cantidad,
    try_cast(CASE WHEN Fecha_Venta IS NULL THEN split(ID_Venta, ',')[7] ELSE Total_Venta END as DOUBLE) as Total_Venta,
    
    CASE WHEN Fecha_Venta IS NULL THEN split(ID_Venta, ',')[8] ELSE Region END as Region

FROM raw_ventas;



SELECT * FROM catalogo.ventas.ventas_silver;





-- Tabla de DIM PRODUCTO
CREATE OR REPLACE TABLE catalogo.ventas.dim_producto AS
SELECT DISTINCT
    ID_Producto AS ID_Producto_PK,
    Nombre_Producto,
    Categoria_Producto
FROM catalogo.ventas.ventas_silver
WHERE ID_Producto IS NOT NULL
ORDER BY id_producto_pk ASC;

SELECT * FROM catalogo.ventas.dim_producto;

-- Tabla de HECHOS 
CREATE OR REPLACE TABLE catalogo.ventas.fact_ventas AS
SELECT
    ID_Venta AS ID_Venta_PK,
    Fecha_Venta,
    ID_Producto AS ID_Producto_FK, -- FK hacia dim_producto
    Region,
    Cantidad,
    Total_Venta
FROM catalogo.ventas.ventas_silver
WHERE ID_Venta IS NOT NULL
ORDER BY ID_Venta_PK DESC;

SELECT * FROM catalogo.ventas.fact_ventas;



-- Reporte Gold: Ventas por Categoría
SELECT 
    d.Categoria_Producto,
    SUM(f.Total_Venta) as Ingresos_Totales
FROM catalogo.ventas.fact_ventas f
JOIN catalogo.ventas.dim_producto d ON f.ID_Producto_FK = d.ID_Producto_PK
GROUP BY d.Categoria_Producto
ORDER BY Ingresos_Totales DESC;