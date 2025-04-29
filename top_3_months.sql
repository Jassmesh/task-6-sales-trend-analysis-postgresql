--Top 3 Months by Revenue
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY month
ORDER BY total_revenue DESC
LIMIT 3;
