-- Analytical Queries
-- These queries answer specific business questions using structured aggregation.

-- 1. Product Performance: Volume vs Revenue
SELECT 
    product,
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    SUM(total_price) AS total_revenue,
    ROUND(AVG(total_price), 2) AS avg_order_value
FROM orders
WHERE order_status != 'Cancelled'
GROUP BY product
ORDER BY total_revenue DESC;


-- 2. Channel Performance: Referral Sources
SELECT 
    referral_source,
    COUNT(order_id) AS total_orders,
    SUM(total_price) AS total_revenue,
    ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM orders WHERE order_status != 'Cancelled'), 2) AS pct_of_total_revenue
FROM orders
WHERE order_status != 'Cancelled'
GROUP BY referral_source
ORDER BY total_revenue DESC;


-- 3. High-Value Customers (Top 10 by Delivered Revenue)
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_items_purchased,
    SUM(total_price) AS total_spent
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
HAVING total_spent > 500
ORDER BY total_spent DESC
LIMIT 10;


-- 4. Payment Method & Average Order Value
SELECT 
    payment_method,
    COUNT(order_id) AS total_orders,
    SUM(total_price) AS total_revenue,
    ROUND(AVG(total_price), 2) AS avg_order_value
FROM orders
GROUP BY payment_method
ORDER BY avg_order_value DESC;


-- 5. Monthly Revenue Trends
SELECT 
    strftime('%Y-%m', order_date) AS order_month,
    COUNT(order_id) AS total_orders,
    SUM(total_price) AS gross_revenue
FROM orders
GROUP BY order_month
ORDER BY order_month ASC;


-- 6. Revenue Impact of Order Status
SELECT 
    order_status,
    COUNT(order_id) AS total_orders,
    SUM(total_price) AS gross_revenue,
    ROUND(AVG(total_price), 2) AS avg_order_value
FROM orders
GROUP BY order_status
ORDER BY gross_revenue DESC;
