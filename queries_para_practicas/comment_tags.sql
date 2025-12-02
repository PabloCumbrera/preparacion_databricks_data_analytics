

COMMENT ON TABLE catalogo.ventas.ventas_liquid IS 'Tabla maestra de ventas optimizada con Liquid Clustering';

COMMENT ON COLUMN catalogo.ventas.ventas_liquid.ID_Venta IS 'Identificador único de la transacción';

COMMENT ON COLUMN catalogo.ventas.ventas_liquid.Total_Venta IS 'Valor total de la transacción en EUROS, impuestos INCLUIDOS.';








ALTER TABLE catalogo.ventas.ventas_liquid
SET TAGS ('Clasificacion' = 'Confidencial', 'Departamento' = 'Ventas');

ALTER TABLE catalogo.ventas.ventas_liquid
ALTER COLUMN Total_Venta SET TAGS ('KPI' = 'True', 'Clasificacion' = 'Confidencial');




-- Para quitar etiquetas de la TABLA
ALTER TABLE catalogo.ventas.ventas_liquid 
UNSET TAGS ('Clasificacion', 'Departamento');

-- Para quitar etiquetas de una COLUMNA
ALTER TABLE catalogo.ventas.ventas_liquid 
ALTER COLUMN Total_Venta UNSET TAGS ('KPI', 'Confidencial');






SELECT * FROM catalogo.information_schema.table_tags


SELECT * FROM catalogo.information_schema.table_tags
WHERE tag_value = 'Confidencial';