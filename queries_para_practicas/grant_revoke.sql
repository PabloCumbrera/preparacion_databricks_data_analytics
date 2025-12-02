
GRANT USE CATALOG ON CATALOG catalogo TO `pablo.cumbreraconde@gmail.com`;


GRANT USE SCHEMA ON SCHEMA catalogo.ventas TO `pablo.cumbreraconde@gmail.com`;


GRANT SELECT ON TABLE catalogo.ventas.raw_ventas TO `pablo.cumbreraconde@gmail.com`;



SHOW GRANTS ON TABLE catalogo.ventas.raw_ventas;












-- ¡ERROR! Le damos permiso total sin querer
GRANT ALL PRIVILEGES ON TABLE catalogo.ventas.raw_ventas TO `pablo.cumbreraconde@gmail.com`;


SHOW GRANTS ON TABLE catalogo.ventas.raw_ventas;








-- Retirando los permisos peligrosos
REVOKE ALL PRIVILEGES ON TABLE catalogo.ventas.raw_ventas FROM `pablo.cumbreraconde@gmail.com`;

-- Restaurando solo el SELECT
GRANT SELECT ON TABLE catalogo.ventas.raw_ventas TO `pablo.cumbreraconde@gmail.com`;

SHOW GRANTS ON TABLE catalogo.ventas.raw_ventas;