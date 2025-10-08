-- Remove dashes (-) from a phone number

SELECT 
	'123-456-7890' AS phone,
	REPLACE('123-456-7890', '-', '') AS clean_phone