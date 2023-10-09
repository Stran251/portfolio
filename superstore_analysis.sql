select
	*
from
	Superstore


--Sales and profits over the years
select
	  year(order_date) as order_year
	, round(sum(sales), 2) AS total_sales
	, round(sum(profit), 2) AS total_profits
from
	superstore
group by
	year(order_date)
order by 
	order_year


--Which region generates the highest sales and profits
select 
	  region
	, round(sum(sales), 2) AS total_sales
	, round(sum(profit), 2) AS total_profits
from
	  superstore
group by 
	  region
order by 
	  total_profits DESC


-- Sales, profit, and profit margin by state
select
	   state
	, round(sum(sales), 2) as total_sales
	, round(sum(profit), 2) as total_profit
	, round((sum(profit) / SUM(sales)) * 100, 2) as profit_margin
from
	superstore
group by 
	state
order by 
	total_profit desc


-- Sales, profit, and profit margin by city
select
	   city
	, round(sum(sales), 2) as total_sales
    , round(sum(profit), 2) as total_profit
	, round((sum(profit) / SUM(sales)) * 100, 2) as profit_margin
from
	superstore
group by 
	city
order by 
	total_profit desc


--performance by category
select
	  category
	, round(sum(sales), 2) as total_sales
	, round(sum(profit), 2) as total_profit
	, round((sum(profit) / SUM(sales)) * 100, 2) as profit_margin
from
	superstore
group by
	category


--performance by sub category
select
	  category
	, sub_category
	, round(sum(sales), 2) as total_sales
	, round(sum(profit), 2) as total_profit
	, round((sum(profit) / SUM(sales)) * 100, 2) as profit_margin
from
	superstore
group by
	  sub_category
	, category
order by
	  profit_margin desc


--performance by product
select
	  product_name
	, round(sum(sales), 2) as total_sales
	, round(sum(profit), 2) as total_profit
	, round((sum(profit) / SUM(sales)) * 100, 2) as profit_margin
from
	superstore
group by
	product_name
order by 
	profit_margin desc


-- Item with the most profits
select
	  top 5 product_name
	, round(sum(profit), 2) as profit
from
	superstore
group by 
	product_name
order by
	profit desc



-- Item with the least profits
select
	  top 5 product_name
	, round(sum(profit), 2) as profit
from
	superstore
group by 
	product_name
order by
	profit asc
