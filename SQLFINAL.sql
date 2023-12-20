CREATE OR REPLACE DATABASE zdbRentalCars;

SHOW DATABASES;

USE zdbRentalCars;

CREATE OR REPLACE TABLE tbl_customers(

Fname VARCHAR(255),
Lname VARCHAR(255),
City VARCHAR(255),
EmailAddress VARCHAR(255),
PK_Customer_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY

);

DESCRIBE tbl_customers;

INSERT INTO tbl_customers(Fname, Lname, City, EmailAddress, PK_Customer_ID)
VALUES ('Makena','Montoya','Kalispell','abshabghsagf@gmail.com',1),('Kameron','Delgado','whovill','asnjkangkajbdg@gmail.com',2),
       ('Alessandra','Greer','City','ahbfjsavfjasjfv@gmail.com',3),('A','AA','AAA','AAAA.com',4),('B','BB','BBB','BBBB.com',5),('C','CC','CCC','CCCC.com',6),
	   ('D','DD','DDD','DDDD.com',7),('E','EE','EEE','EEEE.com',8),('F','FF','FFF','FFFF.com',9),('G','GG','GGG','GGGG.com',10);

SELECT *
FROM tbl_customers;

CREATE OR REPLACE TABLE tbl_cars(

Make VARCHAR(255),
Model VARCHAR(255),
Color VARCHAR(255),
Year INT(4),
Type VARCHAR(255),
PK_Customer_ID INT(9),
PK_Cars_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
CONSTRAINT fk_custocar FOREIGN KEY(PK_Customer_ID) REFERENCES tbl_customers(PK_Customer_ID) ON DELETE CASCADE

);

DESCRIBE tbl_cars;

INSERT INTO tbl_cars(Make, Model, Color, Year, Type, PK_Customer_ID, PK_Cars_ID)
VALUES ('ACURA','ILX','Red', 2022,'Passenger', 1,1),('ACURA','Integra','Blue', 2024,'SUV', 1,2),
       ('ACURA','MDX','Green', 2023,'Truck', 4,3),('Bentley','Bentayga','Orange', 2022,'VAN', 6,4),
	   ('Bentley','Continental GT','Purple', 2022,'vroomvroom', 8,5),('Bentley','Flying Spur','Red', 2022,'SUV', 10,6),
	   ('Cadillac','Celestiq','Blue', 2024,'vroomvroom', 2,7),('Cadillac','CT4','Orange', 2022,'Passenger', NULL,8),
       ('Cadillac','CT5','Yellow', 2022,'VAN', NULL,9),('VinFast','VF 6','Green', 2024,'vroomvroom', NULL,10),('ACURA','Integra','White', 2024,'SUV', NULL,11);

SELECT * 
FROM tbl_cars;

CREATE OR REPLACE TABLE tbl_rentalinformation(

Start DATE,
End DATE,
TripMileage INT(9),
PickDrop VARCHAR(255),
PK_Customer_ID INT(9),
PK_RentalInformation_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
CONSTRAINT fk_custorentalinfo FOREIGN KEY(PK_Customer_ID) REFERENCES tbl_customers(PK_Customer_ID) ON DELETE CASCADE

);

DESCRIBE tbl_rentalinformation;

INSERT INTO tbl_rentalinformation(Start, End, TripMileage, PickDrop, PK_Customer_ID, PK_RentalInformation_ID)
VALUES ('2023-12-01','2024-04-11', 1290890,'TaberRentals', 1,1),('2023-04-01','2029-12-05', 4353443,'TaberRentals', 2,2),('2023-12-01','2023-09-01', 34534534,'TaberRentals', 8,3),
       ('2023-04-01','2027-06-11', 213345,'TaberRentals', 1,4),('2023-02-01','2024-06-12', 3453453534,'TaberRentals', 4,5),('2023-07-01','2023-02-01', 453453,'TaberRentals', 10,6),
	   ('2023-05-01','2023-05-11', 43435345,'TaberRentals', 1,7),('2023-01-01','2025-08-23', 435345,'TaberRentals', 6,8),('2023-02-01','2023-09-01', 345345,'TaberRentals', 1,9),
	   ('2023-05-01','2026-09-23', 435345345,'TaberRentals', 1,10);

