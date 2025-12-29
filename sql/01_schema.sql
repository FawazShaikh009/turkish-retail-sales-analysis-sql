/*
Purpose:
  Define schema and indexing strategy for retail sales fact table.

Dataset:
  Turkish Retail Sales (2017–2019), ~19.4M rows

Notes:
  Data imported via batch Python script due to MySQL GUI limitations.
*/

CREATE TABLE IF NOT EXISTS sales (
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    date DATE,
    sales INT,
    revenue DECIMAL(10,2),
    stock INT,
    price_raw VARCHAR(20),
    price DECIMAL(10,2),
    promo_type_1 VARCHAR(50),
    promo_bin_1 VARCHAR(50),
    promo_type_2 VARCHAR(50),
    promo_bin_2 VARCHAR(50),
    promo_discount_2 VARCHAR(50),
    promo_discount_type_2 VARCHAR(50),
    train_or_test VARCHAR(10)
);

-- No primary key defined due to large fact-table grain
-- Logical uniqueness handled at (store_id, product_id, date)

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_sales_date
ON sales(date);

CREATE INDEX IF NOT EXISTS idx_sales_store_product_date
ON sales(store_id, product_id, date);
