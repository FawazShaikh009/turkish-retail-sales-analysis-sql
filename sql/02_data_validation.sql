/*
Purpose:
  Validate data integrity, date coverage, and logical uniqueness
  before performing analytical queries.

Dataset:
  Turkish Retail Sales (2017–2019), ~19.4M rows

Notes:
  Full-table duplicate checks may be expensive due to dataset size.
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

-- Sample duplicate validation (performance-safe)
SELECT 
    COUNT(*) AS sample_rows,
    COUNT(DISTINCT CONCAT(store_id,'-',product_id,'-',date)) AS sample_unique
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2018-01-31';

-- Null checks on critical fields
SELECT COUNT(*) AS null_price_rows
FROM sales
WHERE price IS NULL;

SELECT COUNT(*) AS null_sales_rows
FROM sales
WHERE sales IS NULL;
