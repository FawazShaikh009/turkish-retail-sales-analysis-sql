/*
Purpose:
  Analyze monthly pricing trends to understand revenue growth drivers.

Dataset:
  Turkish Retail Sales (2017–2019), ~19.4M rows

Notes:
  Queries may take longer due to dataset size.
*/

-- Monthly unit volume analysis
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(sales) AS total_units
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;
