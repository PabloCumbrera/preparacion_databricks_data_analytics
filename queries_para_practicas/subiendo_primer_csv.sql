-- Asegúrate de que tu SQL Warehouse esté activo
-- y que estés en el catálogo y esquema correctos.
-- USE CATALOG mi_catalogo_demo;
-- USE SCHEMA ejercicio_modulo1;

-- Paso 1: Crea la tabla Delta de destino para nuestros datos de ventas RAW
-- La crearemos como una tabla gestionada por Unity Catalog
CREATE TABLE IF NOT EXISTS ventas_raw (
  ID_Venta INT,
  Fecha_Venta DATE,
  ID_Producto INT,
  Nombre_Producto STRING,
  Categoria_Producto STRING,
  Cantidad INT,
  Precio_Unitario DECIMAL(10,2),
  Total_Venta DECIMAL(10,2),
  Region STRING,
  Canal_Venta STRING
);

-- Paso 2: Usa COPY INTO para cargar el CSV en la tabla Delta
-- Sustituye '/FileStore/tables/ventas_raw.csv' con la ruta real de tu archivo CSV
COPY INTO ventas_raw
FROM '/FileStore/tables/ventas_raw.csv' -- RUTA DE TU CSV EN DBFS
FILEFORMAT = CSV
FORMAT_OPTIONS (
  'header' = 'true',           -- Indica que la primera fila es el encabezado
  'inferSchema' = 'true',      -- Intenta inferir los tipos de datos (opcional, pero útil)
  'mergeSchema' = 'true'       -- Permite que el esquema de la tabla evolucione si hay cambios (opcional)
)
COPY_OPTIONS (
  'force' = 'false'            -- Si es 'true', fuerza la recarga de todos los archivos
);