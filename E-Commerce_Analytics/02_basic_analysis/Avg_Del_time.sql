--Business Insight: Delivery time is a critical component of customer satisfaction. This query calculates the average duration from when a customer makes a purchase to when they receive the item. A high average time might indicate problems with logistics or specific carriers, providing a clear area for operational improvement.

--What is the average time to deliver an order?
SELECT
    AVG(order_delivered_customer_date - order_approved_at) AS average_delivery_time
FROM
    orders
WHERE
    order_status = 'delivered'
    AND order_delivered_customer_date IS NOT NULL
    AND order_approved_at IS NOT NULL;