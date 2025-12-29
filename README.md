# Turkish Retail Sales Analysis (SQL)

## Business Objective
Analyze large-scale retail transaction data to understand whether revenue growth was driven by higher sales volume or improved pricing.

## Dataset Overview
- ~19.4 million transaction records
- Time period: 2017–2019
- Daily retail sales at store-product level
- Metrics include sales units, revenue, price, and promotions

## Tools Used
- MySQL
- SQL (CLI used for long-running queries)

## Key Questions Answered
1. Was revenue growth volume-driven or price-driven?
2. How did average revenue per unit change over time?
3. Did higher prices negatively impact demand?
4. Were pricing changes gradual or event-based?

## Key Insights
- Revenue increased from 2017 to 2019 despite a decline in total units sold.
- Average revenue per unit rose from 3.45 (2017) to 6.56 (2019), indicating improved monetization.
- Monthly analysis showed a gradual pricing increase rather than a one-time price shock.
- August 2019 recorded both peak pricing and peak unit sales, suggesting strong demand resilience.
- Volume decline in 2019 was gradual and did not offset revenue growth.

## Data Validation
- Verified date range (2017-01-02 to 2019-12-29)
- Checked for duplicate store-product-day records
- Identified partial data availability for late 2019 (Nov–Dec)

## Performance Considerations
Store-level aggregation on the full dataset was attempted but scoped out due to local compute limitations when aggregating ~19M rows. The analysis supports extension using pre-aggregated tables or cloud data warehouses.

## Future Scope
- Product-level analysis after cleansing product master data
- Store-level revenue concentration analysis in scalable environments
