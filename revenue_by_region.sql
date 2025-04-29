--Revenue by Region
SELECT 
    region,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY region
ORDER BY revenue DESC;
