/*
Purpose:
  Analyze monthly pricing trends to understand revenue growth drivers.

Dataset:
  Turkish Retail Sales (2017–2019), ~19.4M rows

Notes:
  Queries may take longer due to dataset size.
*/

-- Sales fact table schema
-- Data was imported via batch Python script due to MySQL GUI limitations
-- Dataset size: ~19.4M rows

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

-- Indexes for performance
CREATE INDEX idx_sales_date ON sales(date);
CREATE INDEX idx_sales_store_product_date 
ON sales(store_id, product_id, date);
