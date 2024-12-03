-- Tabla Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,  -- Clave primaria
    Brand VARCHAR(255),
    Description VARCHAR(255),
    Size VARCHAR(50),
    Classification VARCHAR(50)
);

-- Tabla Vendors
CREATE TABLE Vendors (
    VendorNumber INT PRIMARY KEY,  -- Clave primaria y única
    VendorName VARCHAR(255) UNIQUE -- Nombre único del proveedor
);

-- Tabla PurchasePrices
CREATE TABLE PurchasePrices (
    SupplierID INT PRIMARY KEY,  -- Clave primaria
    ProductID INT,  -- Relación con Products
    Price DECIMAL(10, 2),
    size_ml DECIMAL(10, 2),  -- Tamaño en mililitros
    pack_count INT,  -- Número de unidades en el paquete
    Total_size_ml DECIMAL(10, 2),  -- Tamaño total en mililitros
    PurchasePrice DECIMAL(10, 2),
    VendorNumber INT,  -- Relación con Vendors
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (VendorNumber) REFERENCES Vendors(VendorNumber)
);

-- Tabla BegInventory
CREATE TABLE BegInventory (
    InventoryID INT PRIMARY KEY,  -- Clave primaria
    Store VARCHAR(255),
    City VARCHAR(255),
    ProductID INT,  -- Relación con Products
    OnHand INT,
    Price DECIMAL(10, 2),
    StartDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Tabla EndInventory
CREATE TABLE EndInventory (
    EndInventoryID INT PRIMARY KEY,  -- Clave primaria
    InventoryID INT,  -- Relación con BegInventory
    Store VARCHAR(255),
    City VARCHAR(255),
    ProductID INT,  -- Relación con Products
    OnHand INT,
    Price DECIMAL(10, 2),
    EndDate DATE,
    FOREIGN KEY (InventoryID) REFERENCES BegInventory(InventoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Tabla InvoicePurchases
CREATE TABLE InvoicePurchases (
    InvoiceID INT PRIMARY KEY,  -- Clave primaria
    VendorNumber INT,  -- Relación con Vendors
    InvoiceDate DATE,
    PONumber VARCHAR(50),
    PODate DATE,
    PayDate DATE,
    Quantity INT,
    Dollars DECIMAL(10, 2),
    Freight DECIMAL(10, 2),
    SupplierID INT,  -- Relación con PurchasePrices
    FOREIGN KEY (VendorNumber) REFERENCES Vendors(VendorNumber),
    FOREIGN KEY (SupplierID) REFERENCES PurchasePrices(SupplierID)
);

-- Tabla Purchases
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY,  -- Clave primaria
    InventoryID INT,  -- Relación con BegInventory
    ProductID INT,  -- Relación con Products
    VendorNumber INT,  -- Relación con Vendors
    PONumber VARCHAR(50),
    PODate DATE,
    ReceivingDate DATE,
    InvoiceDate DATE,
    PayDate DATE,
    PurchasePrice DECIMAL(10, 2),
    Quantity INT,
    Dollars DECIMAL(10, 2),
    Classification VARCHAR(50),
    SupplierID INT,  -- Relación con PurchasePrices
    FOREIGN KEY (InventoryID) REFERENCES BegInventory(InventoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (VendorNumber) REFERENCES Vendors(VendorNumber),
    FOREIGN KEY (SupplierID) REFERENCES PurchasePrices(SupplierID)
);

-- Tabla Sales
CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,  -- Clave primaria
    InventoryID INT,  -- Relación con BegInventory
    ProductID INT,  -- Relación con Products
    Store VARCHAR(255),
    SalesQuantity INT,
    SalesDollars DECIMAL(10, 2),
    SalesPrice DECIMAL(10, 2),
    SalesDate DATE,
    Volume VARCHAR(50),
    Classification VARCHAR(50),
    ExciseTax DECIMAL(10, 2),
    VendorNumber INT,  -- Relación con Vendors
    FOREIGN KEY (InventoryID) REFERENCES BegInventory(InventoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (VendorNumber) REFERENCES Vendors(VendorNumber)
);
