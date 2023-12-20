-- Queries / Procedures

-- MAKE SURE TO INCLUDE THE QUESTION AS A COMMENT 
-- IN YOUR SQL FILE

-- In some cases you might need to query on a view.
-- Include that intermediate query.

-- Start all views with the prefix vw
-- Start all stored procedures with sp

-- Be aware that you might have to use
-- different types of joins in some cases.

-- Q1
-- List customerName, payments.amount, and productLine
-- for those customers who payed more than 50000

SELECT customerName, amount, productLine
FROM customers
LEFT JOIN payments 
ON customers.customerNumber = payments.customerNumber
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber
LEFT JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
LEFT JOIN products
ON orderdetails.productCode = products.productCode
WHERE amount > 50000;

-- Q2
-- List the the customerName, quantityOrdered for all
-- customers who ordered quantities 10 or more 
-- above the average. Try to write this as a sub query

SELECT customerName, quantityOrdered
FROM customers
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber
LEFT JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
WHERE quantityOrdered > (SELECT AVG(quantityOrdered)
							FROM orderdetails ) + 10
ORDER BY customerName, quantityOrdered;

-- Q3
-- create a stored procedure that returns the
-- customerName, orderNumber, and productLine.
-- Write the store procedure so that it can take an input
-- for the productLine.  (Meaning when you call the 
-- stored procedure, you have to give it a productLine)

DELIMITER //

CREATE OR REPLACE PROCEDURE spCusOrdLine(IN productLinein VARCHAR(255))

	BEGIN
	
		SELECT customerName, orders.orderNumber, productLine
		FROM customers
		LEFT JOIN orders
		ON customers.customerNumber = orders.customerNumber
		LEFT JOIN orderdetails
		ON orders.orderNumber = orderdetails.orderNumber
		LEFT JOIN products
		ON orderdetails.productCode = products.productCode
		WHERE productLine LIKE productLinein;
		
	END //

DELIMITER ;

CALL spCusOrdLine('Ships');

-- Q4
-- Write a stored procedure that shows ALL of the
-- customers [customerName, contactLastName, contactFirstName]
-- and any orderNumbers (No nulls in customers)

DELIMITER // 

CREATE OR REPLACE PROCEDURE spAllInfoCus()

	BEGIN
	
		SELECT customerName, contactLastName, contactFirstName, orderNumber
		FROM customers
		LEFT JOIN orders
		ON customers.customerNumber = orders.customerNumber;
		
	END // 
	
DELIMITER ;

CALL spAllInfoCus();

-- Q5
-- Write a view that shows the productName,productLine,
-- quantityInStock,buyPrice, and textDescription.
-- Order it by productLine and productName

CREATE OR REPLACE VIEW vwProductInfo AS
SELECT productName, products.productLine, quantityInStock, buyPrice, textDescription
FROM products
LEFT JOIN productLines
ON products.productLine = productLines.productLine
ORDER BY productName, productLine;

SELECT * FROM vwProductInfo; 

-- Q6
-- Write a stored procedure that queries the view in previous
-- question, but only shows the products that are below
-- the average buy price. Try to write this with an embedded query

DELIMITER //

CREATE OR REPLACE PROCEDURE spWithView()

	BEGIN
		
		SELECT *
		FROM vwProductInfo
		WHERE buyPrice < (SELECT AVG(buyPrice)
							FROM vwProductInfo)
		ORDER BY buyPrice;
							
	END //
	
DELIMITER ;

CALL spWithView();

-- Q7
-- Write a view that shows the employees lastName, firstName,
-- and country.  Order it by country, lastname, firstname.

CREATE OR REPLACE VIEW vwNamesTry AS
SELECT lastName, firstName ,country
FROM employees
LEFT JOIN offices
ON employees.officeCode = offices.officeCode
ORDER BY country, lastName, firstName;

SELECT * FROM vwNamesTry;

-- Q8
-- Write a stored procedure that allows input of a specific country 
-- thta shows the employees lastName, firstName,
-- and country.  Order it by country, lastname, firstname.
-- Test with a country of your choice.

DELIMITER // 

CREATE OR REPLACE PROCEDURE spPickCountry(IN Pick VARCHAR(255))

	BEGIN
		
		SELECT lastname, firstName, country
		FROM employees
		LEFT JOIN offices
		ON employees.officeCode = offices.officeCode
		WHERE country LIKE Pick
		ORDER BY country, lastName, firstName;
		
	END //
	
DELIMITER ; 

CALL spPickCountry('USA');


-- Q9
-- Write a view that shows the country and lists the
-- number of people in that country.

CREATE OR REPLACE VIEW vwListPeople AS
SELECT country, COUNT(customerName)
FROM customers
GROUP BY country
ORDER BY COUNT(customerName);

SELECT * FROM vwListPeople;


-- Q10
-- Write a stored procedure that counts all the orders 
-- for each customerName, the average spent and the max amount.
-- Use the price each.

DELIMITER // 

CREATE OR REPLACE PROCEDURE spAvgCUSTOMERcost()

	BEGIN 
	
		SELECT customerName, COUNT(orders.orderNumber), AVG(priceEach), MAX(priceEach)
		FROM customers
		LEFT JOIN orders
		ON customers.customerNumber = orders.customerNumber
		LEFT JOIN orderdetails
		ON orders.orderNumber = orderdetails.orderNumber
		GROUP BY customerName
		ORDER BY MAX(priceEach);
		
	
	END //

DELIMITER ;

CALL spAvgCUSTOMERcost();

-- Q11
-- Write a view that shows all the employee lastnames, country, state
-- and the total/sum of the orderedOrdered for each productline.
-- For example I want to see that Smith from Germany (may or maynot have)
-- a state, had a total of 800 classic cars. (NOTE the real data will
-- be different) (NOTE: not all employees may have a country or 
-- state designated - but all the employees have to be listed)

CREATE OR REPLACE VIEW vwEmployeeCost AS
SELECT lastName, offices.country, offices.state, productLine, SUM(quantityOrdered)
FROM employees
LEFT JOIN offices
ON employees.officeCode = offices.officeCode
LEFT JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber
LEFT JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
LEFT JOIN products
ON orderdetails.productCode = products.productCode
GROUP BY lastName, productLine;

SELECT * FROM vwEmployeeCost;

-- Q12
-- Write a view that lists ALL of the productName, ProductDescription, 
-- quantityStock,buyPrice and any textDescriptions that go with them.
-- (NOTE: Note all products may have a description, but all products
-- mus be shown)

CREATE OR REPLACE VIEW vwProductANDlINES AS
SELECT productName, productDescription, quantityInStock, buyPrice, textDescription
FROM products
LEFT JOIN productLines
ON products.productLine = productLines.productLine;

SELECT * FROM vwProductANDlINES;