
from pathlib import Path
import pandas as pd

PROJECT_DIR = Path(__file__).resolve().parent.parent
file_path = PROJECT_DIR / "data" / "raw" / "superstore.xlsx"

df = pd.read_excel(file_path, sheet_name="Orders")

# Group discount levels for easier comparison

df["Discount Band"] = pd.cut(
    df["Discount"],
    bins=[-0.001, 0, 0.10, 0.20, 0.30, 0.50, 1.0],
    labels=[
        "No Discount",
        ">0–10%",
        ">10–20%",
        ">20–30%",
        ">30–50%",
        ">50%"
    ],
    include_lowest=True
)

discount_analysis = (
    df.groupby("Discount Band", observed=True)
    .agg(
        Order_Lines=("Order ID", "size"),
        Sales=("Sales", "sum"),
        Profit=("Profit", "sum"),
        Average_Discount=("Discount", "mean")
    )
)

discount_analysis["Profit_Margin_Pct"] = (
    discount_analysis["Profit"] /
    discount_analysis["Sales"] * 100
)

print("\n--- DISCOUNT IMPACT ANALYSIS ---")
print(discount_analysis.round(2))

output_dir = PROJECT_DIR / "data" / "processed"
output_dir.mkdir(parents=True, exist_ok=True)

discount_analysis.to_csv(
    output_dir / "discount_analysis.csv"
)

print("\nSaved: data/processed/discount_analysis.csv")
c