--
--Which sellers generate the most revenue?
--sBusiness Insight: Identifying top-performing sellers is key to partner relationship management. The business can create incentive programs for these sellers, feature them more prominently, or learn from their success to help other sellers improve.
select
s.seller_id,
s.seller_city,
s.seller_state,
sum(oi.price) as total_revenue

from sellers s join order_items oi on
s.seller_id=oi.seller_id
group by s.seller_id,
s.seller_city,
s.seller_state 
order by total_revenue desc
limit 10;