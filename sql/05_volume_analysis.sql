/*
Purpose:
  Analyze monthly sales volume trends to understand demand
  seasonality and unit movement over time.

Dataset:
  Turkish Retail Sales (2017–2019), ~19.4M rows

Notes:
  Query restricted to 2018–2019 for performance efficiency.
*/

SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(sales) AS total_units
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;
