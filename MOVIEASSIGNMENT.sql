CREATE OR REPLACE DATABASE zbdmovie;

USE zbdmovie;

SHOW TABLES;

CREATE OR REPLACE TABLE tbl_person(

Fname VARCHAR(255),
Lname VARCHAR(255),
Person_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY

);

DESCRIBE tbl_person;

SHOW TABLES;

CREATE OR REPLACE TABLE tbl_account(

Account_Number VARCHAR(255),
Billing_Street VARCHAR(255),
Billing_City VARCHAR(255),
Billing_Zip VARCHAR(255),
Person_ID INT(9),
Account_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
CONSTRAINT fl_personaccount  FOREIGN KEY(Person_ID) REFERENCES tbl_person(Person_ID) ON DELETE CASCADE

);

DESCRIBE tbl_account;

SHOW TABLES;

CREATE OR REPLACE TABLE tbl_movie(

MovieTitle VARCHAR(255),
MovieGenre VARCHAR(255),
MovieYear CHAR(4),
MovieRating VARCHAR(255),
MovieComments TEXT,
Movie_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY

);

DESCRIBE tbl_movie;

SHOW TABLES;

CREATE OR REPLACE TABLE tbl_actor(

Fname VARCHAR(255),
Lname VARCHAR(255),
Actor_Comments BIGINT(9),
Actor_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY

);

DESCRIBE tbl_actor;

SHOW TABLES;

CREATE OR REPLACE TABLE tbl_library(

Movie_ID INT(9),
Person_ID INT(9),
Library_ID BIGINT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
CONSTRAINT fl_movielibrary FOREIGN KEY(Movie_ID) REFERENCES tbl_movie(Movie_ID) ON DELETE CASCADE,
CONSTRAINT fl_personlibrary FOREIGN KEY(Person_ID) REFERENCES tbl_person(Person_ID) ON DELETE CASCADE

);

DESCRIBE tbl_library;

SHOW TABLES;

CREATE OR REPLACE TABLE tbl_movieactors(

Movie_ID INT(9),
Actor_ID INT(9),
MovieActor_ID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
CONSTRAINT fl_movieactormovie FOREIGN KEY(Movie_ID) REFERENCES tbl_movie(Movie_ID) ON DELETE CASCADE,
CONSTRAINT fl_movieactoractor FOREIGN KEY(Actor_ID) REFERENCES tbl_actor(Actor_ID) ON DELETE CASCADE

);

DESCRIBE tbl_movieactors;

SHOW TABLES;

SELECT * FROM tbl_person;

INSERT INTO tbl_person(Fname, Lname, Person_ID) VALUES ('John', 'Cena', 1),('Oop', 'Baloop', 2),('YESNAME', 'NONAME', 3),('Crusher', 'Bubba', 4);

SELECT * FROM tbl_person;

SELECT * FROM tbl_account;

INSERT INTO tbl_account(Account_Number, Billing_Street, Billing_City, Billing_Zip, Person_ID, Account_ID) VALUES ('32568', 'DSFKHB 34', 'COSTA' ,'247T2' , 1,1),('8643593', 'SAHFBS 986', 'RICKO' ,'54654' , 2,2),('09438534', 'KJBHSDFB 234', 'LAKE' ,'6546456' , 3,3),('0912739812', 'SKJHF 09735', 'TOWN' ,'43634634' , 4,4);

SELECT * FROM tbl_account;

SELECT * FROM tbl_movie;

INSERT INTO tbl_movie(MovieTitle, MovieGenre, MovieYear, MovieRating, MovieComments, Movie_ID) VALUES ('A', 'A', 'A', 'A', 'A', 1), ('B', 'B', 'B', 'B', 'B', 2), ('C', 'C', 'C', 'C', 'C', 3), ('D', 'D', 'D', 'D', 'D', 4), ('E', 'E', 'E', 'E', 'E', 5), ('F', 'F', 'F', 'F', 'F', 6), ('G', 'G', 'G', 'G', 'G', 7), ('H', 'H', 'H', 'H', 'H', 8);

