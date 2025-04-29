--Revenue Growth Month-over-Month
WITH monthly_revenue AS (
    SELECT 
        TO_CHAR(order_date, 'YYYY-MM') AS month,
        SUM(amount) AS revenue
    FROM orders
    GROUP BY month
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) * 100 / LAG(revenue) OVER (ORDER BY month), 2) AS growth_percent
FROM monthly_revenue;
