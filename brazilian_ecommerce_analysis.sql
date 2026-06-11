-- ================================================
-- Brazilian E-Commerce Analysis | SQL Queries
-- Dataset: Olist E-Commerce (95K+ orders, 8 tables)
-- ================================================

-- ================================================
-- KPI 1: Average review score by product category
-- Shows which product categories get the highest customer satisfaction
-- ================================================
SELECT 
    pt.product_category_name_english AS category,
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(DISTINCT r.review_id) AS total_reviews
FROM olist_order_reviews r
JOIN olist_order_items oi ON r.order_id = oi.order_id
JOIN olist_products p ON oi.product_id = p.product_id
JOIN product_category_name_translation pt 
    ON p.product_category_name = pt.product_category_name
GROUP BY pt.product_category_name_english
ORDER BY avg_review_score DESC;

-- ================================================
-- KPI 2: On-time vs delayed delivery rate
-- Measures logistics performance
-- ================================================
SELECT 
    CASE 
        WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 'On Time'
        ELSE 'Delayed'
    END AS delivery_status,
    COUNT(*) AS total_orders,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM olist_orders
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;

-- ================================================
-- KPI 3: Monthly order volume & revenue trend
-- Tracks business growth over time
-- ================================================
SELECT 
    strftime('%Y-%m', order_purchase_timestamp) AS year_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue
FROM olist_orders o
JOIN olist_order_items oi ON o.order_id = oi.order_id
WHERE order_status = 'delivered'
GROUP BY year_month
ORDER BY year_month;

-- ================================================
-- KPI 4: Top 5 best-selling product categories (by quantity)
-- Identifies most popular product types
-- ================================================
SELECT 
    pt.product_category_name_english AS category,
    SUM(oi.order_item_id) AS total_items_sold
FROM olist_order_items oi
JOIN olist_products p ON oi.product_id = p.product_id
JOIN product_category_name_translation pt 
    ON p.product_category_name = pt.product_category_name
GROUP BY pt.product_category_name_english
ORDER BY total_items_sold DESC
LIMIT 5;

-- ================================================
-- KPI 5: Customer repeat purchase rate
-- Measures customer loyalty
-- ================================================
WITH customer_orders AS (
    SELECT customer_id, COUNT(DISTINCT order_id) AS order_count
    FROM olist_orders
    GROUP BY customer_id
)
SELECT 
    ROUND(100.0 * SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS repeat_purchase_rate
FROM customer_orders;

-- ================================================
-- KPI 6: Average delivery time (in days) by customer region (state)
-- Identifies regions with logistics delays
-- ================================================
SELECT 
    c.customer_state AS state,
    ROUND(AVG(JULIANDAY(order_delivered_customer_date) - JULIANDAY(order_purchase_timestamp)), 1) AS avg_delivery_days
FROM olist_orders o
JOIN olist_customers c ON o.customer_id = c.customer_id
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days;

-- ================================================
-- KPI 7: Payment type preference (order count & value)
-- Shows how customers prefer to pay
-- ================================================
SELECT 
    payment_type,
    COUNT(DISTINCT order_id) AS order_count,
    ROUND(SUM(payment_value), 2) AS total_paid,
    ROUND(AVG(payment_value), 2) AS avg_ticket
FROM olist_order_payments
GROUP BY payment_type
ORDER BY total_paid DESC;

-- ================================================
-- KPI 8: Sellers with highest average review score (min 20 reviews)
-- Highlights top-performing sellers
-- ================================================
SELECT 
    s.seller_id,
    s.seller_city,
    s.seller_state,
    ROUND(AVG(r.review_score), 2) AS avg_score,
    COUNT(r.review_id) AS review_count
FROM olist_order_reviews r
JOIN olist_order_items oi ON r.order_id = oi.order_id
JOIN olist_sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id
HAVING COUNT(r.review_id) >= 20
ORDER BY avg_score DESC
LIMIT 10;

-- ================================================
-- KPI 9: Freight % of order value – expensive vs cheap products
-- Analyzes shipping cost burden by price tier
-- ================================================
SELECT 
    CASE 
        WHEN oi.price < 50 THEN 'Low (<50)'
        WHEN oi.price BETWEEN 50 AND 200 THEN 'Medium (50-200)'
        ELSE 'High (>200)'
    END AS price_tier,
    ROUND(AVG(100.0 * oi.freight_value / oi.price), 2) AS avg_freight_percentage,
    COUNT(*) AS total_items
FROM olist_order_items oi
WHERE oi.price > 0
GROUP BY price_tier
ORDER BY avg_freight_percentage DESC;
