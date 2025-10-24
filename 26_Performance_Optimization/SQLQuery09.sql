-- ##############################################################
-- #                        INDEXING                            #
-- ##############################################################
/*
=================================================================================================================================
Tip 26: Avoid Over Indexing, as it can slow down insert, update, and delete operations
=================================================================================================================================
Tip 27: Regularly review and drop unused indexes to save space and improve write performance
=================================================================================================================================
Tip 28: Update table statistics weekly to ensure the query optimizer has the most up-to-date information
=================================================================================================================================
Tip 29: Reorganize and rebuild fragmented indexes weekly to maintain query performance.
=================================================================================================================================
Tip 30: For large tables (e.g., fact tables), partition the data and then apply a columnstore index for best performance results
=================================================================================================================================
*/