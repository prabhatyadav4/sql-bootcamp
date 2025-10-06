/* #2 Method: INSERT DATA USING SELECT - Moving Data From One Table to Another */

-- Insert data from 'customers' into 'persons'.

INSERT INTO persons (id, person_name, birth_date, phone, email)

SELECT 
	id,
	first_name,
	NULL,
	'Unknown',
	'Unknown'
FROM customers

SELECT * FROM persons