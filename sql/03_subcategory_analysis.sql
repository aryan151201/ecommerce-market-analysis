USE EcommerceAnalyticsDB;
GO

SELECT
    Category,
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Category, Sub_Category
ORDER BY Total_Profit ASC;