SELECT * FROM tbl_movie;

SELECT * FROM tbl_library;

INSERT INTO tbl_library(Person_ID, Movie_ID, Library_ID) VALUES (1,1,1),(1,2,2),(2,3,3),(2,4,4),(3,5,5),(3,6,6),(4,7,7),(4,8,8);

SELECT * FROM tbl_library;

SELECT * FROM tbl_actor;

INSERT INTO tbl_actor(Fname ,Lname ,Actor_Comments , Actor_ID) VALUES ('A','A','A',1),('AA','AA','AA',2),('B','B','B',3),('BB','BB','BB',4),('C','C','C',5),('CC','CC','CC',6),('D','D','D',7),('DD','DD','DD',8),('E','E','E',9),('EE','EE','EE',10),('F','F','F',11),('FF','FF','FF',12),('G','G','G',13),('GG','GG','GG',14),('H','H','H',15),('HH','HH','HH',16);

SELECT * FROM tbl_actor;

SELECT * FROM tbl_movieactors;

INSERT INTO tbl_movieactors(Movie_ID, Actor_ID, MovieActor_ID) VALUES (1,1,1),(1,2,2),(2,3,3),(2,4,4),(3,5,5),(3,6,6),(4,7,7),(4,8,8),(5,9,9),(5,10,10),(6,11,11),(6,12,12),(7,13,13),(7,14,14),(8,15,15),(8,16,16);

SELECT * FROM tbl_movieactors;

SELECT Fname, Lname, tbl_person.Person_ID, Account_Number, Billing_Street, Billing_City, Billing_Zip, Account_ID FROM tbl_person JOIN tbl_account ON tbl_person.Person_ID = tbl_account.Person_ID;

SELECT * FROM tbl_library;

SELECT * FROM tbl_movie;

SELECT * FROM tbl_movieactors;

SELECT * FROM tbl_actor;

DELETE FROM tbl_person WHERE Person_ID = 3;

SELECT Fname, Lname, tbl_person.Person_ID, Account_Number, Billing_Street, Billing_City, Billing_Zip, Account_ID FROM tbl_person JOIN tbl_account ON tbl_person.Person_ID = tbl_account.Person_ID;

SELECT * FROM tbl_library;

SELECT * FROM tbl_movie;

SELECT * FROM tbl_movieactors;

SELECT * FROM tbl_actor;

DELETE FROM tbl_library WHERE Library_ID = 3;

SELECT Fname, Lname, tbl_person.Person_ID, Account_Number, Billing_Street, Billing_City, Billing_Zip, Account_ID FROM tbl_person JOIN tbl_account ON tbl_person.Person_ID = tbl_account.Person_ID;

SELECT * FROM tbl_library;

SELECT * FROM tbl_movie;

SELECT * FROM tbl_movieactors;

SELECT * FROM tbl_actor;

DELETE FROM tbl_movie WHERE Movie_ID = 5;

SELECT Fname, Lname, tbl_person.Person_ID, Account_Number, Billing_Street, Billing_City, Billing_Zip, Account_ID FROM tbl_person JOIN tbl_account ON tbl_person.Person_ID = tbl_account.Person_ID;

SELECT * FROM tbl_library;

SELECT * FROM tbl_movie;

SELECT * FROM tbl_movieactors;

SELECT * FROM tbl_actor;

DELETE FROM tbl_actor WHERE Actor_ID = 12;

SELECT Fname, Lname, tbl_person.Person_ID, Account_Number, Billing_Street, Billing_City, Billing_Zip, Account_ID FROM tbl_person JOIN tbl_account ON tbl_person.Person_ID = tbl_account.Person_ID;

SELECT * FROM tbl_library;

SELECT * FROM tbl_movie;

SELECT * FROM tbl_movieactors;

SELECT * FROM tbl_actor;

SHOW TABLES;

SHOW DATABASES;

DROP DATABASE zbdmovie;

SHOW DATABASES;