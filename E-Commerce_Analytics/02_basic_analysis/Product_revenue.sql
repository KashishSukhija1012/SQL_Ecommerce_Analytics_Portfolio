--2. What are the top 10 best-selling product categories by revenue?
--Business Insight: Shows which product categories are most valuable and should be prioritized for marketing and inventory.

SELECT
    pct.product_category_name_english,
    SUM(oi.price) AS total_revenue
FROM
    order_items oi
JOIN
    products p ON oi.product_id = p.product_id
JOIN
    product_category_name_translation pct ON p.product_category_name = pct.product_category_name
GROUP BY
    pct.product_category_name_english
ORDER BY
    total_revenue DESC
LIMIT 10;