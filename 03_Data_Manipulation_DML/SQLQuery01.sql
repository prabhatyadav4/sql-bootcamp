/* #1 Method: Manual INSERT using VALUES */

-- Insert new records into the customers table

INSERT INTO customers (id, first_name, country, score)
VALUES 
    (6, 'Anna', 'USA', NULL),
    (7, 'Sam', NULL, 100),
    (8, 'USA', 'Max', NULL),
    (9, 'Andreas', 'Germany', NULL),
    (10, 'Sahra', 'USA', NULL)

SELECT * FROM customers