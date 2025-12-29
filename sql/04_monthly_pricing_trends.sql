-- Monthly average revenue per unit
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    ROUND(SUM(revenue) / SUM(sales), 2) AS avg_revenue_per_unit
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;