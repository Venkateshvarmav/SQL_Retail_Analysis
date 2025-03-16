# SQL_Retail_Analysis

## Project Overview

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
