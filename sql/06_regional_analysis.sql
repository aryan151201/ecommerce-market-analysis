USE EcommerceAnalyticsDB;
GO

SELECT
    Region,
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Region, Category
ORDER BY Region, Total_Sales DESC;