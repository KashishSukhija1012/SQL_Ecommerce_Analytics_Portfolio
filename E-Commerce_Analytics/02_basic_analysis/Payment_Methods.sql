--What are the most common payment methods?
--Business Insight: Understanding how customers pay is vital. If "credit_card" is overwhelmingly popular, the company should ensure a seamless credit card experience. If an emerging method like "boleto" (a Brazilian payment slip) is significant, it's important to support it properly. This data can also influence negotiations with payment processing companies.
SELECT
    payment_type,
    COUNT(op.order_id) AS number_of_transactions,
    SUM(op.payment_value) AS total_value_transacted
FROM
    order_payments op
GROUP BY
    payment_type
HAVING
    payment_type IS NOT NULL AND payment_type <> 'not_defined'
ORDER BY
    number_of_transactions DESC;