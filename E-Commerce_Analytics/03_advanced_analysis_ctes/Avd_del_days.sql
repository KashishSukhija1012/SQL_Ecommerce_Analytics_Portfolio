--How long does it take to deliver an order?
--The Business Question: Is our logistics network efficient? 
--We need to measure the average time it takes for an order to reach the customer after it's been purchased.
--Your Task: Using a subquery, calculate the average number of days between the order_purchase_timestamp and the order_delivered_customer_date for all delivered orders.
--Why it's valuable (Business Insight): This KPI is critical for customer satisfaction. 
--If the average delivery time is high or increasing, it's a red flag for the operations team. This data can be used to set realistic delivery estimates for customers and identify regions or shipping partners that are underperforming.-- For PostgreSQL, we can directly subtract timestamps to get an 'interval'

SELECT
    AVG(delivery_time) AS average_delivery_days
FROM (
    -- Subquery to calculate the delivery time for each order first
    SELECT
        order_id,
        (EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp)) / 86400) AS delivery_time
        -- 86400 seconds in a day
    FROM
        orders
    WHERE
        order_status = 'delivered'
        AND order_delivered_customer_date IS NOT NULL
        AND order_purchase_timestamp IS NOT NULL
) AS DeliveryTimes;

