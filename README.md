# E-commerce Orders Analysis

## Project Overview
This project analyzes e-commerce order data to extract insights about monthly revenue trends and order volumes. The analysis focuses on quarterly performance and identifies peak revenue months.

## Dataset
- **Source**: Kaggle dataset (online orders data)
- **Original format**: CSV file with date format `mm/dd/yyyy`
- **Processed format**: SQLite database with standardized date format `yyyy-mm-dd`

## Data Schema
The orders table contains the following columns:
- `order_id` (INTEGER PRIMARY KEY): Unique identifier for each order
- `date` (DATE): Order date in YYYY-MM-DD format
- `product_category` (TEXT): Category of the ordered product
- `product_name` (TEXT): Name of the ordered product
- `units_sold` (INTEGER): Number of units sold in the order
- `unit_price` (REAL): Price per unit
- `total_revenue` (REAL): Total revenue from the order
- `region` (TEXT): Geographic region of the order
- `payment_method` (TEXT): Payment method used

## Data Processing Steps

### 1. Data Preparation
1. Downloaded CSV file from Kaggle
2. Opened in Excel for preprocessing:
   - Renamed all columns to lowercase
   - Converted date column from `mm/dd/yyyy` to `yyyy-mm-dd` format
   - Set date column to Date data type

### 2. Database Setup
1. Created SQLite database: `temp.db`
2. Created orders table with appropriate schema
3. Imported processed CSV data using SQLite commands:
   ```sql
   .mode csv
   .import online_orders_data.csv --skip 1 orders
   ```

## Analysis Results

### Query 1: Q1 Monthly Performance
**Purpose**: Analyze monthly revenue and order volume for the first quarter
- Groups data by month
- Calculates total monthly revenue and distinct order count
- Limited to first 4 months (Q1)

### Query 2: Top Revenue Months
**Purpose**: Identify the 3 months with highest revenue performance
- Ranks months by total revenue (ascending order)
- Shows top 3 performing months with corresponding order volumes

## Files Structure
```
project/
├── README.md                    # This documentation file
├── queries.sql                  # SQL analysis queries
├── online_orders_data.csv       # Processed dataset
└── temp.db                      # SQLite database
└── Outputs                      # screenshot of output of each query
```

## Technologies Used
- **Excel**: Data preprocessing and format conversion
- **SQLite3**: Database management and querying
- **SQL**: Data analysis and aggregation


## Notes
- Date format standardization was crucial for proper temporal analysis
- Column naming convention (lowercase) ensures consistency across queries
- Database approach enables scalable analysis for larger datasets
