-- Monthly unit volume analysis
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(sales) AS total_units
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;
