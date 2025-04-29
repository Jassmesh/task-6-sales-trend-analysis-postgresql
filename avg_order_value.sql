--Average Order Value per Month
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    ROUND(SUM(amount) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM orders
GROUP BY month
ORDER BY month;
