DESCRIBE DETAIL catalogo.ventas.raw_ventas;












USE catalogo.ventas;

-- Paso 1: Compactar (OPTIMIZE)
-- Paso 2: Colocar datos juntos (ZORDER BY)

OPTIMIZE catalogo.ventas.raw_ventas
ZORDER BY (Region, Categoria_Producto);




SELECT * FROM catalogo.ventas.raw_ventas
WHERE Region = 'Sur' 
AND Categoria_Producto = 'Electronica';