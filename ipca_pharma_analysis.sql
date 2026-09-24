USE ipca_pharma;

-- 1. Total Revenue
SELECT
    SUM(revenue) AS total_revenue
FROM fact_sales;


-- 2. Revenue by Region
SELECT
    region,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY region
ORDER BY total_revenue DESC;


-- 3. Revenue by Therapeutic Area
SELECT
    therapeutic_area,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY therapeutic_area
ORDER BY total_revenue DESC;


-- 4. Top 5 Products by Revenue
SELECT
    product_name,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;


-- 5. Monthly Revenue
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;


-- 6. Payment Status Analysis
SELECT
    payment_status,
    COUNT(*) AS order_count,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY payment_status
ORDER BY total_revenue DESC;


-- 7. Customer Type Analysis
SELECT
    customer_type,
    COUNT(*) AS order_count,
    SUM(units_sold) AS total_units_sold,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY customer_type
ORDER BY total_revenue DESC;