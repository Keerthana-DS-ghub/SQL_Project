CTE: Region-wise and Category-wise Sales Summary

WITH sales_with_details AS (
    SELECT 
        s.date,
        s.customer_code,
        c.customer,
        c.region,
        s.product_code,
        p.product,
        p.category,
        s.sold_quantity,
        g.gross_price,
        (s.sold_quantity * g.gross_price) AS gross_sales
    FROM fact_sales_monthly s
    JOIN dim_customer c ON s.customer_code = c.customer_code
    JOIN dim_product p ON s.product_code = p.product_code
    JOIN fact_gross_price g ON s.product_code = g.product_code 
        AND YEAR(s.date) = g.fiscal_year
)
SELECT 
    region,
    category,
    SUM(gross_sales) AS total_sales,
    SUM(sold_quantity) AS total_quantity
FROM sales_with_details
GROUP BY region, category
ORDER BY total_sales DESC;
