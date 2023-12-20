--CREATE
--CREATE OR REPLACE
--CREATE IF NOT EXIST

--CREATE DATABASE

CREATE OR REPLACE DATABASE zdbinclass425;

USE zdbinclass425;

--DROP DATABASE zdbinclass425

--CREATE TABLE
CREATE OR REPLACE TABLE tbl_person(

Fname VARCHAR(255),
Lname VARCHAR(255),
Person_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY

);

SHOW TABLES;

DESCRIBE tbl_person;

-- CONNECT Fk
CREATE OR REPLACE TABLE tbl_dog(

DogName VARCHAR(255),
Breed VARCHAR(255),
DogColor VARCHAR(255),
Person_ID INT(9),
Dog_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,

CONSTRAINT fk_DogPerson FOREIGN KEY(Person_ID) REFERENCES tbl_person(Person_ID) ON DELETE CASCADE

);

SHOW TABLES;

DESCRIBE tbl_dog;

CREATE OR REPLACE TABLE tbl_vac(

ShotName VARCHAR(255),
Dog_ID INT(9),
Vac_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,

CONSTRAINT fk_vacdog FOREIGN KEY(Dog_ID) REFERENCES tbl_dog(Dog_ID) ON DELETE CASCADE

);

SHOW TABLES;

DESCRIBE tbl_vac;

INSERT INTO tbl_person(Fname,Lname,Person_ID) 
VALUES ('David','Doge',1),('Donald','Dryus',2),('Debbie','Dingle',3),('Bubba','Baker',4),('Brain','Brown',5),('Belinda','Booey',6);

SELECT * FROM tbl_person;

INSERT INTO tbl_dog(DogName,Breed,DogColor,Person_ID,Dog_ID) 
VALUES ('Bella','Collie','Brown',1,1),('Luna','Collie','Red',1,2),('Max','Hound','Grey',2,3),('Buddy','Mutt','Red',2,4),('Daisy','Spaniel','Red',3,5),('Wolfy','Shepard','Brown',NULL,6),('Wiskey','Sitter','Red',NULL, 7),('Windle','Aussie','Blue',NULL,8),('Winnie','Mutt','Grey',NULL,9);

SELECT * FROM tbl_dog;

INSERT INTO tbl_vac(ShotName,Dog_ID,Vac_ID) 
VALUES ('Shot A',1,1),('Shot A',2,2),('Shot A',5,3),('Shot A',6,4),('Shot A',8,5),('Shot B',2,6),('Shot B',4,7),('Shot B',6,8),('Shot B',7,9);

SELECT * FROM tbl_vac;

-- TOTAL NUMBER OF DOGS
SELECT COUNT(Dog_ID)
AS AMOUNT
FROM tbl_dog;

--HOW MANY OWNERS WITH DOGS
SELECT COUNT( DISTINCT tbl_Person.Person_ID)
AS DogOWNERS
FROM tbl_Person
INNER JOIN tbl_dog
ON tbl_Person.Person_ID = tbl_dog.Person_ID;

--HOW MANY DOGS WITHOUT OWNERS
SELECT COUNT(Dog_ID)
AS NOOWNERS
FROM tbl_dog
WHERE Person_ID IS NULL;-- CAN USE IS NULL OR IS NOT NULL

--HOW MANY DOG FOR EACH OWNER
SELECT Lname, COUNT(Dog_ID)
AS DOGS
FROM tbl_person
LEFT JOIN tbl_dog
ON tbl_Person.Person_ID = tbl_dog.Person_ID
GROUP BY Lname;

--HOW MANY DOGS WIHT ONWERS ONLY
SELECT Lname, COUNT(Dog_ID)
AS DOGS
FROM tbl_person
JOIN tbl_dog
ON tbl_Person.Person_ID = tbl_dog.Person_ID
GROUP BY Lname;


SELECT Lname, COUNT(Dog_ID)
AS DOGS
FROM tbl_person
JOIN tbl_dog
ON tbl_Person.Person_ID = tbl_dog.Person_ID

WHERE (SELECT COUNT(Dog_ID)
	AS DOGS
	FROM tbl_person
	JOIN tbl_dog
	ON tbl_Person.Person_ID = tbl_dog.Person_ID) > 1
	