SELECT * 
FROM tbl_rentalinformation;

CREATE OR REPLACE TABLE tbl_billinginformation(

Billing DATE,
RentalCost INT(9),
PK_Customer_ID INT(9),
PK_BillingInformation INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
CONSTRAINT fk_custobillinginfo FOREIGN KEY(PK_Customer_ID) REFERENCES tbl_customers(PK_Customer_ID) ON DELETE CASCADE

);

DESCRIBE tbl_billinginformation;

INSERT INTO tbl_billinginformation(Billing, RentalCost, PK_Customer_ID)
VALUES ('2023-12-01',124124,1),('2023-09-01',23532,1),('2023-03-01',324,1),
       ('2023-01-01',12,1),('2023-12-01',124,1),('2023-21-01',135,2),('2023-07-01',325,8),
	   ('2023-08-01',235,4),('2023-06-01',5325,10),('2023-04-01',235326,6), ('2023-09-01',235326,NULL);

SELECT *
FROM tbl_billinginformation;

SHOW TABLES;

--QUERIES

--Q1
SELECT Year, Make, Model
FROM tbl_cars
WHERE Year > 2020
ORDER BY Make, Model;

--Q2
SELECT Make, Model, Color, Year, Type, PK_Customer_ID, PK_Cars_ID
FROM tbl_cars
WHERE Color LIKE 'blue' OR Color LIKE 'white';

--Q3
SELECT Make, Model, Color, Year, Type, PK_Customer_ID, PK_Cars_ID
FROM tbl_cars
WHERE Type LIKE 'SUV' AND (Color LIKE 'black' OR Color LIKE 'white');

--Q4
SELECT CONCAT(Make, " ", Model) AS Car, Color, Year, Type, PK_Customer_ID, PK_Cars_ID
FROM tbl_cars;

--Q5
SELECT DISTINCT Make, Model
FROM tbl_cars;

--Q6
SELECT  Lname, Fname, City, EmailAddress, PK_Customer_ID
FROM tbl_customers
ORDER BY Lname, Fname;

--Q7
SELECT CONCAT(Fname, " ", Lname) AS Name, CONCAT(Start, " - ", End) AS Date, PickDrop, PK_Cars_ID, Make, Model, Year, Type
FROM tbl_rentalinformation
LEFT JOIN tbl_customers
ON tbl_customers.PK_Customer_ID = tbl_rentalinformation.PK_Customer_ID
LEFT JOIN tbl_cars
ON tbl_customers.PK_Customer_ID = tbl_cars.PK_Customer_ID
ORDER BY YEAR(start) DESC;

--Q8
SELECT CONCAT(Fname, " ", Lname) AS Name, CONCAT(Start, " - ", End) AS Date, PickDrop, PK_Cars_ID, Make, Model, Year, Type, RentalCost
FROM tbl_rentalinformation
JOIN tbl_customers
ON tbl_customers.PK_Customer_ID = tbl_rentalinformation.PK_Customer_ID
JOIN tbl_cars
ON tbl_customers.PK_Customer_ID = tbl_cars.PK_Customer_ID
JOIN tbl_billinginformation
ON tbl_customers.PK_Customer_ID = tbl_billinginformation.PK_Customer_ID;

--Q9
CREATE OR REPLACE VIEW vwcustomerbillingInfo AS
  SELECT CONCAT(Fname, " ", Lname) AS Name, CONCAT(Start, " - ", End) AS Date, PickDrop, PK_Cars_ID, Make, Model, Year, Type, RentalCost
  FROM tbl_rentalinformation
  JOIN tbl_customers
  ON tbl_customers.PK_Customer_ID = tbl_rentalinformation.PK_Customer_ID
  JOIN tbl_cars
  ON tbl_customers.PK_Customer_ID = tbl_cars.PK_Customer_ID
  JOIN tbl_billinginformation
  ON tbl_customers.PK_Customer_ID = tbl_billinginformation.PK_Customer_ID;
  
