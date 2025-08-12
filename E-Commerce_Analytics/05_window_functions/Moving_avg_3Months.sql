--What is our 3-month moving average for sales revenue?
--The Business Question: Monthly sales figures can be volatile due to holidays or short-term promotions.
-- We need to see the underlying sales trend without the noise.
--Your Task: Calculate the 3-month moving average of total sales revenue.
-- This will smooth out the data and show the true business trajectory.
--Why it's valuable (Business Insight): A moving average is a core business metric used in financial reporting and trend analysis. It helps executives understand if the business is on a stable upward or downward trend, ignoring short-term fluctuations. This is far more reliable for strategic planning than looking at individual monthly results.


WITH MonthlySales AS (
    -- First, calculate total sales for each month
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp)::DATE AS sales_month,
        SUM(op.payment_value) as monthly_revenue
    FROM
        orders o
    JOIN
        order_payments op ON o.order_id = op.order_id
    WHERE
        o.order_status = 'delivered'
    GROUP BY
        sales_month
    ORDER BY
        sales_month
)
-- Now, calculate the 3-month moving average using a window function
SELECT
    sales_month,
    monthly_revenue,
    AVG(monthly_revenue) OVER (
        ORDER BY sales_month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS three_month_moving_avg
FROM
    MonthlySales;