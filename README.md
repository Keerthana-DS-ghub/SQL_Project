# SQL Project: Sales and Manufacturing Insights

![Project Banner](banner.png)

## Description
This project involves analyzing sales, manufacturing, and forecast data using SQL. The goal is to provide insights into customer behavior, sales trends, and manufacturing costs. The project includes several fact and dimension tables, which are used to perform various SQL queries for data analysis.

### Key Features:
- Data analysis using SQL queries
- Data cleaning and transformation
- Analysis of sales, forecasts, and manufacturing costs

## Tables Involved
### Dimension Tables:
- **dim_customer**: customer_code, customer, platform, channel, market, sub_zone, region
- **dim_product**: product_code, division, segment, category, product, variant

### Fact Tables:
- **fact_forecast_month**: date, fiscal_year, product_code, customer_code, forecast_quantity
- **fact_freight_cost**: market, fiscal_year, freight_pct, other_cost_pct
- **fact_gross_price**: product_code, fiscal_year, gross_price
- **fact_manufacturing_cost**: product_code, cost_year, manufacturing_cost
- **fact_pre_invoice_deductions**: customer_code, fiscal_year, pre_invoice_discount_pct
- **fact_post_invoice_deductions**: customer_code, product_code, date, discounts_pct, other_deductions_pct
- **fact_sales_monthly**: date, product_code, customer, sold_quantity

## Technologies Used:
- MySQL for data analysis
- SQL queries for data manipulation and transformation
