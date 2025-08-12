--Business Value: Gives managers a quick, daily snapshot of key metrics without writing complex code.


CREATE VIEW daily_sales_summary AS
SELECT
    DATE(o.order_purchase_timestamp) AS sale_date,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_unique_id) AS unique_customers,
    SUM(op.payment_value) AS total_revenue
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
JOIN
    order_payments op ON o.order_id = op.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    sale_date
ORDER BY
    sale_date;

-- You can now query this view easily:
SELECT * FROM daily_sales_summary WHERE sale_date > '2018-01-01';