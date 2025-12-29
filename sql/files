-- Schema for retail sales fact table
-- Large-scale transactional dataset (2017–2019)

use retail_analytics;

CREATE TABLE sales (
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    date DATE,
    sales INT,
    revenue DECIMAL(10,2),
    stock INT,
    price_raw VARCHAR(20),
    promo_type_1 VARCHAR(50),
    promo_bin_1 VARCHAR(50),
    promo_type_2 VARCHAR(50),
    promo_bin_2 VARCHAR(50),
    promo_discount_2 VARCHAR(50),
    promo_discount_type_2 VARCHAR(50),
    train_or_test VARCHAR(10),
    price DECIMAL(10,2)
);

-- Indexes for time-series analysis
CREATE INDEX idx_sales_date ON sales(date);
CREATE INDEX idx_sales_store_product_date 
ON sales(store_id, product_id, date);

-- Validate date range
SELECT 
    MIN(date) AS min_date,
    MAX(date) AS max_date
FROM sales;

-- Check for duplicate store-product-day records
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT(store_id,'-',product_id,'-',date)) AS unique_rows
FROM sales;

-- Monthly sample check for duplicates
SELECT 
    COUNT(*) AS sample_rows,
    COUNT(DISTINCT CONCAT(store_id,'-',product_id,'-',date)) AS sample_unique
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2018-01-31';

-- Yearly revenue and volume summary
SELECT 
    YEAR(date) AS year,
    ROUND(SUM(revenue), 2) AS total_revenue,
    SUM(sales) AS total_units
FROM sales
GROUP BY YEAR(date)
ORDER BY year;

-- Average revenue per unit by year
SELECT 
    year,
    ROUND(total_revenue / total_units, 2) AS avg_revenue_per_unit
FROM sales_yearly_summary
ORDER BY year;

-- Monthly average revenue per unit (pricing trend)
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    ROUND(SUM(revenue) / SUM(sales), 2) AS avg_revenue_per_unit
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;

-- Monthly unit volume analysis
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(sales) AS total_units
FROM sales
WHERE date BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;

## Key Findings

# 1. Revenue growth from 2017 to 2019 was driven by a steady increase in average revenue per unit rather than sales volume.
# 2. Average revenue per unit increased from 3.45 (2017) to 6.56 (2019), indicating improved monetization.
# 3. Monthly pricing analysis showed a gradual upward trend rather than a single price shock.
# 4. August 2019 recorded both peak pricing and peak unit sales, suggesting demand resilience.
# 5. Unit volume decline in 2019 was gradual and did not offset revenue growth.

## Limitations
-- Product master data contained systematic missing values in numeric attributes and was excluded to preserve analysis reliability.
-- store-level aggregation on the full dataset was constrained by local compute limits.

## Future Scope
-- Product-category analysis after cleansing dimension data.
-- Store revenue concentration analysis using pre-aggregated tables or cloud data warehouses.
