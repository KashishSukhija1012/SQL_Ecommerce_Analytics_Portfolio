--What is the monthly sales trend?
--Business Insight: This is crucial for identifying seasonality in the business. Are there specific months where sales are consistently high or low? This insight helps with financial forecasting, inventory planning, and targeted marketing campaigns (e.g., a "Summer Sale" if sales are low in summer).
select 
to_char(o.order_approved_at,'YYYY-MM')  as sales_month
,sum(op.payment_value) as total_revenue,
count(distinct o.order_id) from
orders o join order_payments op on o.order_id=op.order_id
group by sales_month
order by sales_month;
