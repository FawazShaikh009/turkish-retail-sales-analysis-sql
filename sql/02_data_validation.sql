/*
Purpose:
  Analyze monthly pricing trends to understand revenue growth drivers.

Dataset:
  Turkish Retail Sales (2017–2019), ~19.4M rows

Notes:
  Queries may take longer due to dataset size.
*/

-- Date range validation
SELECT 
    MIN(date) AS min_date,
    MAX(date) AS max_date
FROM sales;

-- Duplicate check at store-product-day grain
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT(store_id,'-',product_id,'-',date)) AS unique_rows
FROM sales;

-- Sample duplicate validation
SELECT 
    COUNT(*) AS sample_rows,
    COUNT(DISTINCT CONCAT(store_id,'-',product_id,'-',date)) AS sample_unique
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2018-01-31';
