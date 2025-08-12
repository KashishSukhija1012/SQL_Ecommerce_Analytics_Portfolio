--Objective: Perform sophisticated row-by-row analysis to uncover deeper trends.
--1. Calculate Month-over-Month Sales Growth.

WITH MonthlySales AS (
    -- Calculate total sales for each month
    SELECT
        DATE_TRUNC('month', order_purchase_timestamp)::DATE AS sales_month,
        SUM(payment_value) as monthly_revenue
    FROM
        orders o
    JOIN
        order_payments op ON o.order_id = op.order_id
    WHERE
        o.order_status = 'delivered'
    GROUP BY
        sales_month
),
LaggedSales AS (
    -- Use the LAG window function to get the previous month's sales on the same row
    SELECT
        sales_month,
        monthly_revenue,
        LAG(monthly_revenue, 1) OVER (ORDER BY sales_month) AS previous_month_revenue
    FROM
        MonthlySales
)
-- Calculate the growth percentage
SELECT
    sales_month,
    monthly_revenue,
    previous_month_revenue,
    (monthly_revenue - previous_month_revenue) / previous_month_revenue * 100 AS growth_percentage
FROM
    LaggedSales
WHERE
    previous_month_revenue IS NOT NULL
ORDER BY
    sales_month;