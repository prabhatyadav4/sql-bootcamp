-- Replace File Extence from txt to csv.

SELECT 
	'report.txt' AS old_filename,
	REPLACE('report.txt', '.txt', '.csv') AS new_filename