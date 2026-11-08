
USE EcommerceAnalyticsDB;
GO

-- Business KPIs: sales, profit, orders and units sold
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Units_Sold
FROM dbo.Orders;
