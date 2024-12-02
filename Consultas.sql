USE InventoryManagement2016;
GO

-- Esta consulta te mostrará una lista de todas las tablas, incluyendo su nombre y otros detalles.
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo';

-- Listar tablas y sus columnas:
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo';

-- Listar tablas y sus tipos:
SELECT TABLE_NAME, TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo';


-- Consultas para obtener información detallada sobre claves primarias y foráneas:
-- Claves primarias
SELECT 
    t.name AS TableName,
    c.name AS ColumnName
FROM sys.indexes i
INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
INNER JOIN sys.objects t ON i.object_id = t.object_id
WHERE i.is_primary_key = 1;

-- Claves foráneas
SELECT 
    fk.name AS ForeignKeyConstraintName,
    OBJECT_NAME(fk.parent_object_id) AS TableName,
    col.name AS ColumnName
FROM sys.foreign_keys fk
INNER JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN sys.columns col ON fkc.parent_column_id = col.column_id AND fkc.parent_object_id = col.object_id;

ALTER TABLE PurchasePrices
ALTER COLUMN VendorName NVARCHAR(500); -- Ajusta a un tamaño mayor

