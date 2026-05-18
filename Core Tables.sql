USE SupplyChainProject;
GO

-- ==========================================
-- 1. Supply Chain Logistics Table
-- ==========================================
CREATE TABLE [Supply Chain] (
    Order_ID VARCHAR(50),
    Customer_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Region VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    [Product ID] VARCHAR(50),
    Category VARCHAR(50),
    [Sub-Category] VARCHAR(50),
    [Product Name] VARCHAR(255),
    Unit_Price DECIMAL(18, 2),
    Quantity INT,
    Supplier_ID VARCHAR(50),
    Supplier_Name VARCHAR(100),
    Warehouse_ID VARCHAR(50),
    Transport_Mode VARCHAR(50),
    Carrier VARCHAR(50),
    Route VARCHAR(100),
    Stock_On_Hand INT,
    Reorder_Level INT,
    Lead_Time_Days INT,
    Procurement_Cost DECIMAL(18, 2),
    Transportation_Cost DECIMAL(18, 2),
    Total_Cost DECIMAL(18, 2),
    Delivery_Status VARCHAR(50),
    Delay_Days INT,
    Fill_Rate DECIMAL(5, 2),
    Forecast_Demand INT,
    Actual_Demand INT
);

-- ==========================================
-- 2. Customer Dimension Table
-- ==========================================
CREATE TABLE D_CUSTOMER (
    [Cust Key] INT PRIMARY KEY,
    [Cust Name] VARCHAR(100),
    [Cust Address] VARCHAR(255),
    [Cust City] VARCHAR(100),
    [Cust State] VARCHAR(100),
    [Cust Zip Code] VARCHAR(20),
    [Cust County] VARCHAR(100),
    [Cust Region] VARCHAR(50),
    [Cust Since] DATETIME,
    [Cust Type] VARCHAR(50),
    [Cust Gender] VARCHAR(20),
    [Cust Age] INT,
    [Age Group] VARCHAR(20),
    [Civil Status] VARCHAR(50),
    [Loyalty Program] INT
);

-- ==========================================
-- 3. Sales Fact Table (Header Level)
-- ==========================================
CREATE TABLE F_SALES (
    [Order Number] INT,
    [Cust Key] INT,
    [Store Key] INT,
    [Transaction Type] VARCHAR(50),
    [Date] DATE,
    [Purchase Method] VARCHAR(50)
);

-- ==========================================
-- 4. Calendar Dimension Table
-- ==========================================
CREATE TABLE [4_5_4_CALENDAR] (
    [Date] DATE,
    [Fiscal Year] INT,
    [Season] VARCHAR(50),
    [Fiscal Quarter] VARCHAR(10),
    [Fiscal Period] INT,
    [Fiscal Week] INT,
    [Fiscal Day of Year] INT
);

-- ==========================================
-- 5. Product Dimension Table
-- ==========================================
CREATE TABLE D_PRODUCT (
    [Product Key] INT PRIMARY KEY,
    [Product Name] VARCHAR(255),
    [Product Type] VARCHAR(100),
    [Product Family] VARCHAR(100),
    [Product Line] VARCHAR(100),
    [Product Group] VARCHAR(100),
    [Product Description] VARCHAR(MAX),
    [Sku Number] VARCHAR(100),
    [Price] DECIMAL(18, 2)
);

-- ==========================================
-- 6. Store Dimension Table
-- ==========================================
CREATE TABLE D_STORE (
    [Store Key] INT PRIMARY KEY,
    [Store Name] VARCHAR(255),
    [Store Address] VARCHAR(255),
    [Store City] VARCHAR(100),
    [Store State] VARCHAR(100),
    [Store Zip Code] VARCHAR(20),
    [Store County] VARCHAR(100),
    [Store Region] VARCHAR(50),
    [Store Open Date] DATE,
    [Last Layout Update] DATE,
    [Latitude] DECIMAL(10, 6),
    [Longitude] DECIMAL(10, 6),
    [Store Size] VARCHAR(50),
    [Monthly Rent Cost] DECIMAL(18, 2),
    [Number of Employees] INT,
    [Online Ordering] VARCHAR(100),
    [Selling Square Footage] INT,
    [Total Square Footage] INT,
    [State Code] INT
);

-- ==========================================
-- 7. Point of Sale Fact Table (Line Items)
-- ==========================================
CREATE TABLE F_POINT_OF_SALE (
    [Order Number] INT,
    [Product Key] INT,
    [Sales Quantity] INT,
    [Sales Amount] DECIMAL(18, 2),
    [Cost Amount] DECIMAL(18, 2)
);

-- ==========================================
-- 8. Inventory Fact Table
-- ==========================================
CREATE TABLE F_INVENTORY_ADJUSTED (
    [Product Key] INT,
    [Product Name] VARCHAR(255),
    [Product Type] VARCHAR(100),
    [Product Family] VARCHAR(100),
    [Product Line] VARCHAR(100),
    [Product Group] VARCHAR(100),
    [Product Description] VARCHAR(MAX),
    [Sku Number] VARCHAR(100),
    [Price] DECIMAL(18, 2),
    [Cost Amount] DECIMAL(18, 6),
    [Quantity on Hand] INT,
    [Store Key] INT,
    [Inventory_PK] INT PRIMARY KEY,
    [Minimum Stock Quantity] INT,
    [Desired Stock Quantity] INT
);

-- ==========================================
-- 9. US Counties GeoJSON Table
-- ==========================================
CREATE TABLE D_GEOJSON_US_COUNTIES (
    [State Code] INT,
    [State Name] VARCHAR(100),
    [County Name] VARCHAR(100)
);

-- ==========================================
-- 10. The Invent View Table
-- ==========================================
CREATE TABLE [Invent View] (
    [Order Number] INT,
    [Date] DATE,
    [SKU Number] VARCHAR(100),
    [Quantity] INT,
    [Cost] DECIMAL(18, 6),
    [Price] DECIMAL(18, 2),
    [Product Type] VARCHAR(100),
    [Product Family] VARCHAR(100),
    [Product Name] VARCHAR(255),
    [Store Name] VARCHAR(100),
    [Store Key] INT,
    [Store Region] VARCHAR(50),
    [Store State] VARCHAR(50),
    [Store City] VARCHAR(100),
    [Store Latitude] DECIMAL(10, 6),
    [Store Longitude] DECIMAL(10, 6),
    [Customer Name] VARCHAR(100),
    [Cust Key] INT
);