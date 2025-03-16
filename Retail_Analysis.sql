create database retail_analysis;

drop table if exists retail_analysis;

create table retail_analysis (
ID int,
sale_date date,
sale_time time,
	customer_id	int,
    gender	varchar(10),
    age	int,
    category varchar(25),
    quantity int, 
    price_per_unit float,
    cogs float,
    total_sale float
);

select count(*) from retail_analysis;

select count(distinct(customer_id)) from retail_analysis;

select distinct category from retail_analysis;


SELECT 
    *
FROM
    retail_analysis
WHERE
    sale_date IS NULL OR sale_time IS NULL
        OR customer_id IS NULL
        OR gender IS NULL
        OR age IS NULL
        OR category IS NULL
        OR quantity IS NULL
        OR price_per_unit IS NULL
        OR cogs IS NULL;
        
        
Delete
FROM
    retail_analysis
WHERE
    sale_date IS NULL OR sale_time IS NULL
        OR customer_id IS NULL
        OR gender IS NULL
        OR age IS NULL
        OR category IS NULL
        OR quantity IS NULL
        OR price_per_unit IS NULL
        OR cogs IS NULL;


-- Write a SQL query to retrieve all columns for sales made on '2022-11-05:

SELECT 
    *
FROM
    retail_analysis
WHERE
    sale_date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT 
    *
FROM
    retail_analysis
WHERE
    category = 'Clothing'
        AND MONTH(sale_date) = 11
        AND quantity >= 4;

-- Write a SQL query to calculate the total sales (total_sale) for each category.:
 
 SELECT 
    category AS Category,
    SUM(total_sale) AS Total_Sales,
    COUNT(*) AS Number_Of_Sales
FROM
    retail_analysis
GROUP BY 1;
 
--  Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

select round(avg(age),2) as Avg_Age from retail_analysis
where category="Beauty";

-- Write a SQL query to find all transactions where the total_sale is greater than 1000.:

SELECT 
    *
FROM
    retail_analysis
WHERE
    total_sale > 1000;


-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

SELECT 
    gender AS Gender,
    category AS Category,
    COUNT(*) AS Total_Transaction
FROM
    retail_analysis
GROUP BY 1 , 2;

-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
with cte as (
	select round(avg(total_sale),2) as Avg_Monthly_sales,
	month(sale_date) as Month,
	year(sale_date) as Year,
	rank() over(partition by month(sale_date) order by avg(total_sale) desc) as ranking_month,
	rank() over(partition by year(sale_date) order by avg(total_sale) desc) as ranking_year
from retail_analysis
group by 2,3
)
select 
	Year,
    Month,
    Avg_Monthly_sales
from cte
where ranking_month = 1 and ranking_year = 1;


-- Write a SQL query to find the top 5 customers based on the highest total sales :

SELECT 
    customer_id as Customer_ID, 
    SUM(total_sale) AS Total_Sales
FROM
    retail_analysis
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Write a SQL query to find the number of unique customers who purchased items from each category.:

SELECT 
    category AS Category,
    COUNT(DISTINCT (customer_id)) AS Distinct_Customers
FROM
    retail_analysis
GROUP BY 1;

-- Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

SELECT 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shifts,
    COUNT(*) as Number_Of_Orders
FROM
    retail_analysis
GROUP BY 1
;


