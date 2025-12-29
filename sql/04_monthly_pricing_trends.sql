/*
Purpose:
  Analyze monthly pricing trends to understand revenue growth drivers.

Dataset:
  Turkish Retail Sales (2017–2019), ~19.4M rows

Notes:
  Queries may take longer due to dataset size.
*/

-- Monthly average revenue per unit
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    ROUND(SUM(revenue) / SUM(sales), 2) AS avg_revenue_per_unit
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;
