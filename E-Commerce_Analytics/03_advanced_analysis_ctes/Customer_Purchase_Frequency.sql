
--Question 4: What is our customer purchase frequency?
--The Business Question: Are we good at retaining customers? 
--We need to know if our customers are one-time buyers or if they come back for more purchases.
--Your Task: Write a query to count how many customers have made exactly 1 purchase, 2 purchases, 3 purchases, and so on.
--This gives a distribution of customer loyalty.
--Why it's valuable (Business Insight): This is a crucial metric for understanding customer loyalty. 

If a vast majority of customers are in the "1 purchase" bucket, it indicates a retention problem. This insight would trigger the marketing team to launch re-engagement campaigns or a loyalty program to encourage repeat business.
WITH CustomerOrderCounts AS (
    -- First, count the number of orders for each unique customer
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS number_of_orders
    FROM
        customers c
    JOIN
        orders o ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_unique_id
)
-- Now, group by the number of orders to see the distribution
SELECT
    number_of_orders,
    COUNT(customer_unique_id) AS number_of_customers
FROM
    CustomerOrderCounts
GROUP BY
    number_of_orders
ORDER BY
    number_of_orders;