/* ==============================================================================
   Monitor Index Usage
============================================================================== */

-- List all indexes on a specific table.
sp_helpindex 'Sales.DBCustomers'

-- Monitor Index Usage based on these tables.
SELECT * FROM sys.indexes
SELECT * FROM sys.tables
SELECT * FROM sys.dm_db_index_usage_stats

-- Monitor Index Usage
SELECT
    tbl.name AS TableName,
    idx.name AS IndexName,
    idx.type_desc AS IndexType,
    idx.is_primary_key AS IsPrimaryKey,
    idx.is_unique AS IsUnique,
    idx.is_disabled AS IsDisabled,
    s.user_seeks AS UserSeeks,
    s.user_scans AS UserScans,
    s.user_lookups AS UserLookups,
    s.user_updates AS UserUpdates,
    COALESCE(s.last_user_seek, s.last_user_scan) AS LastUpdate
FROM sys.indexes AS idx
JOIN sys.tables AS tbl
ON tbl.object_id = idx.object_id
LEFT JOIN sys.dm_db_index_usage_stats s
ON s.object_id = idx.object_id
AND s.index_id = idx.index_id
ORDER BY tbl.name, idx.name