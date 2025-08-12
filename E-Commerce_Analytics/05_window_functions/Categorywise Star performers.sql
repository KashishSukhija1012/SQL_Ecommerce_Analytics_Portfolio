-- Rank Products Within Each Category by Sales.
-- Business Insight: Identifies the "star performers" in each category, informing marketing and inventory stocking decisions.

WITH ProductSales AS (
    SELECT
        p.product_id,
        pct.product_category_name_english,
        SUM(oi.price) as total_sales
    FROM
        order_items oi
    JOIN
        products p ON oi.product_id = p.product_id
    JOIN
        product_category_name_translation pct ON p.product_category_name = pct.product_category_name
    GROUP BY
        p.product_id, pct.product_category_name_english
)
SELECT
    product_id,
    product_category_name_english,
    total_sales,
    -- Rank products in each category partition
    RANK() OVER (PARTITION BY product_category_name_english ORDER BY total_sales DESC) as sales_rank_in_category
FROM
    ProductSales
ORDER BY
    product_category_name_english, sales_rank_in_category;