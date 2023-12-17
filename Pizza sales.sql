use pizza_db ;

select * from pizza_sales ;

-- Total Revenue

select sum(total_price) as Total_Revenue 
from pizza_sales ;


-- Average order value 

select round(sum(total_price) / count(distinct order_id),2) as Average_Order_Value
from pizza_sales ;


-- Total Pizzas Sold

select sum(quantity) as Total_Pizzas_Sold
from pizza_sales ;


-- Total Orders 

select count(distinct order_id) as Total_Orders
from pizza_sales ;


-- Average pizzas per order 

 select cast(cast(sum(quantity)as decimal (10,2)) / cast(count(distinct order_id) as decimal (10,2)) as decimal(10,2)) as Avg_Pizza_per_order
 from pizza_sales ;


 -- daily Trend for Total orders

 select datename(DW,order_date) as order_day , count(distinct order_id) as Week_trend
 from pizza_sales
 group by datename(DW,order_date) 
 order by Week_trend desc ;


 -- monthly trend for total orders 

 select datename(month,order_date) as month_name , count(distinct order_id) as Monthly_trend 
 from pizza_sales
 group by datename(month,order_date) 
 order by  Monthly_trend  desc ;

 -- percentage of sales by pizza category 

 select pizza_category , round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as Total_sales_in_perc
 from pizza_sales 
 group by pizza_category ;

 -- percentage of sales by pizza size

 select pizza_size , round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as Total_sales_in_perc
 from pizza_sales 
 group by pizza_size ;



-- Top 5 best sellers by Total_Revenue

select  Top 5 pizza_name , sum(total_price) as Total_Revenue 
from pizza_sales 
group by pizza_name 
order by Total_Revenue desc ;


-- Bottom 5 sellers by Total_Revenue

select  Top 5 pizza_name , sum(total_price) as Total_Revenue 
from pizza_sales 
group by pizza_name 
order by Total_Revenue asc ;

-- Top 5 sellers by Quantity 

select  Top 5 pizza_name , sum(quantity) as Total_quantity 
from pizza_sales 
group by pizza_name 
order by Total_quantity desc ;


--  Bottom 5 sellers by Quantity 

select  Top 5 pizza_name , sum(quantity) as Total_quantity 
from pizza_sales 
group by pizza_name 
order by Total_quantity asc ;

-- Top 5 sellers by orders 

select  Top 5 pizza_name , count(distinct order_id) as Total_orders 
from pizza_sales 
group by pizza_name 
order by Total_orders desc ;


-- Bottom 5 sellers by orders 

select  Top 5 pizza_name , count(distinct order_id) as Total_orders 
from pizza_sales 
group by pizza_name 
order by Total_orders asc ;

 


