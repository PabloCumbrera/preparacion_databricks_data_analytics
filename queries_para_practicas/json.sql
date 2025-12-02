 
 
        '{
         "ID_Usuario": "U-001",
         "Nombre": "Ana García",
         "Email": "ana.garcia@email.com",
         "Regiones_Interes": ["Norte", "Sur", "Este"],
          "Direccion": {
           "Calle": "Calle Falsa 123", "Ciudad": "Sevilla", "Pais": "España" } 
          }'












WITH Tabla_Usuarios_JSON AS (
    SELECT
        '{
         "ID_Usuario": "U-001",
         "Nombre": "Ana García",
         "Email": "ana.garcia@email.com",
         "Regiones_Interes": ["Norte", "Sur", "Este"],
          "Direccion": {
           "Calle": "Calle Falsa 123", "Ciudad": "Sevilla", "Pais": "España" } 
          }'
           AS datos_usuario
)
SELECT datos_usuario FROM Tabla_Usuarios_JSON; -- Ejecutamos para ver el STRING




WITH Tabla_Usuarios_JSON AS (
    SELECT
        '{
         "ID_Usuario": "U-001",
         "Nombre": "Ana García",
         "Email": "ana.garcia@email.com",
         "Regiones_Interes": ["Norte", "Sur", "Este"],
          "Direccion": {
           "Calle": "Calle Falsa 123", "Ciudad": "Sevilla", "Pais": "España" } 
          }'
           AS datos_usuario
)
SELECT
    datos_usuario:Direccion AS Direccion,
    datos_usuario:Email  AS Email_Usuario
FROM Tabla_Usuarios_JSON;






WITH Tabla_Usuarios_JSON AS (
    SELECT
        '{
         "ID_Usuario": "U-001",
         "Nombre": "Ana García",
         "Email": "ana.garcia@email.com",
         "Regiones_Interes": ["Norte", "Sur", "Este"],
          "Direccion": {
           "Calle": "Calle Falsa 123", "Ciudad": "Sevilla", "Pais": "España" } 
          }'
           AS datos_usuario
)
SELECT
    datos_usuario:Direccion.Ciudad AS Ciudad_Residencia,
    datos_usuario:Direccion.Pais   AS Pais_Residencia
FROM Tabla_Usuarios_JSON;





WITH Tabla_Usuarios_JSON AS (
    SELECT
        '{
         "ID_Usuario": "U-001",
         "Nombre": "Ana García",
         "Email": "ana.garcia@email.com",
         "Regiones_Interes": ["Norte", "Sur", "Este"],
          "Direccion": {
           "Calle": "Calle Falsa 123", "Ciudad": "Sevilla", "Pais": "España" } 
          }'
           AS datos_usuario
)
SELECT
    datos_usuario:Regiones_Interes AS Array_Completo, -- Muestra el Array completo primero
    datos_usuario:Regiones_Interes[0] AS Primera_Region, -- Índice 0
    datos_usuario:Regiones_Interes[2] AS Segunda_Region  -- Índice 1
FROM Tabla_Usuarios_JSON;