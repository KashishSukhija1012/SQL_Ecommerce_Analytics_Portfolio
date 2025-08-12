--Who are our best-performing sellers?
--The Business Question: The company wants to identify its most valuable sellers to create a partnership program.

--Your Task: Write a query that first identifies the top 10 sellers based on their total sales revenue. 
--Then, for only these top sellers, find the main product category they generate revenue from.
--Why it's valuable (Business Insight): This allows the business to create strategic partnerships with its most successful sellers.
--It also helps understand which product categories are most profitable for third-party sellers on the platform, which can inform seller recruitment efforts

--Who are our top 10 sellers by revenue, and what product categories do they specialize in?
With TopSellers as
(
Select s.seller_id,
sum(oi.price) as TotalRevenue
from
sellers s join order_items oi
on

s.seller_id=oi.seller_id
group by s.seller_id
order by totalrevenue desc
limit 10
)
,SellerCategoryRevenue as(
select 
oi.seller_id,
pct.product_category_name_english ,
sum(oi.price) as categoryrevenue,
row_number() over(partition by oi.seller_id 
order by SUM(oi.price) desc) as rn
from order_items oi join products p 
on oi.product_id=p.product_id
join
product_category_name_translation pct on
p.product_category_name=pct.product_category_name 
group by oi.seller_id,pCT.product_category_name_english
)
select
ts.seller_id,
ts.totalrevenue,
scr.product_category_name_english as top_category
from topsellers ts join sellercategoryrevenue scr
on ts.seller_id=scr.seller_id
where scr.rn=1
order by ts.totalrevenue desc

;
