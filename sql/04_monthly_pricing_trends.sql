/*
Purpose:
  Analyze monthly pricing trends by computing average revenue per unit
  to identify pricing and monetization changes over time.

Dataset:
  Turkish Retail Sales (2017–2019), ~19.4M rows

Notes:
  Query restricted to 2018–2019 for performance and trend clarity.
*/

SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    ROUND(SUM(revenue) / SUM(sales), 2) AS avg_revenue_per_unit
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;