SELECT * FROM vwcustomerbillingInfo;

--Q10
SELECT CONCAT(Fname, " ", Lname) AS Name, Start, End, PickDrop, PK_Cars_ID, Make, Model, Year, Type, RentalCost
FROM tbl_rentalinformation
JOIN tbl_customers
ON tbl_customers.PK_Customer_ID = tbl_rentalinformation.PK_Customer_ID
JOIN tbl_cars
ON tbl_customers.PK_Customer_ID = tbl_cars.PK_Customer_ID
JOIN tbl_billinginformation
ON tbl_customers.PK_Customer_ID = tbl_billinginformation.PK_Customer_ID
WHERE YEAR(Start) = 2021 && YEAR(End) = 2021; 
--CHANGE TO 2023 FOR BETTER RESULTS

--Q11
DELIMITER $$
CREATE OR REPLACE PROCEDURE spcustomertotalcost()

	BEGIN
		
		SELECT Lname, Fname, SUM(RentalCost)
		FROM tbl_customers
		LEFT JOIN tbl_billinginformation
		ON tbl_customers.PK_Customer_ID = tbl_billinginformation.PK_Customer_ID
		GROUP BY Lname
		ORDER BY Lname, Fname;
		
	END $$
	
DELIMITER ;

CALL spcustomertotalcost();

--Q12
DELIMITER $$
CREATE OR REPLACE PROCEDURE spcustomertotalcostLESS1000()

	BEGIN
		
		SELECT Lname, Fname, SUM(RentalCost)
		FROM tbl_customers
		LEFT JOIN tbl_billinginformation
		ON tbl_customers.PK_Customer_ID = tbl_billinginformation.PK_Customer_ID
		GROUP BY Lname
		HAVING SUM(RentalCost) < 1000
		ORDER BY Lname, Fname;
		
	END $$
	
DELIMITER ;

CALL spcustomertotalcostLESS1000();


--Q13
SELECT  PK_Cars_ID, Make, Model, Year, Type, COUNT(tbl_rentalinformation.PK_Customer_ID) 
FROM tbl_rentalinformation
JOIN tbl_customers
ON tbl_rentalinformation.PK_Customer_ID = tbl_customers.PK_Customer_ID
RIGHT JOIN tbl_cars
ON tbl_customers.PK_Customer_ID = tbl_cars.PK_Customer_ID
GROUP BY PK_Cars_ID, Year;


--Q14
SELECT Lname, Fname, PK_Cars_ID
FROM tbl_customers
LEFT JOIN tbl_cars
ON tbl_customers.PK_Customer_ID = tbl_cars.PK_Customer_ID
WHERE PK_Cars_ID IS NULL;

--Q15
SELECT * FROM tbl_cars;

UPDATE tbl_cars
SET Make = 'IT WORKED', Model = 'YEP', Color = 'ITS A COLOR', Year = 2203, Type = 'MOREVROOMVROOM'
WHERE PK_Cars_ID = 5;

SELECT * FROM tbl_cars;

--Q16
DESCRIBE tbl_billinginformation;

ALTER TABLE tbl_billinginformation
DROP COLUMN Billing;

DESCRIBE tbl_billinginformation;

--Q17
DESCRIBE tbl_cars;

ALTER TABLE tbl_cars
CHANGE Type Category VARCHAR(255);

DESCRIBE tbl_cars;

SELECT * FROM tbl_cars;

--Q18
SHOW TABLES;

DROP TABLE tbl_billinginformation;

SHOW TABLES;

--Q19
SHOW DATABASES;

DROP DATABASE zdbRentalCars;

SHOW DATABASES;
