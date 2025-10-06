-- Add a new column called email to the persons table.

ALTER TABLE persons
ADD email varchar(50) NOT NULL

SELECT * FROM persons