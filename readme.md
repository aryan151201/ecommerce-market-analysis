
# E-Commerce Sales & Profitability Analytics

## Project Overview
Analyzed e-commerce sales data using SQL Server to identify
profitability trends, loss-making products, discount patterns,
and regional performance.

## Tools Used
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL

## Dataset
- 10,194 order-line records
- Product categories and subcategories
- Sales, profit, quantity, and discount data
- Customer, shipping, and regional information

## Business Questions
1. What are the overall sales and profit?
2. Which categories generate the highest profit?
3. Which subcategories are loss-making?
4. Which products generate the largest losses?
5. How are discount levels associated with profitability?
6. Which regions perform best?

## Key Findings
- Total sales: 2,326,534.35
- Total profit: 292,296.81
- Overall profit margin: 12.56%
- Technology has the highest category profit margin at 17.45%.
- Furniture has a comparatively low profit margin of 2.61%.
- Furniture Tables generate a loss of approximately 17,753.21.
- The West region has the highest total profit.
- The Central region has the lowest regional profit margin at 7.92%.
- Discount bands above 30% show negative aggregate profit.

## SQL Concepts Practiced
- SELECT, WHERE, ORDER BY
- GROUP BY and HAVING
- SUM and COUNT
- CASE statements
- Aggregate calculations
- Profit margin calculations
- Filtering and sorting
- Regional and product-level analysis

## Project Structure
- data/ — source and processed data
- python/ — Python analysis scripts
- sql/ — SQL analysis queries
- powerbi/ — dashboard files
- screenshots/ — project visuals

## Conclusion
The analysis identifies profitable categories and regions,
loss-making products, and discount bands associated with
lower profitability. These findings can guide further
investigation into pricing and product performance.
