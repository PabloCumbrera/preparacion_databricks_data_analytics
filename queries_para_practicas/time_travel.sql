-- Imaginad que sois los responsables de la lista de precios de la compañía. Vais a hacer una pequeña rebaja en una categoría...
-- pero cometéis un error fatal en el código SQL y ponéis el precio de TODOS los productos a cero euros.



USE CATALOG catalogo;
USE SCHEMA ventas;

-- Creamos una tabla de precios simple para el laboratorio
CREATE OR REPLACE TABLE lab_precios_productos
AS SELECT
    ID_Producto,
    Nombre_Producto_Detallado,
    100 as Precio_Unitario -- Imaginemos que esta columna existe en productos_dim
FROM
    catalogo.ventas.productos_dim




SELECT * FROM lab_precios_productos LIMIT 5;



-- ¡PELIGRO! Se nos olvida el WHERE Categoria = 'Teclados'
UPDATE lab_precios_productos
SET Precio_Unitario = 0.00;



-- ¡OH, NO!
SELECT * FROM lab_precios_productos LIMIT 10;





-- Vamos a ver el _delta_log
DESCRIBE HISTORY lab_precios_productos;





-- Consultamos la tabla TAL CUAL estaba en la versión 0
SELECT *
FROM lab_precios_productos VERSION AS OF 0
LIMIT 10;


-- Devolvemos a la tabla a su estado original... ¡Menos mal!
RESTORE TABLE lab_precios_productos TO VERSION AS OF 0;



-- Comprobamos
SELECT * FROM lab_precios_productos LIMIT 10;


-- Vuelve a registrarse en una nueva entrada en el _delta_log
DESCRIBE HISTORY lab_precios_productos;






--DROP TABLE lab_precios_productos;