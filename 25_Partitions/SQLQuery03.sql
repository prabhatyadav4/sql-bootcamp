/* ==============================================================================
   Step 2: Create Filegroups
============================================================================== */

-- Create Filegroups in SalesDB.
ALTER DATABASE SalesDB ADD FILEGROUP FG_2023
ALTER DATABASE SalesDB ADD FILEGROUP FG_2024
ALTER DATABASE SalesDB ADD FILEGROUP FG_2025
ALTER DATABASE SalesDB ADD FILEGROUP FG_2026

-- Optional: Remove a Filegroup if needed.
ALTER DATABASE SalesDB REMOVE FILEGROUP FG_2023

-- Query: List All Existing Filegroups (filter by name pattern if needed).
SELECT *
FROM sys.filegroups
WHERE type = 'FG'