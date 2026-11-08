CREATE DATABASE EcommerceAnalyticsDB;
GO
USE EcommerceAnalyticsDB;
GO

SELECT TOP 10 *
FROM dbo.Orders;

USE EcommerceAnalyticsDB;
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


USE EcommerceAnalyticsDB;
GO

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders'
  AND COLUMN_NAME = 'Product_Name';


  USE EcommerceAnalyticsDB;
GO

SELECT COUNT(*) AS Total_Rows
FROM dbo.Orders;

SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percent
FROM dbo.Orders;

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Category
ORDER BY Total_Profit DESC;


SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percent
FROM dbo.Orders
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;

SELECT
    Category,
    [Sub-Category],
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percent
FROM dbo.Orders
GROUP BY Category, [Sub-Category]
ORDER BY Total_Profit ASC;


USE EcommerceAnalyticsDB;
GO

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders'
ORDER BY ORDINAL_POSITION;


SELECT
    Category,
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percent
FROM dbo.Orders
GROUP BY
    Category,
    Sub_Category
ORDER BY Total_Profit ASC;


SELECT
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.10 THEN '0-10%'
        WHEN Discount <= 0.20 THEN '10-20%'
        WHEN Discount <= 0.30 THEN '20-30%'
        WHEN Discount <= 0.50 THEN '30-50%'
        ELSE 'Above 50%'
    END AS Discount_Band,
    COUNT(*) AS Order_Lines,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Pct
FROM dbo.Orders
GROUP BY
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.10 THEN '0-10%'
        WHEN Discount <= 0.20 THEN '10-20%'
        WHEN Discount <= 0.30 THEN '20-30%'
        WHEN Discount <= 0.50 THEN '30-50%'
        ELSE 'Above 50%'
    END
ORDER BY MIN(Discount);

    SELECT TOP 10
        Product_Name,
        SUM(Quantity) AS Units_Sold,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM dbo.Orders
    GROUP BY Product_Name
    HAVING SUM(Profit) < 0
    ORDER BY Total_Profit ASC;


    USE EcommerceAnalyticsDB;
GO

-- Identify the 10 most loss-making products
SELECT TOP 10
    Product_Name,
    SUM(Quantity) AS Units_Sold,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

SELECT
    Product_Name,
    Discount,
    COUNT(*) AS Order_Lines,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
WHERE Product_Name = 'Cubify CubeX 3D Printer Double Head Print'
GROUP BY Product_Name, Discount
ORDER BY Discount DESC;

SELECT
    Order_ID,
    Order_Date,
    Product_Name,
    Quantity,
    Sales,
    Discount,
    Profit
FROM dbo.Orders
WHERE Product_Name =
    'Cubify CubeX 3D Printer Double Head Print'
ORDER BY Profit ASC;


SELECT
    Discount,
    SUM(Quantity) AS Units_Sold,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) / NULLIF(SUM(Quantity), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Per_Unit
FROM dbo.Orders
WHERE Product_Name =
    'Cubify CubeX 3D Printer Double Head Print'
GROUP BY Discount
ORDER BY Discount;

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0
        / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Pct
FROM dbo.Orders
GROUP BY Region
ORDER BY Total_Profit DESC;



SELECT
    Region,
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY
    Region,
    Category
ORDER BY
    Region,
    Total_Sales DESC;   



    SELECT
    Region,
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
WHERE Region = 'Central'
  AND Category = 'Furniture'
GROUP BY
    Region,
    Sub_Category
ORDER BY Total_Profit ASC;


SELECT
    Discount,
    COUNT(*) AS Order_Lines,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
WHERE Region = 'Central'
  AND Sub_Category = 'Furnishings'
GROUP BY Discount
ORDER BY Discount;


SELECT
    Discount,
    COUNT(*) AS Order_Lines,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0
        / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Pct
FROM dbo.Orders
WHERE Region = 'Central'
  AND Sub_Category = 'Furnishings'
GROUP BY Discount
ORDER BY Discount;

SELECT
    Discount,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Pct
FROM dbo.Orders
WHERE Region = 'Central'
  AND Sub_Category = 'Furnishings'
GROUP BY Discount
ORDER BY Discount;



USE EcommerceAnalyticsDB;
GO

-- Business KPIs: sales, profit, orders and units sold
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Units_Sold
FROM dbo.Orders;




USE EcommerceAnalyticsDB;
GO

-- Category-wise sales, profit and profit margin
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Pct
FROM dbo.Orders
GROUP BY Category
ORDER BY Total_Profit DESC;



USE EcommerceAnalyticsDB;
GO

-- Analyze profit by category and subcategory
SELECT
    Category,
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Pct
FROM dbo.Orders
GROUP BY
    Category,
    Sub_Category
ORDER BY Total_Profit ASC;



USE EcommerceAnalyticsDB;
GO

-- Find the 10 most loss-making products
SELECT TOP 10
    Product_Name,
    SUM(Quantity) AS Units_Sold,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;



USE EcommerceAnalyticsDB;
GO

-- Analyze sales and profit by discount band
SELECT
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.10 THEN '0-10%'
        WHEN Discount <= 0.20 THEN '10-20%'
        WHEN Discount <= 0.30 THEN '20-30%'
        WHEN Discount <= 0.50 THEN '30-50%'
        ELSE 'Above 50%'
    END AS Discount_Band,

    COUNT(*) AS Order_Lines,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,

    CAST(
        SUM(Profit) * 100.0
        / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Pct

FROM dbo.Orders

GROUP BY
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.10 THEN '0-10%'
        WHEN Discount <= 0.20 THEN '10-20%'
        WHEN Discount <= 0.30 THEN '20-30%'
        WHEN Discount <= 0.50 THEN '30-50%'
        ELSE 'Above 50%'
    END

ORDER BY MIN(Discount);




USE EcommerceAnalyticsDB;
GO

-- Analyze sales and profitability by region
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0
        / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Pct
FROM dbo.Orders
GROUP BY Region
ORDER BY Total_Profit DESC;
       
        