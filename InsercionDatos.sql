USE InventoryManagement2016;
GO

-- Validar que la tabla PurchasePrices existe
IF OBJECT_ID('dbo.PurchasePrices', 'U') IS NOT NULL
    PRINT 'La tabla PurchasePrices está lista para la carga de datos.';
ELSE
    BEGIN
        PRINT 'La tabla PurchasePrices no existe. Crear la tabla antes de continuar.';
        RETURN;
    END;

-- Configuración de BULK INSERT para cargar el archivo
BULK INSERT PurchasePrices
FROM 'C:\Users\DIEGO CHIKA\Desktop\Analisis de Datos DA\GestionInventario2016\2017PurchasePricesDec.csv'
WITH (
    FIRSTROW = 2, -- Ignorar la fila de encabezados
    FIELDTERMINATOR = ';', -- Separador de campos
    ROWTERMINATOR = '\r\n', -- Separador de filas
    CODEPAGE = '65001', -- UTF-8
    ERRORFILE = 'C:\Users\DIEGO CHIKA\Desktop\Analisis de Datos DA\GestionInventario2016\errores.log', -- Archivo de errores
    MAXERRORS = 100 -- Limitar errores antes de abortar
);

-- Verificar los registros cargados
SELECT TOP 10 * FROM PurchasePrices;
