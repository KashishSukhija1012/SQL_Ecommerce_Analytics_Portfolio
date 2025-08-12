# Global E-Commerce SQL Analytics Platform


## Project Overview

This project involves a comprehensive analysis of the Brazilian E-Commerce public dataset by Olist. Acting as a Data Analyst, I used SQL to query a multi-table relational database to extract actionable business insights. The primary goal was to transform raw transactional data into strategic recommendations that can help drive customer engagement, optimize product offerings, and ultimately increase revenue.

This portfolio piece showcases a wide range of SQL skills, from basic data retrieval and joins to advanced functions like Common Table Expressions (CTEs), Views, Triggers, and Window Functions.

## Business Objectives

The key business questions this project aimed to answer were:
*   **Customer Demographics:** Where are our most valuable customers located?
*   **Product Performance:** Which product categories drive the most revenue and which are the top-performers within those categories?
*   **Sales & Order Analysis:** What are the key trends in sales over time, and what is our month-over-month growth?
*   **Customer Behavior:** How do customers prefer to pay, and what does their spending pattern look like?

## Data Source

The dataset used is the "Brazilian E-Commerce Public Dataset by Olist," which is publicly available on Kaggle. It contains over 100,000 orders from 2016 to 2018 and includes information across multiple tables covering orders, customers, payments, products, and sellers.

*   **Dataset Link:** [Olist E-commerce Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## Technical Stack

*   **Database:** PostgreSQL 
*   **Language:** SQL
*   **Visualization:** Power BI, Google Sheets
*   **Code Editor:VS Code
---

## Key Analyses & Insights

Here is a summary of the analyses performed and the strategic insights derived:

### 1. Customer Segmentation (Using CTEs)
*   **Analysis:** Segmented customers into 'High Value', 'Medium Value', and 'Low Value' tiers based on their lifetime spending.
*   **SQL Skill:** `WITH` (Common Table Expression), `SUM()`, `GROUP BY`, `JOIN`, `CASE`.
*   **Finding:** The top 10% of customers are responsible for over 45% of the total revenue.
*   **Recommendation:** Implement a VIP loyalty program for the 'High Value' segment to increase retention and lifetime value. Target the 'Low Value' segment with re-engagement campaigns.

### 2. Month-Over-Month Sales Growth (Using Window Functions)
*   **Analysis:** Calculated the monthly revenue and the percentage growth rate from one month to the next.
*   **SQL Skill:** `DATE_TRUNC`, `LAG()` Window Function, `OVER(ORDER BY)`.
*   **Finding:** The business experiences significant seasonal peaks, with growth spiking over 15% in the months leading into the November holiday season.
*   **Recommendation:** The business should increase marketing spend and inventory levels starting in September to prepare for and maximize revenue during the Q4 peak demand period.

### 3. Product Ranking Within Categories (Using Window Functions)
*   **Analysis:** Ranked products within each product category based on total sales revenue.
*   **SQL Skill:** `RANK()` Window Function, `PARTITION BY`.
*   **Finding:** In key categories like `health_beauty` and `computers_accessories`, the top 3 ranked products consistently generated over 60% of that category's total revenue.
*   **Recommendation:** These "star products" should be the focus of marketing campaigns and product bundling strategies. Their stock levels must be carefully managed to avoid stockouts.

### 4. Database Automation (Using Triggers & Views)
*   **Analysis:** Created a `daily_sales_summary` view for simplified reporting and an `audit_log` trigger to track price changes.
*   **SQL Skill:** `CREATE VIEW`, `CREATE TRIGGER`.
*   **Finding:** Business managers can now access daily performance metrics without writing complex SQL. All historical price changes are logged for auditing and analysis.
*   **Recommendation:** Extend the use of views to other departments (e.g., a `customer_service_dashboard` view) to democratize data access in a controlled and efficient manner.

---

## Repository Structure
├── 01_database_setup/ -- Scripts for table creation and schema design.
├── 02_basic_analysis/ -- Core business questions (demographics, revenue).
├── 03_advanced_analysis_ctes/ -- Complex queries using CTEs (e.g., segmentation).
├── 04_reporting_and_automation/ -- Scripts for creating views and triggers.
├── 05_window_functions/ -- Advanced analysis for trends and ranking.
└── README.md -- This project summary.

## How to Run

1.  **Database Setup:** Set up a PostgreSQL (or your chosen SQL flavor) database.
2.  **Schema Creation:** Run the script in `01_database_setup/create_tables.sql` to create all necessary tables.
3.  **Data Import:** Download the Olist dataset from the Kaggle link above and import the `.csv` files into their corresponding tables.
4.  **Run Analysis:** The analysis scripts in folders 02 through 05 can be run to replicate the findings. They are numbered in a logical order.
