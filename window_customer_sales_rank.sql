Window Function: Customer Sales Rank and Percentage

SELECT 
    customer_code,
    customer,
    region,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank,
    ROUND(total_sales / SUM(total_sales) OVER () * 100, 2) AS sales_pct
FROM (
    SELECT 
        c.customer_code,
        c.customer,
        c.region,
        SUM(s.sold_quantity * g.gross_price) AS total_sales
    FROM fact_sales_monthly s
    JOIN dim_customer c ON s.customer_code = c.customer_code
    JOIN fact_gross_price g ON s.product_code = g.product_code 
        AND YEAR(s.date) = g.fiscal_year
    GROUP BY c.customer_code, c.customer, c.region
) AS customer_sales;
