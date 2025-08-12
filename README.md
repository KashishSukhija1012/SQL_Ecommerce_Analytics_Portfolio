# SQL_Ecommerce_Analytics_Portfolio
## Project Overview This project is a comprehensive analysis of a global e-commerce dataset. The goal was to leverage SQL, from basic queries to advanced functions, to extract actionable business intelligence, identify key performance indicators (KPIs), and provide strategic recommendations to drive growth.
# SQL E-Commerce Analytics Platform

## Project Overview
This project is a comprehensive analysis of a global e-commerce dataset. The goal was to leverage SQL, from basic queries to advanced functions, to extract actionable business intelligence, identify key performance indicators (KPIs), and provide strategic recommendations to drive growth.

## Business Objectives
- Identify key geographic markets and customer demographics.
- Determine top-performing product categories and revenue drivers.
- Segment customers to enable targeted marketing campaigns.
- Analyze sales trends and calculate month-over-month growth.
- Automate data integrity checks using triggers.

## Technical Stack
- **Database:** PostgreSQL (or MySQL, SQL Server)
- **Language:** SQL

## Key Analyses & Insights

### 1. Customer Segmentation (Using CTEs)
- **Finding:** Customers were segmented into 'High', 'Medium', and 'Low' value tiers. We found that the top 12% of customers generate over 50% of total revenue.
- **Recommendation:** Implement a VIP loyalty program for the 'High Value' segment.

### 2. Monthly Sales Growth (Using Window Functions)
- **Finding:** Calculated the month-over-month revenue growth, identifying a peak growth of 15% during the November holiday season.
- **Recommendation:** Allocate increased marketing budget and inventory for Q4 to capitalize on seasonal demand.

### 3. Product Ranking Within Categories (Using Window Functions)
- **Finding:** Ranked products by sales within each category. In 'Computers & Accessories', 3 out of 50 products accounted for 70% of sales.
- **Recommendation:** Ensure these "star products" are never out of stock and consider them for product bundling strategies.

## How to Run
1. Set up a PostgreSQL database.
2. Run the script in `01_database_setup/create_tables.sql` to create the schema.
3. Import the Olist e-commerce dataset from Kaggle.
4. The analysis scripts in folders 02 through 05 can then be run to replicate the findings.
