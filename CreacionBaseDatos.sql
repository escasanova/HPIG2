-- Paso 1: Crear la Base de Datos
CREATE DATABASE InventoryManagement2016;
GO
USE InventoryManagement2016;
GO

-- Paso 2: Creacion de Tablas
-- 2.1. Tabla: PurchasePrices
CREATE TABLE PurchasePrices (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    Brand NVARCHAR(100),
    Description NVARCHAR(255),
    Price DECIMAL(10, 2),
    Size NVARCHAR(50),
    Volume NVARCHAR(50),
    Classification NVARCHAR(100),
    PurchasePrice DECIMAL(10, 2),
    VendorNumber INT UNIQUE,
    VendorName NVARCHAR(255)
);
GO

-- 2.2. Tabla: BegInventory
CREATE TABLE BegInventory (
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
    Store NVARCHAR(100),
    City NVARCHAR(100),
    Brand NVARCHAR(100),
    Description NVARCHAR(255),
    Size NVARCHAR(50),
    OnHand INT,
    Price DECIMAL(10, 2),
    StartDate DATE
);
GO

-- 2.3. Tabla: EndInventory
CREATE TABLE EndInventory (
    InventoryID INT PRIMARY KEY,
    Store NVARCHAR(100),
    City NVARCHAR(100),
    Brand NVARCHAR(100),
    Description NVARCHAR(255),
    Size NVARCHAR(50),
    OnHand INT,
    Price DECIMAL(10, 2),
    EndDate DATE,
    FOREIGN KEY (InventoryID) REFERENCES BegInventory(InventoryID)
);
GO

-- 2.4. Tabla: InvoicePurchases
CREATE TABLE InvoicePurchases (
    InvoiceID INT IDENTITY(1,1) PRIMARY KEY,
    VendorNumber INT,
    VendorName NVARCHAR(255),
    InvoiceDate DATE,
    PONumber NVARCHAR(50),
    PODate DATE,
    PayDate DATE,
    Quantity INT,
    Dollars DECIMAL(10, 2),
    Freight DECIMAL(10, 2),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES PurchasePrices(SupplierID)
);
GO

-- 2.5. Tabla: Purchases
CREATE TABLE Purchases (
    PurchaseID INT IDENTITY(1,1) PRIMARY KEY,
    InventoryID INT,
    Store NVARCHAR(100),
    Brand NVARCHAR(100),
    Description NVARCHAR(255),
    Size NVARCHAR(50),
    VendorNumber INT,
    VendorName NVARCHAR(255),
    PONumber NVARCHAR(50),
    PODate DATE,
    ReceivingDate DATE,
    InvoiceDate DATE,
    PayDate DATE,
    PurchasePrice DECIMAL(10, 2),
    Quantity INT,
    Dollars DECIMAL(10, 2),
    Classification NVARCHAR(100),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES PurchasePrices(SupplierID),
    FOREIGN KEY (InventoryID) REFERENCES BegInventory(InventoryID)
);
GO

--2.6. Tabla: Sales
CREATE TABLE Sales (
    SalesID INT IDENTITY(1,1) PRIMARY KEY,
    InventoryID INT,
    Store NVARCHAR(100),
    Brand NVARCHAR(100),
    Description NVARCHAR(255),
    Size NVARCHAR(50),
    SalesQuantity INT,
    SalesDollars DECIMAL(10, 2),
    SalesPrice DECIMAL(10, 2),
    SalesDate DATE,
    Volume NVARCHAR(50),
    Classification NVARCHAR(100),
    ExciseTax DECIMAL(10, 2),
    VendorNo INT,
    VendorName NVARCHAR(255),
    FOREIGN KEY (InventoryID) REFERENCES BegInventory(InventoryID)
);
GO

/* Paso 3: Verificar Relaciones
Las relaciones definidas son las siguientes:

SupplierID: Relaciona PurchasePrices con InvoicePurchases y Purchases mediante claves foráneas.
InventoryID: Relaciona BegInventory con EndInventory, Purchases y Sales mediante claves primarias y foráneas. */
