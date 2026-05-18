-- ------------- Total Orders ----------- --
SELECT 
    COUNT(DISTINCT [Order Number]) AS Total_Orders
FROM 
    F_SALES;

-- ----------- Orders by Store --------- --
SELECT 
    s.[Store Name],
    COUNT(DISTINCT f.[Order Number]) AS Total_Orders
FROM 
    F_SALES f
JOIN 
    D_STORE s ON f.[Store Key] = s.[Store Key]
GROUP BY 
    s.[Store Name]
ORDER BY 
    Total_Orders DESC;

-- #### Orders by Purchase Method #### --
SELECT 
    [Purchase Method],
    COUNT(DISTINCT [Order Number]) AS Total_Orders
FROM 
    F_SALES
GROUP BY 
    [Purchase Method];

-- #### Orders by Transaction Type #### --
SELECT 
    [Transaction Type],
    COUNT(*) AS Total_Transactions
FROM 
    F_SALES
GROUP BY 
    [Transaction Type];

-- ### Daily Sales Trend (Orders per Day) ### --
SELECT 
    [Date],
    COUNT(DISTINCT [Order Number]) AS Orders_Per_Day
FROM 
    F_SALES
GROUP BY 
    [Date]
ORDER BY 
    [Date];

-- ##### Total Inventory Stock ##### --
SELECT 
    SUM([Quantity on Hand]) AS Total_Stock
FROM 
    F_INVENTORY_ADJUSTED;

-- #### Inventory Value #### --
SELECT 
    SUM([Quantity on Hand] * [Price]) AS Inventory_Value
FROM 
    F_INVENTORY_ADJUSTED;

-- #### Cost Value of Inventory #### --
SELECT 
    SUM([Quantity on Hand] * [Cost Amount]) AS Total_Cost_Value
FROM 
    F_INVENTORY_ADJUSTED;

-- ### Top 10 Products by Inventory Value ### --
SELECT TOP 10
    [Product Name],
    SUM([Quantity on Hand] * [Price]) AS Product_Inventory_Value
FROM 
    F_INVENTORY_ADJUSTED
GROUP BY 
    [Product Name]
ORDER BY 
    Product_Inventory_Value DESC;

-- ## Stock Status (In Stock / Out of Stock) ## --
SELECT 
    [Product Name],
    [Quantity on Hand],
    CASE 
        WHEN [Quantity on Hand] = 0 THEN 'Out of Stock'
        ELSE 'In Stock'
    END AS Stock_Status
FROM 
    F_INVENTORY_ADJUSTED;

-- ### REGION WISE CUSTOMER COUNT ### --
SELECT 
    [Cust Region],
    COUNT([Cust Key]) AS Total_Customers
FROM 
    D_CUSTOMER
GROUP BY 
    [Cust Region]
ORDER BY 
    Total_Customers DESC;

-- ### CUSTOMER AGE GROUP ANALYSIS ### --
SELECT 
    c.[Age Group],
    COUNT(DISTINCT f.[Order Number]) AS Total_Orders
FROM 
    F_SALES f
JOIN 
    D_CUSTOMER c ON f.[Cust Key] = c.[Cust Key]
GROUP BY 
    c.[Age Group]
ORDER BY 
    Total_Orders DESC;

-- ### CUSTOMER TYPE ANALYSIS ### --
SELECT 
    c.[Cust Type],
    COUNT(DISTINCT f.[Order Number]) AS Total_Orders
FROM 
    F_SALES f
JOIN 
    D_CUSTOMER c ON f.[Cust Key] = c.[Cust Key]
GROUP BY 
    c.[Cust Type];

-- ### STORE REGION PERFORMANCE ### --
SELECT 
    s.[Store Region],
    COUNT(DISTINCT f.[Order Number]) AS Total_Orders
FROM 
    F_SALES f
JOIN 
    D_STORE s ON f.[Store Key] = s.[Store Key]
GROUP BY 
    s.[Store Region]
ORDER BY 
    Total_Orders DESC;

-- ### COUNTY LEVEL CUSTOMER MAPPING (Geo Join) ### --
SELECT 
    c.[Cust State],
    c.[Cust County],
    g.[County Name]
FROM 
    D_CUSTOMER c
JOIN 
    D_GEOJSON_US_COUNTIES g ON c.[Cust State] = g.[State Name];