USE catalogo.ventas;

-- Consulta de negocio estándar
SELECT * FROM raw_ventas 
WHERE region = 'Norte' 
AND total_venta > 500;




EXPLAIN FORMATTED
SELECT * FROM raw_ventas 
WHERE region = 'Norte' 
AND total_venta > 500;



EXPLAIN FORMATTED
SELECT * FROM raw_ventas 
WHERE upper(region) = 'NORTE'; -- Ojo al cambio aquí