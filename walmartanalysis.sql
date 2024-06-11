CREATE DATABASE IF NOT EXISTS SalesDataWalmart;


CREATE TABLE IF NOT EXISTS sales(
invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL ,
city VARCHAR(30) NOT NULL, 
customer_type VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
quantity INT NOT NULL,
VAT FLOAT(6,4) NOT NULL,
total DECIMAL(12,4) NOT NULL,
date DATETIME NOT NULL,
time TIME NOT NULL,
payment_method VARCHAR(15) NOT NULL,
cogs DECIMAL (10,2) NOT NULL,
gross_margin_pct FLOAT (11,9) ,
gross_income DECIMAL (12,4) NOT NULL,
rating FLOAT(2,1) 
);


-- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------Adding a new column named time_slot------------------------------------------------
SELECT 
	time,
	(CASE
		WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
		WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
	    ELSE "Evening"
	END
    ) AS time_slot
FROM sales;

ALTER TABLE sales ADD COLUMN time_slot VARCHAR(20) ;

UPDATE sales 
SET 
    time_slot = (CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END);



-- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------Adding a new column named day------------------------------------------------------
SELECT 
    date, DAYNAME(date) as day_name
FROM
    sales;

alter table sales add column day varchar(20);
UPDATE sales 
SET 
    day = (DAYNAME(date));

-- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------Adding a new column named month------------------------------------------------------

SELECT 
    date, monthname(date) AS month
FROM
    sales;
alter table sales
add column month varchar(20);

UPDATE sales 
SET 
    month = MONTHNAME(date);

-- -----------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------How many unique cities does the data have?----------------------------------------
SELECT DISTINCT
    city
FROM
    sales;

-- -------------------------------------------In which city is each branch?-----------------------------------------------------
SELECT DISTINCT
    branch,city
FROM
    sales;

-- ---------------------------------How many unique product lines does the data have?-------------------------------------
SELECT DISTINCT
    product_line
FROM
    sales;	

-- ---------------------------------What is the most common payment method?------------------------------------------------
SELECT 
    payment_method, COUNT(payment_method) AS frequency
FROM
    sales
GROUP BY payment_method;

-- ----------------------------------------What is the most selling product line?--------------------------------------------
SELECT 
    product_line, sum(quantity) AS quantity
FROM
    sales
GROUP BY product_line;    

-- ---------------------------------------What is the total revenue by month?------------------------------------------------
SELECT 
    month, sum(total) AS revenue
FROM
    sales
GROUP BY month;

-- ----------------------------------------What month had the largest COGS?--------------------------------------------------
SELECT 
    month, SUM(cogs) AS COGS
FROM
    sales
GROUP BY month;
    
-- -------------------------What product line had the largest revenue?---------------------------

SELECT 
    product_line, SUM(total) AS revenue
FROM
    sales
GROUP BY product_line;

-- -------------------------What is the city with the largest revenue?------------------------

SELECT 
    product_line ,city, SUM(total) AS revenue
FROM
    sales
GROUP BY product_line, city;

-- -------------------------What product line had the largest VAT?------------------------------
SELECT 
    product_line, avg(VAT) AS tax
FROM
    sales
GROUP BY product_line;
-- ----------------------- Which Brnach sold mor products than average product sold?-------------
SELECT 
    branch, SUM(quantity)
FROM
    sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT 
        AVG(quantity)
    FROM
        sales);

-- ----------------------What is the most common product line by gender?-----------------------
SELECT 
    (gender), product_line, count(gender) as total
FROM
    sales
GROUP BY gender,product_line
ORDER BY total desc;

-- -------------------What is the average rating of each product line?------------------------
Select product_line , avg(rating) from sales
group by product_line;


-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

-- ----------------------------------------------------------------------------------------------------
-- NUMBER OF SALES MADE IN EACH TIME OF THE DAY PER WEEKDAY---------------------------------
SELECT sum(total) , time_slot 
 from sales
 where day="Monday"
 group by time_slot, day
 order by time_slot desc;
-- WHICH OF THE CUSTOMER TYPES BRING THE MOST REVENUE?--------------------------------------
SELECT 
    customer_type, SUM(total)
FROM
    sales
GROUP BY customer_type
ORDER BY SUM(total) DESC;

-- WHICH CITY HAS THE LARGEST TAX PERCENT?------------------------------------------------
SELECT city,round( avg(VAT),2) FROM sales
group by city;

-- WHICH CUSTOMER TYPE PAYS THE MOST IN VAT?---------------------------------------------
select customer_type, max(VAT) from sales
group by customer_type;

-- -----------------------------------------------------------------------------------------
-- HOW MANY UNIQUE CUSTOMER TYPE DOES THE DATA HAVE?
select distinct customer_type from sales;

-- HOW MANY UNIQUE PAYMENT-METHODS TYPE DOES THE DATA HAVE?
SELECT DISTINCT payment_method from sales;

-- WHAT IS THE MOST COMMON CUSTOMER TYPE?
SELECT  customer_type, count(customer_type)
from sales
group by customer_type;

-- WHICH CUSTOMER TYPE BUYS THE MOST?
select customer_type, sum(total) from sales
group by customer_type;

-- WHAT IS THE GENDER OF MOST OF THE CUSTOMERS?
select gender, count(gender)
from sales
group by gender;

-- WHAT IS THE GENDER DISTRIBUTION PER BRANCH?
select branch,gender,count(gender)
from sales
group by branch,gender
order by branch;
