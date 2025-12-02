USE CATALOG catalogo;
USE SCHEMA ventas;

CREATE TABLE IF NOT EXISTS shipping_logs (
  ID_Envio STRING,
  ID_Venta_Ref STRING,
  Fecha_Envio_Str STRING -- ¡Importante! Lo cargamos como STRING (texto)
);

COPY INTO shipping_logs
FROM '/Volumes/catalogo/filestore/tables/shoppin_logs.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header' = 'true');




























SELECT
  ID_Venta_Ref,
  Fecha_Envio_Str,
  
  -- Paso 1: Convertir el STRING a un DATE real
  TO_DATE(Fecha_Envio_Str, 'dd/MM/yyyy') AS Fecha_Envio_Limpia
FROM
  catalogo.ventas.shipping_logs;














catalogo.ventas.raw_ventas  ----> ID_Venta (Para sacar fecha venta)
catalogo.ventas.shipping_logs ----> ID_Venta_Ref




  SELECT
  v.ID_Venta,
  v.Fecha_Venta,
  s.Fecha_Envio_Str,
  TO_DATE(s.Fecha_Envio_Str, 'dd/MM/yyyy') AS Fecha_Envio_Limpia,
  
  -- Paso 2: Calcular la diferencia en días
  DATEDIFF(
    TO_DATE(s.Fecha_Envio_Str, 'dd/MM/yyyy'), -- Fecha Fin
    v.Fecha_Venta                             -- Fecha Inicio
  ) AS Dias_Para_Enviar
  
FROM
  catalogo.ventas.raw_ventas AS v
JOIN
  catalogo.ventas.shipping_logs AS s
  ON v.ID_Venta = s.ID_Venta_Ref;


















  -- Usamos una CTE (Common Table Expression) para limpiar el código
WITH Ventas_Con_Envio AS (
  SELECT
    v.Fecha_Venta,
    DATEDIFF(
      TO_DATE(s.Fecha_Envio_Str, 'dd/MM/yyyy'),
      v.Fecha_Venta
    ) AS Dias_Para_Enviar
  FROM
    catalogo.ventas.raw_ventas AS v
  JOIN
    catalogo.ventas.shipping_logs AS s
    ON v.ID_Venta = s.ID_Venta_Ref
)

-- Paso 3: Agrupar por semana usando DATE_TRUNC
SELECT
  DATE_TRUNC('WEEK', Fecha_Venta) AS Semana_Venta,
  AVG(Dias_Para_Enviar) AS Promedio_Dias_Envio
FROM
  Ventas_Con_Envio
GROUP BY
  Semana_Venta
ORDER BY
  Semana_Venta;