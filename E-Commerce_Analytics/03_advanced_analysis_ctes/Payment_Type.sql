-- What is the average number of payment installments for each payment method?
--Business Insight: Understanding how customers prefer to pay can inform partnerships with payment providers and checkout design.
SELECT
    payment_type,
    AVG(payment_installments) AS avg_installments,
    COUNT(*) as total_transactions
FROM
    order_payments
WHERE
    payment_type <> 'not_defined'
GROUP BY
    payment_type
ORDER BY
    total_transactions DESC;