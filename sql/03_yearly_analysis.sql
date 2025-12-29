-- Yearly revenue and unit summary
SELECT 
    YEAR(date) AS year,
    ROUND(SUM(revenue), 2) AS total_revenue,
    SUM(sales) AS total_units
FROM sales
GROUP BY YEAR(date)
ORDER BY year;

-- Average revenue per unit
SELECT 
    year,
    ROUND(total_revenue / total_units, 2) AS avg_revenue_per_unit
FROM sales_yearly_summary
ORDER BY year;
