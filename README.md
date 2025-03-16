# SQL_Retail_Analysis

## Project Overview

**Project Title**: Retail Analysis

This project is designed to demonstrate SQL skills and techniques typically to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Objectives

1.**Set up a retail sales database**: Create and populate a retail Analysis database with the provided dataset.
2.**Data Cleaning**: Identify and remove any records with missing or null values.
3.**Exploratory Data Analysis (EDA)**: Perform exploratory data analysis to understand the dataset.
4.**Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database setup 
* **Database Creation**: The project starts by creating a database namesd retail_analysis
* **Table Creation**: A table named retail_anlaysis is created to store the sales dataset. The table structure includes columns for transaction ID(ID), sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
create database retail_analysis;
```
```sql
drop table if exists retail_analysis;
```
```sql
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
```

### 2. Data Exploration & Cleaning

* **Record Count**: Determine the total number of records in the dataset.	
* **Customer Count**: Find out how many unique customers are in the dataset.
* **Category Count**: Identify all unique product categories in the dataset.
* **Null Value Check**: Check for any null values in the dataset and delete records with missing data.


```sql
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
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **retrieve all columns for sales made on '2022-11-05**

```sql
SELECT 
    *
FROM
    retail_analysis
WHERE
    sale_date = '2022-11-05';
```

2. **retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**

```sql
SELECT 
    *
FROM
    retail_analysis
WHERE
    category = 'Clothing'
        AND MONTH(sale_date) = 11
        AND quantity >= 4;
```

3. **calculate the total sales (total_sale) for each category.**

 ```sql
 SELECT 
    category AS Category,
    SUM(total_sale) AS Total_Sales,
    COUNT(*) AS Number_Of_Sales
FROM
    retail_analysis
GROUP BY 1;
 ```

4. **find the average age of customers who purchased items from the 'Beauty' category.**

```sql
select round(avg(age),2) as Avg_Age from retail_analysis
where category="Beauty";
```

5. **find all transactions where the total_sale is greater than 1000.**

```sql
SELECT 
    *
FROM
    retail_analysis
WHERE
    total_sale > 1000;
```

6. **Find the total number of transactions (id) made by each gender in each category.**

```sql
SELECT 
    gender AS Gender,
    category AS Category,
    COUNT(*) AS Total_Transaction
FROM
    retail_analysis
GROUP BY 1 , 2;
```

7. **Calculate the average sale for each month. Find out best selling month in each year**

```sql   
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
```

 8. **Find the top 5 customers based on the highest total sales**

```sql
SELECT 
    customer_id as Customer_ID, 
    SUM(total_sale) AS Total_Sales
FROM
    retail_analysis
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

9. **Find the number of unique customers who purchased items from each category.**
```sql
SELECT 
    category AS Category,
    COUNT(DISTINCT (customer_id)) AS Distinct_Customers
FROM
    retail_analysis
GROUP BY 1;
```

10. **Create each shift and find number of orders**

```sql
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
```

## Findings

* **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing, Electronics and Beauty.
* **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
* **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
* **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

* **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
* **Trend Analysis**: Insights into sales trends across different months and shifts.
* **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

## Author - Venkatesh Varma V

This project is part of my portfolio, showcasing my SQL skills essential for data analyst roles.

