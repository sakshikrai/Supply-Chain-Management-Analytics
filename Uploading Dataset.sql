USE SupplyChainProject;
GO

-- 1. Load Supply Chain Logistics
BULK INSERT [Supply Chain]
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\Supply Chain.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 2. Load Customer Dimension
BULK INSERT D_CUSTOMER
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\D_CUSTOMER.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 3. Load Sales Fact Table
BULK INSERT F_SALES
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\F_SALES.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 4. Load Calendar Dimension
BULK INSERT [4_5_4_CALENDAR]
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\4_5_4_CALENDAR.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 5. Load Product Dimension
BULK INSERT D_PRODUCT
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\D_PRODUCT.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 6. Load Store Dimension
BULK INSERT D_STORE
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\D_STORE.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 7. Load Point of Sale Fact Table
BULK INSERT F_POINT_OF_SALE
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\F_POINT_OF_SALE.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 8. Load Inventory Fact Table
BULK INSERT F_INVENTORY_ADJUSTED
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\F_INVENTORY_ADJUSTED.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 9. Load US Counties GeoJSON
BULK INSERT D_GEOJSON_US_COUNTIES
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\D_GEOJSON_US_COUNTIES.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- 10. Load Invent View Table
BULK INSERT [Invent View]
FROM 'E:\Excel_Projects\All-Projects\Supply_Chain_Management\Dataset\Invent View.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);