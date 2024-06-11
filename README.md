# EDA_Walmart_Sales_Analysis
 Sales Analysis on Walmart Data

## Walmart Sales Data Analysis with SQL

This document describes the analysis performed on a Walmart sales data schema using SQL queries.

### Data Schema

The provided SQL code establishes the following tables and columns in a database named `SalesDataWalmart`:

* **sales** table:
    * `invoice_id`: Unique identifier for each sale (VARCHAR(30), Primary Key)
    * `branch`: Branch where the sale occurred (VARCHAR(5))
    * `city`: City of the branch (VARCHAR(30))
    * `customer_type`: Customer type (VARCHAR(30))
    * `gender`: Customer gender (VARCHAR(10))
    * `product_line`: Product line (VARCHAR(100))
    * `unit_price`: Unit price of the product (DECIMAL(10,2))
    * `quantity`: Quantity of products sold (INT)
    * `VAT`: Value-added tax (FLOAT(6,4))
    * `total`: Total sale amount (DECIMAL(12,4))
    * `date`: Date of the sale (DATETIME)
    * `time`: Time of the sale (TIME)
    * `payment_method`: Payment method used (VARCHAR(15))
    * `cogs`: Cost of goods sold (DECIMAL(10,2))
    * `gross_margin_pct`: Gross margin percentage (FLOAT (11,9))
    * `gross_income`: Gross income (DECIMAL (12,4))
    * `rating`: Customer rating for the sale (FLOAT(2,1))
    * `time_slot`: Derived column representing time of day (Morning, Afternoon, Evening) (VARCHAR(20))
    * `day`: Derived column representing day of the week (Monday, Tuesday, etc.) (VARCHAR(20))
    * `month`: Derived column representing month (January, February, etc.) (VARCHAR(20))

### Analysis Queries

The provided SQL queries explore various aspects of the sales data, including:

* **Basic Descriptive Statistics:**
    * Number of unique cities.
    * Distribution of branches across cities.
    * Number of unique product lines.
    * Most common payment method.
* **Sales Performance:**
    * Most selling product line by total quantity sold.
    * Total revenue by month.
    * Month with the largest cost of goods sold (COGS).
    * Product line with the largest revenue.
    * City with the largest revenue.
    * Product line with the largest average VAT.
    * Branch exceeding average product sales quantity.
* **Customer Analysis:**
    * Most common product line by gender.
    * Average rating for each product line.
    * Customer type bringing the most revenue.
    * City with the largest average VAT percentage.
    * Customer type paying the most VAT.
    * Unique customer types.
    * Unique payment methods.
    * Most common customer type.
    * Customer type with the highest total purchases.
    * Gender distribution of customers.
    * Gender distribution per branch.

### Time-Based Analysis:**

* Daily sales breakdown by time slot (Morning, Afternoon, Evening) for Mondays (example provided). This can be extended to analyze other days and time granularities.

**Note:**

* This script creates derived columns (`time_slot`, `day`, and `month`) for ease of analysis. These columns can be dropped if permanent modifications are not desired.

This analysis provides a solid foundation for understanding sales trends, customer behavior, and product performance within the Walmart data. Further analysis can be conducted to explore specific areas of interest.

