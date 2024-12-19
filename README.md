# Retail-Sales-Analysis
A data analysis project examining retail sales data using Python, Pandas, and SQL.

## Overview

This project analyzes a retail sales dataset containing information about orders, products, customers, and sales performance. The dataset includes details such as:

- Order information (dates, shipping)
- Customer segments
- Product categories
- Geographic data
- Pricing and profit metrics

## Files

- `orders.csv` - Raw sales data containing ~10,000 records
- `order_analysis.ipynb` - Jupyter notebook for data preprocessing and transformation
- `analysis_sql/analysis.sql` - SQL queries for business insights

## Data Processing

The project workflow includes:

1. **Data Preprocessing** (Jupyter Notebook):
   - Loading and cleaning the raw sales data
   - Converting data types and handling missing values
   - Calculating sales price and profit metrics
   - Exporting processed data to SQLite database

2. **SQL Analysis**:
   - Revenue analysis by product and region
   - Month-over-month growth comparison (2022 vs 2023)
   - Category performance analysis
   - Subcategory growth analysis by profit
   - Top product identification by region

## Key Analyses

- Top 10 revenue-generating products
- Top 5 selling products by region
- Monthly sales trends comparison between 2022 and 2023
- Peak sales months by category
- Subcategory growth analysis

## Tools Used

- **SQLite**
- **Jupyter Notebook**
- **Python**
- **Pandas**


