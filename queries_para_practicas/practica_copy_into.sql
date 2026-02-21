USE CATALOG catalogo;   -- O tu catálogo
USE SCHEMA ventas;      -- O tu esquema

-- Creamos la tabla
CREATE TABLE IF NOT EXISTS productos_dim (
    ID_Producto STRING,
    Nombre_Producto_Detallado STRING,
    Categoria_Producto STRING,
    Proveedor STRING
);

-- Populamos la tabla
COPY INTO catalogo.ventas.productos_dim   -- 1. Tabla Destino
FROM '/Volumes/catalogo/filestore/tables/' -- 2. Ruta del Fichero Origen
FILEFORMAT = CSV
FORMAT_OPTIONS (
    'header' = 'true',
    'inferSchema' = 'false', -- Ya definimos el esquema, no necesitamos inferir
    'delimiter' = ';'
)
COPY_OPTIONS ('force' = 'false');
