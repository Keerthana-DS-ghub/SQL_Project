CTE: Product Profitability Analysis

WITH product_profitability AS (
    SELECT 
        p.product_code,
        p.product,
        p.category,
        AVG(g.gross_price) AS avg_price,
        AVG(m.manufacturing_cost) AS avg_cost,
        AVG(g.gross_price - m.manufacturing_cost) AS avg_profit
    FROM dim_product p
    JOIN fact_gross_price g ON p.product_code = g.product_code
    JOIN fact_manufacturing_cost m ON p.product_code = m.product_code
    GROUP BY p.product_code, p.product, p.category
)
SELECT 
    *,
    (avg_profit / avg_price) * 100 AS profit_margin_pct
FROM product_profitability
ORDER BY profit_margin_pct DESC;
