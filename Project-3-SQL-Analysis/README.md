# Project 3: Relational SQL Analytics

This project introduces a SQLite database layer to the e-commerce internship dataset. The focus here is transitioning from flat-file pandas analysis to structured SQL querying.

It demonstrates the ability to standardize raw spreadsheet columns, load records into a local SQLite schema, and execute analytical aggregations directly via SQL.

## Objectives
- Structure raw flat-file data into a SQL-ready table.
- Set up and populate a local SQLite database programmatically.
- Perform grouped analysis on product performance, order status impact, and channel effectiveness using SQL.
- Produce clean, readable queries for analytical extraction.

## SQL Concepts Demonstrated
- **Schema Creation:** `CREATE TABLE`, `DROP TABLE IF EXISTS`, defining primary keys and data types.
- **Aggregation:** `SUM()`, `COUNT()`, `AVG()`.
- **Filtering & Grouping:** `WHERE`, `GROUP BY`, `HAVING`.
- **Transformation:** `ROUND()`, `strftime()` for date parsing, subqueries for percentage calculation.
- **Sorting:** `ORDER BY` for ranking performance.

## Analytical Workflow
1. **Data Prep:** Read the raw `.xlsx` file and standardize column names to SQL-friendly `snake_case`.
2. **Database Setup:** Initialized an `ecommerce.db` SQLite database using a defined schema.
3. **ETL:** Pushed the prepared pandas DataFrame into the SQLite engine.
4. **Query Execution:** Connected to the database within a Jupyter Notebook to execute analytical queries and format the output.
5. **Reporting:** Exported the executed notebook as an HTML report.

## Analytical Questions Answered
The queries in this project address realistic business questions:
- **Product Performance:** Which products drive the highest revenue versus the highest unit volume?
- **Referral Channel Contribution:** What percentage of total revenue is attributed to each referral source?
- **High-Value Customers:** Which customers have spent over $500 across delivered orders?
- **Order Value by Payment Method:** Does payment method choice correlate with higher average cart value?
- **Revenue by Order Status:** How much gross revenue is currently locked in `Cancelled` or `Processing` statuses?
- **Monthly Revenue:** What is the gross revenue trend aggregated over standard calendar months?

## Tools Used
- **SQL (SQLite)** for querying and schema generation.
- **Python (pandas, sqlite3)** for ETL pipeline and database connection.
- **Jupyter Notebook** for interactive querying and reporting.

## Project Structure
```text
Project-3-SQL-Analysis/
|-- README.md
|-- requirements.txt
|-- data/
|   |-- Dataset for Data Analytics.xlsx
|-- database/
|   |-- ecommerce.db
|-- notebook/
|   |-- sql_analysis.ipynb
|-- reports/
|   |-- project3_sql_analysis_report.html
|-- sql/
    |-- 01_schema.sql
    |-- 02_analytical_queries.sql
```

## Output Files
- Final HTML report: [`reports/project3_sql_analysis_report.html`](reports/project3_sql_analysis_report.html)
- Notebook: [`notebook/sql_analysis.ipynb`](notebook/sql_analysis.ipynb)
- SQLite database: [`database/ecommerce.db`](database/ecommerce.db)
- Schema: [`sql/01_schema.sql`](sql/01_schema.sql)
- Analytical SQL: [`sql/02_analytical_queries.sql`](sql/02_analytical_queries.sql)

## Reproducibility
From the project root, install the required packages:

```bash
pip install -r requirements.txt
```

Run the notebook from the `notebook/` directory so the relative paths resolve correctly. The notebook rebuilds `database/ecommerce.db` from `data/Dataset for Data Analytics.xlsx` and `sql/01_schema.sql`, then executes the analysis queries.

## Limitations
- **Local Engine:** SQLite is excellent for standalone portfolio projects but lacks the concurrent processing features of a true data warehouse, such as Snowflake or PostgreSQL.
- **Synthetic Characteristics:** As noted in earlier projects, the dataset distributions are highly uniform. Interpretations are kept strictly descriptive rather than prescriptive.
- **Missing Dimensionality:** The database uses a single flat `orders` table. In a production environment, this would be normalized into distinct `customers`, `products`, and `transactions` tables.

## Technical Summary
This project shows a basic workflow for moving spreadsheet data into SQLite, preserving a defined schema, and using SQL queries for repeatable business analysis.
