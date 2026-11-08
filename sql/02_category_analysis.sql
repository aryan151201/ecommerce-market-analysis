USE EcommerceAnalyticsDB;
GO

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