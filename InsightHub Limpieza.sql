SELECT 
    COUNT(*) AS total_filas,
    SUM(CASE WHEN int64_field_20 IS NULL THEN 1 ELSE 0 END) AS nulos
FROM 
   starry-aegis-443515-b9.insight_hub.dbo_Compras ;

SELECT 
    *
FROM 
    starry-aegis-443515-b9.insight_hub.dbo_Compras
WHERE 
    int64_field_20 IS NOT NULL;


SELECT 
    *
FROM 
    starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompras
WHERE 
    int64_field_16 IS NOT NULL;

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_InventarioFinal
WHERE int64_field_11 IS NOT NULL;

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_InventarioInicial
WHERE int64_field_11 IS NOT NULL;

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_PreciosCompra
WHERE int64_field_12 IS NOT NULL;

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_Vendedores
WHERE string_field_2 IS NOT NULL;

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_Ventas
WHERE int64_field_16 IS NOT NULL;

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_Compras
LIMIT 10;

CREATE OR REPLACE TABLE starry-aegis-443515-b9.insight_hub.dbo_Compras AS
SELECT DISTINCT *
FROM starry-aegis-443515-b9.insight_hub.dbo_Compras;

CREATE OR REPLACE TABLE starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompras AS
SELECT DISTINCT *
FROM starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompras;

CREATE OR REPLACE TABLE starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompras AS
SELECT DISTINCT *
FROM starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompras;

CREATE OR REPLACE TABLE starry-aegis-443515-b9.insight_hub.dbo_InventarioFinal AS
SELECT DISTINCT *
FROM starry-aegis-443515-b9.insight_hub.dbo_InventarioFinal;

CREATE OR REPLACE TABLE starry-aegis-443515-b9.insight_hub.dbo_InventarioInicial AS
SELECT DISTINCT *
FROM starry-aegis-443515-b9.insight_hub.dbo_InventarioInicial;

CREATE OR REPLACE TABLE starry-aegis-443515-b9.insight_hub.dbo_Ventas AS
SELECT DISTINCT *
FROM starry-aegis-443515-b9.insight_hub.dbo_Ventas;