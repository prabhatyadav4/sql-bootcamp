/*
==============================================================================
   15. SQL Questions with Options
==============================================================================

Act as an SQL trainer and help me practice SQL Window Functions.
Do the following:
	- Make it interactive Practicing, you provide task and give solution.
	- Provide a sample dataset.
	- Give SQL tasks that gradually increase in difficulty.	
	- Act as an SQL Server and show the results of my queries.
	- Review my queries, provide feedback, and suggest improvements. */

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
SQL Trainer: Interactive Window Function Practice
==============================================================================
*/

-- Welcome to your SQL Server Window Function training!
-- We will start with a simple task and gradually increase the difficulty.

------------------------------------------------------------------------------
-- Sample Dataset: Sales Performance (Used for all tasks)
------------------------------------------------------------------------------
-- | OrderID | Region | SalesPerson | SalesAmount | OrderDate  |
-- | :---:   | :---:  | :---:		| :---:		  | :---:	   |
-- | 101	 | East   | Smith		| 500		  | 2025-01-05 |
-- | 102	 | West   | Jones		| 800		  | 2025-01-05 |
-- | 103	 | East   | Smith		| 700		  | 2025-01-10 |
-- | 104	 | West   | Jones		| 300		  | 2025-01-12 |
-- | 105	 | Central| Baker		| 400		  | 2025-01-15 |
-- | 106	 | East   | Chen		| 900		  | 2025-01-18 |
-- | 107	 | West   | Jones		| 600		  | 2025-01-20 |
-- | 108	 | Central| Baker		| 500		  | 2025-01-25 |
------------------------------------------------------------------------------

-- Task 1: Basic Ranking (ROW_NUMBER())
-- Goal: List all orders, and next to each order, display its overall rank based on SalesAmount (highest sales gets rank 1). 
-- Requirement: The rank must be unique for every order (use ROW_NUMBER()).

-- Your Query:
-- [Insert your SQL query below]