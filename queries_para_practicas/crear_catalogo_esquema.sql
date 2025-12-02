-- Asegúrate de tener permisos para crear catálogos
CREATE CATALOG IF NOT EXISTS catalogo;

-- Usar el catálogo recién creado
USE CATALOG catalogo;

-- Crear un esquema de ejemplo
CREATE SCHEMA IF NOT EXISTS catalogo.ventas;