
from pathlib import Path
import pandas as pd

# Load dataset
PROJECT_DIR = Path(__file__).resolve().parent.parent
file_path = PROJECT_DIR / "data" / "raw" / "superstore.xlsx"

df = pd.read_excel(file_path, sheet_name="Orders")

# 1. Overall KPIs
total_sales = df["Sales"].sum()
total_profit = df["Profit"].sum()
total_orders = df["Order ID"].nunique()
total_quantity = df["Quantity"].sum()
profit_margin = (total_profit / total_sales) * 100

print("\n--- OVERALL BUSINESS KPIs ---")
print(f"Total Sales: {total_sales:,.2f}")
print(f"Total Profit: {total_profit:,.2f}")
print(f"Unique Orders: {total_orders:,}")
print(f"Units Sold: {total_quantity:,}")
print(f"Profit Margin: {profit_margin:.2f}%")

# 2. Sales and profit by category
print("\n--- CATEGORY PERFORMANCE ---")
category_analysis = (
    df.groupby("Category")
    .agg(
        Sales=("Sales", "sum"),
        Profit=("Profit", "sum"),
        Quantity=("Quantity", "sum")
    )
    .sort_values("Sales", ascending=False)
)
print(category_analysis.round(2))

# 3. Sales and profit by region
print("\n--- REGIONAL PERFORMANCE ---")
region_analysis = (
    df.groupby("Region")
    .agg(
        Sales=("Sales", "sum"),
        Profit=("Profit", "sum")
    )
    .sort_values("Sales", ascending=False)
)
print(region_analysis.round(2))

# 4. Top 10 products by sales
print("\n--- TOP 10 PRODUCTS BY SALES ---")
top_products = (
    df.groupby("Product Name")
    .agg(
        Sales=("Sales", "sum"),
        Profit=("Profit", "sum")
    )
    .sort_values("Sales", ascending=False)
    .head(10)
)
print(top_products.round(2))

# 5. Loss-making sub-categories
print("\n--- SUB-CATEGORIES WITH LOWEST PROFIT ---")
subcategory_analysis = (
    df.groupby("Sub-Category")
    .agg(
        Sales=("Sales", "sum"),
        Profit=("Profit", "sum")
    )
    .sort_values("Profit")
)
print(subcategory_analysis.round(2))

# 6. Monthly sales and profit trends
df["Order Month"] = df["Order Date"].dt.to_period("M")

monthly_analysis = (
    df.groupby("Order Month")
    .agg(
        Sales=("Sales", "sum"),
        Profit=("Profit", "sum")
    )
    .reset_index()
)

print("\n--- MONTHLY SALES AND PROFIT ---")
print(monthly_analysis.to_string(index=False))

# Export analysis results
output_dir = PROJECT_DIR / "data" / "processed"
output_dir.mkdir(parents=True, exist_ok=True)

category_analysis.to_csv(output_dir / "category_analysis.csv")
region_analysis.to_csv(output_dir / "region_analysis.csv")
top_products.to_csv(output_dir / "top_products.csv")
subcategory_analysis.to_csv(output_dir / "subcategory_analysis.csv")
monthly_analysis.to_csv(output_dir / "monthly_analysis.csv", index=False)

print("\nAnalysis complete. Results saved in data/processed/")