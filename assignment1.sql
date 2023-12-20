CREATE DATABASE zAssgn1;

SHOW DATABASES;

use zAssgn1;

CREATE TABLE tbl_books(

BOOKTITLE      VARCHAR(255),

AuthorFN       VARCHAR(255),

AuthorLN       VARCHAR(255),

Copyrightyear  INT(4),

ISBN           INT(13),

Genre          VARCHAR(255),

Citation       MEDIUMTEXT,

Price          INT(9),

Memo           VARCHAR(255),

books_PK       INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY

);

SHOW TABLES;

DESCRIBE tbl_books;

CREATE TABLE tbl_authors(

AuthorFN    VARCHAR(255) NOT NULL,

AuthorLN    VARCHAR(255) NOT NULL,

Phone       INT(10),

Email1      VARCHAR(255),

Email2      VARCHAR(255),

Address1    VARCHAR(255),

Address2    VARCHAR(255),

City        VARCHAR(255) DEFAULT 'Kalispell',

ST          CHAR(2),

ZIP         INT(5),

Memo        VARCHAR(255),

authors_PK  INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY

);

SHOW TABLES;

DESCRIBE tbl_authors;

CREATE TABLE tbl_booktour(

BookTitle      VARCHAR(255),

Location       VARCHAR(255),

LocationType   VARCHAR(255) DEFAULT 'Coffe Shop',

TelePhone      INT(10),

Address1       VARCHAR(255),

Address2       VARCHAR(255),

City           VARCHAR(255),

ST             CHAR(2),

Zip            INT(5),

SalesCode      CHAR(7) NOT NULL,

Memo           VARCHAR(255)

);

SHOW TABLES;

DESCRIBE tbl_booktour;

ALTER TABLE tbl_booktour DROP COLUMN SalesCode;

DESCRIBE tbl_booktour;

ALTER TABLE tbl_booktour ADD COLUMN SalesCode      CHAR(7) NOT NULL AFTER Zip;

DESCRIBE tbl_booktour;

CREATE TABLE tbl_sales(

BookTitle   VARCHAR(255),

Location    VARCHAR(255),

QTY         INT(9),

Price       INT(9),

-- IM THINKING THAT DATE IS GOING TO BE SPLIT INTO MONTH/DAY/YEAR

OrderDate   INT(8),

sales_PK    INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY

);

SHOW TABLES;

DESCRIBE tbl_sales;

ALTER TABLE tbl_authors DROP COLUMN Email2;

DESCRIBE tbl_authors;

ALTER TABLE tbl_booktour ADD COLUMN email VARCHAR(255) AFTER TelePhone;

ALTER TABLE tbl_booktour ADD COLUMN booktour_PK INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE tbl_booktour CHANGE TelePhone Phone INT(10);

DESCRIBE tbl_booktour;

ALTER TABLE tbl_sales 

ADD COLUMN DeliveryDate   INT(8) AFTER OrderDate,

DROP COLUMN sales_PK,

ADD COLUMN order_PK    INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,

RENAME TO tbl_orders;

DESCRIBE tbl_orders;

DESCRIBE tbl_books;
DESCRIBE tbl_authors;
DESCRIBE tbl_booktour;
DESCRIBE tbl_orders;

DROP TABLE tbl_books;
DROP TABLE tbl_authors;
DROP TABLE tbl_orders;

DROP DATABASE zAssgn1;