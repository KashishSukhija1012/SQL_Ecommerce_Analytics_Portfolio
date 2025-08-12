--Objective: Answer fundamental business questions with core SQL commands.
--1. How many customers are in each state?
SELECT
    customer_state,
    COUNT(customer_id) AS number_of_customers
FROM
    customers
GROUP BY
    customer_state
ORDER BY
    number_of_customers DESC;