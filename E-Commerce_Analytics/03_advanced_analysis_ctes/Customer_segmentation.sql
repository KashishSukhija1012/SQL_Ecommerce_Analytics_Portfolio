--Objective: Tackle complex questions requiring multi-step logic.
--1. Segment customers based on their total spending using a CTE.
--Business Insight: Creates actionable customer segments. "High Value" customers can be targeted for loyalty programs, while "Low Value" customers might receive re-engagement promotions.
WITH CUSTOMER_SPENDING AS
(select c.customer_unique_id,sum(oi.price) as total_spent 
from customers c
join
orders o
on c.customer_id=o.customer_id
join order_items oi
on o.order_id=oi.order_id
where o.order_status='delivered'
group by c.customer_unique_id
)
select customer_unique_id,total_spent, 
case 
when total_spent>1000 then 'high_value'
when total_spent between 200 and 1000 then 'mid_value'
else 'low_value'
end 
as customer_segment
from customer_spending 
order by total_spent desc;