-- Include your name:Andrew Taber
-- Include the question as a comment
-- Use the mysampledatabase

-- Q1. List the total sales by country

	SELECT country, SUM(amount) AS "TOTAL_SALES" FROM customers LEFT JOIN payments ON customers.customerNumber = payments.customerNumber GROUP BY country ORDER BY SUM(amount);

-- Q2. List the total sales by customer - lastName, total sales (priceEach)

    SELECT contactLastName, SUM(amount) AS "TOTAL_SALES_CUSTOMERS" FROM customers LEFT JOIN payments ON customers.customerNumber = payments.customerNumber GROUP BY contactLastName ORDER BY SUM(amount);

-- Q3. List the emmployees by country, state, lastName, firstName
	
	SELECT country, state, lastName, firstName FROM offices LEFT JOIN employees ON offices.officeCode = employees.officeCode;

-- Q4. How many employees work in each country?

	SELECT country, COUNT(lastName) AS "TOTAL_EMPLOYEES_COUNTRIES" FROM offices LEFT JOIN employees ON offices.officeCode = employees.officeCode GROUP BY country ORDER BY COUNT(lastName);

-- Q5. List the productlines and the number in stock for each line

    SELECT productLine, quantityInStock FROM products ORDER BY  quantityInStock;

-- Q6. How many customers are from each state?

	SELECT state, COUNT(customerNumber) AS "TOTAL_EMPLOYEES_STATES" FROM customers GROUP BY state ORDER BY COUNT(customerNumber);

-- Q7. List the ship dates(list the date only once) 
--     and the total number of orders for each day

    SELECT shippedDate, COUNT(orderNumber) AS "TOTAL_ORDERS" FROM orders GROUP BY shippedDate ORDER BY COUNT(orderNumber);

-- Q8. List the ship dates (list teh date only once) 
--     and the total number of sales(priceEach) for each day

	SELECT shippedDate, SUM(priceEach) AS "TOTAL_PRICE" FROM orders LEFT JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber GROUP BY shippedDate ORDER BY SUM(priceEach);

-- Q9. List the productNames for each ProductLine - order by productlines, productNames

    SELECT productLine, productName FROM products ORDER BY productLine, productName;

-- Q10. List the number of product names for each product line

	SELECT productLine, COUNT(productName) AS "TOTAL_PRODUCT" FROM products GROUP BY productLine ORDER BY COUNT(productName);

-- Q12. List the total inventory value (buyPrice)

    SELECT SUM(buyPrice) AS "TOTAL_INVENTORY_VALUE" FROM products;

-- Q13. List the total value (buyPrice) for each productLine

    SELECT productLine, SUM(buyPrice) AS "TOTAL_PRODUCT_VALUE" FROM products GROUP BY productLine ORDER BY SUM(buyPrice);

-- Q14. List the total amount paid for each customer - lastname, total amount paid

	SELECT contactLastName, SUM(amount) AS "TOTAL_AMOUNT_PAID" FROM customers LEFT JOIN payments ON customers.customerNumber = payments.customerNumber GROUP BY contactLastName ORDER BY SUM(amount); 

-- Q15. List the total amount paid by each country  - country, total amount paid

	SELECT country, SUM(amount) AS "TOTAL_AMOUNT_BY_COUNTRY" FROM customers LEFT JOIN payments ON customers.customerNumber = payments.customerNumber GROUP BY country ORDER BY SUM(amount);
	
	SHOW DATABASES;
	
	DROP DATABASE classicmodels;
	
	SHOW DATABASES;

