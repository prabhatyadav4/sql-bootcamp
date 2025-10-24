/*
==============================================================================
   12. Create SQL Course
============================================================================== 

Create a comprehensive SQL course with a detailed roadmap and agenda.
Do the following:
	- Start with SQL fundamentals and advance to complex topics.
	- Make it beginner-friendly.
	- Include topics relevant to data analytics.	
	- Focus on real-world data analytics use cases and scenarios. */

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
SQL for Data Analytics: Comprehensive Course Roadmap & Agenda
------------------------------------------------------------------------------
Goal: Beginner-friendly course advancing to complex data analytics topics and real-world scenarios.
==============================================================================

PHASE 1: SQL FUNDAMENTALS (The Basics)

  - M1: Introduction to Databases
    - Concepts: What is SQL? Relational Model, Tables, Primary/Foreign Keys, Data Types (INT, VARCHAR, DATE).
    - Use Case: Understanding the structure of customer and transaction logs.

  - M2: The SELECT Statement
    - Concepts: Basic SELECT and FROM, Aliasing (AS), Arithmetic operations.
    - Use Case: Retrieving lists of top-selling products and calculating simple profit margins.

  - M3: Filtering Data with WHERE
    - Concepts: Comparison Operators, Logical Operators (AND, OR, NOT), BETWEEN, IN, LIKE (wildcards).
    - Use Case: Identifying orders placed within a specific quarter or orders flagged as 'Cancelled'.

  - M4: Ordering and Uniques
    - Concepts: ORDER BY (ASC/DESC), Sorting by multiple columns, DISTINCT keyword.
    - Use Case: Finding the top 10 newest customers or generating a unique list of countries.

------------------------------------------------------------------------------
PHASE 2: AGGREGATION AND DATA GROUPING

  - M5: Basic Aggregate Functions
    - Concepts: COUNT(), SUM(), AVG(), MIN(), MAX(), Handling NULLs in aggregates.
    - Use Case: Calculating total revenue, average order value (AOV), and min/max prices.

  - M6: Grouping Data (GROUP BY)
    - Concepts: The GROUP BY clause, Grouping by multiple fields.
    - Use Case: Calculating total sales per country or average salary per department.

  - M7: Filtering Groups (HAVING)
    - Concepts: Difference between WHERE and HAVING, Using aggregate functions in HAVING.
    - Use Case: Finding departments that have generated less than 100 orders total.

------------------------------------------------------------------------------
PHASE 3: JOINING AND RELATIONAL DATA

  - M8: Data Modification (DML)
    - Concepts: INSERT, UPDATE, DELETE, TRUNCATE (Basic understanding).
    - Use Case: Correcting a product's price or adding a new employee record.

  - M9: Inner and Outer Joins
    - Concepts: INNER JOIN, LEFT JOIN, RIGHT JOIN, Joining on Primary/Foreign Keys.
    - Use Case: Combining Customer names with their Order details; identifying customers who have *not* placed an order.

  - M10: Advanced Joins and Sets
    - Concepts: FULL OUTER JOIN, Self-Joins (Manager/Employee hierarchy), UNION vs. UNION ALL.
    - Use Case: Analyzing complex hierarchical structures and merging datasets from different regions.

------------------------------------------------------------------------------
PHASE 4: ADVANCED ANALYTICS (Data Science Focus)

  - M11: Subqueries and CTEs
    - Concepts: Subqueries in WHERE and SELECT (Scalar), Performance of subqueries, Common Table Expressions (WITH clause).
    - Use Case: Finding all orders placed by customers whose total sales are above the average. Breaking down multi-step calculations into readable CTEs.

  - M12: Views and Temporary Objects
    - Concepts: Creating standard views, Benefits (security, complexity hiding), Temporary tables (#TempTable).
    - Use Case: Storing a complex, aggregated customer profile for repeated use by reporting tools.

  - M13: Window Functions I: Ranking
    - Concepts: OVER(), PARTITION BY, ORDER BY, RANK(), DENSE_RANK(), ROW_NUMBER().
    - Use Case: Ranking products by sales within each product category (e.g., finding the \#1 seller in each market segment).

  - M14: Window Functions II: Lag, Lead, and Aggregation
    - Concepts: LAG(), LEAD(), SUM() OVER (Rolling Aggregation).
    - Use Case: Calculating month-over-month sales difference (LAG) or calculating a 7-day rolling average of website signups.

------------------------------------------------------------------------------
PHASE 5: OPTIMIZATION AND CASE STUDIES

  - M15: Data Integrity and Constraints
    - Concepts: NOT NULL, UNIQUE, CHECK constraints, Database Normalization (1NF, 2NF, 3NF).
    - Use Case: Ensuring the 'Price' column is always positive and data relationships are enforced.

  - M16: SQL Performance
    - Concepts: Execution Plans, Indexing strategies, SARGability, Avoiding functions in WHERE clauses.
    - Use Case: Identifying a slow report query using EXPLAIN PLAN and applying the correct index to speed it up.

  - M17: Final Case Study: RFM Analysis
    - Goal: Apply all course concepts (CTEs, Joins, Date Functions, Window Functions) to build a comprehensive Customer Segmentation model based on Recency, Frequency, and Monetary Value.

*/