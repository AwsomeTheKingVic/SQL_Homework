--TEE C:\z\3-9.sql; 

CREATE DATABASE zdbjoins; 

USE zdbjoins; 

SHOW DATABASES;    
Show tables; 
 
CREATE OR REPLACE TABLE tbl_Person   
(  
FN       VARCHAR(50),    
Person_ID      INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY  
);  

DESCRIBE tbl_Person; 

CREATE OR REPLACE TABLE tbl_Car 
( 
    Make        VARCHAR(50), 
    Model       VARCHAR(50), 
    Color       VARCHAR(50), 
    Person_ID   INT(9), 
    Car_ID      INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    CONSTRAINT fk_CarPerson FOREIGN KEY(Person_ID) 
    REFERENCES tbl_Person(Person_ID) 
); 

DESCRIBE tbl_Car; 

Select * from tbl_Person;

Select "______1______" as "comment";

INSERT INTO tbl_Person(FN,Person_ID)  
 VALUES ('Ally',1),
        ('Bob',2),
        ('Bubba',3), 
        ('Billy',4), 
        ('Danny',5), 
        ('David',6), 
        ('Jim',7), 
        ('Jack',8); 

        Select * from tbl_Person; 

INSERT INTO tbl_car(Make,Model,Color,Person_ID) 
VALUES             ('Ford','F150','Red',2), 
                   ('Ford','F150','Red',3), 
                   ('Ford','Mustang','Yellow',4), 
                   ('Ford','Fiesta','Green',NULL),  
                   ('Scion','XB','Blue',NULL), 
                   ('Suburu','Forester','Forest',5); 

        SELECT * FROM tbl_Car; 

Select "_____2_______" as "comment"; 

--

SELECT tbl_Person.FN, tbl_Car.Make, Model 
FROM tbl_Person 
JOIN 
tbl_car; 

-- cartesian product 
-- **** VERY VERY BAD ******** 

-- INNER JOIN -- 

SELECT tbl_person.FN, tbl_Car.Make, Model 
FROM   tbl_Person Inner JOIN tbl_Car 
ON     tbl_Person.Person_ID = tbl_Car.Person_ID; 

-- LEFT JOIN -- 

SELECT tbl_person.FN, tbl_Car.Make, Model 
FROM   tbl_Person LEFT JOIN tbl_Car 
ON     tbl_Person.Person_ID = tbl_Car.Person_ID; 

-- RIGHT JOIN -- 

SELECT tbl_person.FN, tbl_Car.Make, Model 
FROM   tbl_Person RIGHT JOIN tbl_Car 
ON     tbl_Person.Person_ID = tbl_Car.Person_ID;  

-- UNION 

CREATE OR REPLACE TABLE tbl_Actor  
(  
FN       VARCHAR(50),    
Actor_ID      INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY  
);  

DESCRIBE tbl_Actor; 