GROUP BY Lname
HAVING DOGS > 1
ORDER BY Lname;

--First Name with the letter D
SELECT Fname
FROM tbl_person
WHERE Fname LIKE 'D%';

--Last Name with 4 CHARACTERS
SELECT Fname, Lname
FROM tbl_person
WHERE Lname LIKE '____';

--GET ALL DOGS WITH SECOND LETTER i WITH NAME
SELECT DogName, Fname, Lname
FROM tbl_dog
LEFT JOIN tbl_person
ON tbl_dog.Person_ID = tbl_person.Person_ID
WHERE DogName LIKE '_I%';

--GET ALL DOGS WITH END LETTER Y WITH NAME
SELECT DogName, Fname, Lname
FROM tbl_dog
LEFT JOIN tbl_person
ON tbl_dog.Person_ID = tbl_person.Person_ID
WHERE DogName LIKE '_I%' OR DogName LIKE '%Y';

--COUNT THE DOGS BY COLOR
SELECT DogColor, COUNT(DogColor)
FROM tbl_dog
GROUP BY DogColor;

INSERT INTO tbl_dog(DogName,Breed,DogColor, Person_ID, Dog_ID)
VALUE ('Dodger','Spaniel','Red', NULL,10);

SELECT * 
FROM tbl_dog;

--COUNT THE DOGS BY COLOR AND BREAD
SELECT DogColor, COUNT(DogColor) AS Colors, Breed, COUNT(Breed) AS Breed
FROM tbl_dog
GROUP BY DogColor, Breed;

SELECT * 
FROM tbl_dog
JOIN tbl_person
JOIN tbl_vac;

--DROP Dodger
DELETE FROM tbl_dog WHERE DogName LIKE 'Dodger';

SELECT * 
FROM tbl_dog;

SELECT DogColor, Breed
FROM tbl_dog
GROUP BY DogColor, Breed
HAVING DogColor LIKE 'Red';

--CHANGE DAISY TO A Mutt
UPDATE tbl_dog
SET Breed = 'Mutt', DogName = 'Dilly'
WHERE Dog_ID = 5;

SELECT * 
FROM tbl_dog;

--HOW MANY VACINATED DOGS ARE THEY
SELECT COUNT(Vac_ID)
FROM tbl_vac;

--WHICH DOGS HAVE VACINATIONS
SELECT DogName, ShotName
FROM tbl_vac
LEFT JOIN tbl_dog
ON tbl_vac.Dog_ID = tbl_dog.Dog_ID;

-- TO REMOVE DUPLICATES USE DISTINCT
SELECT DogName, ShotName
FROM tbl_vac
LEFT JOIN tbl_dog
ON tbl_vac.Dog_ID = tbl_dog.Dog_ID
GROUP BY DogName;

--WHAT DOEGS DO NOT HAVE VACINAIOTNS
SELECT DogName, ShotName
FROM tbl_dog
LEFT JOIN tbl_vac
ON tbl_dog.Dog_ID = tbl_vac.Dog_ID
WHERE ShotName IS NULL;

--LIST THE DOG OWNER FNAME LNAME AND DOGNAME
--FOR NO VACINAIOTNS
SELECT DogName, ShotName, Fname, Lname
FROM tbl_dog
LEFT JOIN tbl_vac
ON tbl_dog.Dog_ID = tbl_vac.Dog_ID
LEFT JOIN tbl_Person
ON tbl_dog.Person_ID = tbl_person.Person_ID
WHERE ShotName IS NULL;

--DOGS HAVE OWNERS AND VACINAIOTNS
SELECT DogName, ShotName, Fname, Lname
FROM tbl_dog
LEFT JOIN tbl_vac
ON tbl_dog.Dog_ID = tbl_vac.Dog_ID
INNER JOIN tbl_Person
ON tbl_dog.Person_ID = tbl_person.Person_ID
WHERE ShotName IS NULL;

DROP DATABASE zdbinclass425;

--SELECT
--FROM
--WHERE
--GROUP BY -- COUNT,SUM,AVG,MAX,MIN,STD
--HAVING
--ORDER BY
--LIMIT