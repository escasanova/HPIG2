SELECT * 
FROM starry-aegis-443515-b9.insight_hub.dbo_InventarioFinal
LIMIT 10

SELECT 
  column_name 
FROM 
  starry-aegis-443515-b9.insight_hub.INFORMATION_SCHEMA.COLUMNS
WHERE 
  table_name = 'dbo_InventarioFinal'
ORDER BY 
  ordinal_position

CREATE TABLE starry-aegis-443515-b9.insight_hub.dbo_InventarioFinal2 AS
SELECT 
  InventoryId,
  Store,
  City,
  Brand,
  Description,
  onHand,
  endDate AS Price,
  size_ml AS endDate,
  pack_count AS size_ml,
  int64_field_10 AS pack_count 
FROM 
  starry-aegis-443515-b9.insight_hub.dbo_InventarioFinal

DROP TABLE starry-aegis-443515-b9.insight_hub.dbo_InventarioFinal

ALTER TABLE starry-aegis-443515-b9.insight_hub.dbo_InventarioFinal2
RENAME TO dbo_InventarioFinal

SELECT * 
FROM starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompras
LIMIT 10

CREATE TABLE starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompra2 AS
SELECT 
  InvoicePurchaseID,
  VendorNumber,
  VendorName,
  InvoiceDate,
  PONumber,
  PODate,
  PayDate,
  Quantity,
  Dollars,
  YearMonth AS Freight,
  Interval_Days AS YearMonth,
  Freight AS Interval_Days,
  FreightPercentage
FROM 
  starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompras

SELECT * 
FROM starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompra2
LIMIT 10

DROP TABLE starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompras

ALTER TABLE starry-aegis-443515-b9.insight_hub.dbo_FacturasDeCompra2
RENAME TO dbo_FacturaDeCompras

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_InventarioInicial2
LIMIT 10

CREATE TABLE starry-aegis-443515-b9.insight_hub.dbo_InventarioInicial2 AS
SELECT 
  InventoryId,
  Store,
  City,
  Brand,
  Description,
  onHand,
  startDate AS Price,
  size_ml AS startDate,
  pack_count AS size_ml,
  int64_field_10 AS pack_count
FROM 
  starry-aegis-443515-b9.insight_hub.dbo_InventarioInicial

DROP TABLE starry-aegis-443515-b9.insight_hub.dbo_InventarioInicial

ALTER TABLE starry-aegis-443515-b9.insight_hub.dbo_InventarioInicial2
RENAME TO dbo_InventarioInicial


SELECT * 
FROM starry-aegis-443515-b9.insight_hub.dbo_PreciosCompra
LIMIT 10

CREATE TABLE starry-aegis-443515-b9.insight_hub.dbo_PreciosCompra2 AS
SELECT
Brand,
Description,
Classification AS Price,
PurchasePrice AS Classification,
VendorName AS PurchasePrice,
int64_field_11 AS VendorNumber,
pack_count AS VendorName,
size_ml,
SupplierID
FROM starry-aegis-443515-b9.insight_hub.dbo_PreciosCompra

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_PreciosCompra2
LIMIT 10

DROP TABLE starry-aegis-443515-b9.insight_hub.dbo_PreciosCompra

ALTER TABLE starry-aegis-443515-b9.insight_hub.dbo_PreciosCompra2
RENAME TO dbo_PreciosCompra

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_Vendedores
LIMIT 10

ALTER TABLE starry-aegis-443515-b9.insight_hub.dbo_Vendedores
DROP COLUMN string_field_2

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_Ventas
LIMIT 10

CREATE TABLE starry-aegis-443515-b9.insight_hub.dbo_Ventas2 AS
SELECT
InventoryId,
Store,
Brand,
Description,
SalesQuantity,
SalesID AS VendorNumber,
int64_field_13 AS pack_count,
int64_field_15 AS SalesID,
VendorNumber AS Sales_Date
FROM starry-aegis-443515-b9.insight_hub.dbo_Ventas

SELECT *
FROM starry-aegis-443515-b9.insight_hub.dbo_Ventas2

DROP TABLE starry-aegis-443515-b9.insight_hub.dbo_Ventas

ALTER TABLE starry-aegis-443515-b9.insight_hub.dbo_Ventas2
RENAME TO dbo_Ventas

