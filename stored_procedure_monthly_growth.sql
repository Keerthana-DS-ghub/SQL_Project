Stored Procedure: Calculate Monthly Growth for a Product

DELIMITER $$

CREATE PROCEDURE CalculateMonthlyGrowth(IN in_product_code VARCHAR(20))
BEGIN
    WITH monthly_sales AS (
        SELECT 
            DATE_FORMAT(date, '%Y-%m') AS month,
            SUM(sold_quantity) AS quantity
        FROM fact_sales_monthly
        WHERE product_code = in_product_code
        GROUP BY DATE_FORMAT(date, '%Y-%m')
    )
    SELECT 
        month,
        quantity,
        LAG(quantity) OVER (ORDER BY month) AS prev_month_quantity,
        ROUND(
            ((quantity - LAG(quantity) OVER (ORDER BY month)) / LAG(quantity) OVER (ORDER BY month)) * 100, 
            2
        ) AS growth_pct
    FROM monthly_sales;
END $$

DELIMITER ;
