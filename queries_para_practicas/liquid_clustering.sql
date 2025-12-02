USE catalogo.ventas;

-- Creación de tabla con Liquid Clustering activado
CREATE OR REPLACE TABLE catalogo.ventas.ventas_liquid
CLUSTER BY (ID_Producto, Region) -- Aquí está la magia
AS
SELECT * FROM catalogo.ventas.raw_ventas;

















SELECT * FROM catalogo.ventas.ventas_liquid



-- Mantenimiento incremental
OPTIMIZE catalogo.ventas.ventas_liquid;







-- Cambiando la estrategia sin reescribir datos históricos
ALTER TABLE catalogo.ventas.ventas_liquid
CLUSTER BY (ID_Producto, Region, Fecha_Venta);