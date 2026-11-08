
from pathlib import Path
import pandas as pd

# Locate the project folder automatically
PROJECT_DIR = Path(__file__).resolve().parent.parent
file_path = PROJECT_DIR / "data" / "raw" / "superstore.xlsx"

print("Looking for file at:", file_path)

df = pd.read_excel(file_path, sheet_name="Orders")

print("Dataset shape:", df.shape)
print(df.head())


# Basic dataset inspection
print("Dataset shape:", df.shape)

print("\nColumn names:")
print(df.columns.tolist())

print("\nFirst five rows:")
print(df.head())

print("\nData types:")
print(df.dtypes)

print("\nMissing values:")
print(df.isnull().sum())

print("\nDuplicate rows:", df.duplicated().sum())

# Business metrics
print("\nTotal Sales:", round(df["Sales"].sum(), 2))
print("Total Profit:", round(df["Profit"].sum(), 2))
print("Unique Orders:", df["Order ID"].nunique())

# Sales by category
print("\nSales by Category:")
print(
    df.groupby("Category")["Sales"]
      .sum()
      .sort_values(ascending=False)
)




