USE CATALOG catalogo;
USE SCHEMA ventas;

-- 1. CREANDO LA VISTA CON RLS (Filtrado de Filas)
CREATE OR REPLACE VIEW ventas_rls AS
SELECT * FROM raw_ventas
WHERE 
  -- Lógica de Seguridad:
  -- Opción A: Eres Admin (Ves todo)
  is_member('managers') 
  
  -- Opción B: Eres el Delegado del Norte (Solo ves Norte)
  OR (Region = 'Norte' AND current_user() = 'delegado_norte@empresa.com')

    -- Opción C: Eres el Delegado del Este (Solo ves Este)
  OR (Region = 'Este' AND current_user() = 'delegado_este@empresa.com')

--¿Cómo lo veriamos ofuscado nostotros mismos como si fueramos 'Norte'?
   OR (Region = 'Norte' AND  current_user() = current_user());




SELECT *
FROM ventas_rls;






CREATE OR REPLACE VIEW ventas_masked AS
SELECT
    ID_Venta,
    ID_Producto,
    Region,
    -- Lógica de Enmascaramiento CORREGIDA
    CASE 
        -- Usamos is_member() porque nuestro grupo 'admins' es de Workspace
        WHEN is_member('managers') THEN Total_Venta 
        ELSE -999 
    END as Total_Venta_Segura
FROM raw_ventas;





SELECT * FROM ventas_masked LIMIT 5;




CREATE OR REPLACE VIEW ventas_masked_test AS
SELECT
    ID_Venta,
    CASE 
        -- Simulamos que NO somos admins forzando el FALSE
        WHEN 1=0 THEN Total_Venta 
        ELSE -999 
    END as Total_Venta_Segura
FROM raw_ventas;


SELECT * FROM ventas_masked_test LIMIT 5;

