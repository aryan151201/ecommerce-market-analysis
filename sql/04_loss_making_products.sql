USE EcommerceAnalyticsDB;
GO

SELECT TOP 10
    Product_Name,
    SUM(Quantity) AS Units_Sold,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;