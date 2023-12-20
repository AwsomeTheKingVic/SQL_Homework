--BRING IN IF DONT HAVE
SOURCE C:\Users\andre\Desktop\Z\HELPFUL FILES\nation.sql
SOURCE C:\Users\andre\Desktop\Z\HELPFUL FILES\nations.sql
SOURCE C:\Users\andre\Desktop\Z\HELPFUL FILES\cars_db.sql

USE zdbNation;

-- SingleTableQueryAssignment

-- Use the nations database

-- Unless otherwise stated - sort the 
-- data in ascending order

-- Using the Language table write the 
-- following queries:

-- 1. List all the Language

SELECT * FROM languages;

-- 2. Count all the languages

SELECT COUNT(language) FROM languages;

-- 3. List all the languages that
--    begin with the letter "M"

SELECT  language FROM languages WHERE language LIKE 'M%';

-- 4. List all the languaegs that 
--    end with the letter "a"

SELECT language FROM languages WHERE language LIKE '%A';

-- 5. List all of the languages where
--    the fourth letter is the letter "n"

SELECT language FROM languages WHERE language LIKE '___N%';

-- 6. List all of the the languages where
--    the fourth letter is the letter "n" ascending
--    the last letter is the lettter "h"

SELECT language FROM languages WHERE language LIKE '___N%H';

-- 7. Count all of the languages where the 
--    first letter is "M"

SELECT COUNT(language) FROM languages WHERE language LIKE 'M%';

-- Using the zdbauto database

USE zdbauto;

-- 8. List make, model, year_from

SELECT make, model, year_from FROM cardb;

-- 9. List the groups of make, models, and count the year_from

SELECT make, model, COUNT(year_from) FROM cardb GROUP BY make, model, year_from;

-- 10. List all of the makes that have roadsters

SELECT make, model FROM cardb WHERE model LIKE 'Roadster' GROUP BY make;

-- 11. What the earliest year where the year "is not null"

SELECT year_from FROM cardb WHERE (year_from > 0) GROUP BY year_from ASC LIMIT 1;

-- 12. List all of the makes that start with c or f and include
--     all of the pickup trucks

SELECT make, body_type FROM cardb WHERE ((make LIKE 'C%' OR make LIKE 'F%') AND body_type LIKE 'Pickup');

-- 13. Which make model and year_from has the largest trunk capacity

SELECT make, model, year_from, max_trunk_capacity_cu_ft FROM cardb GROUP BY max_trunk_capacity_cu_ft DESC LIMIT 1;

-- 14. Which make, model, and year_from has the least trunk capacity

SELECT make, model, year_from, minimum_trunk_capacity_cu_ft FROM cardb GROUP BY minimum_trunk_capacity_cu_ft ASC LIMIT 1;

-- 15. Which car - make,model,year, weight that weighs the most

SELECT make, model, year_from, full_weight_lbs FROM cardb GROUP BY full_weight_lbs DESC LIMIT 1;

-- 16. List the first 25 cars in ascending order

SELECT make, model FROM cardb ORDER BY make ASC LIMIT 25;

-- 17. Which top 5 cars are the fastest?

SELECT make, model, max_speed_mph FROM cardb WHERE max_speed_mph GROUP BY max_speed_mph DESC LIMIT 5;

-- 18. Which top 5 cars have the most range?

SELECT make, model, range_m FROM cardb GROUP BY range_m DESC LIMIT 5;

-- 19. Which top 5 cars have the most horse power?

SELECT make, model, max_power_hp FROM cardb GROUP BY max_power_hp DESC LIMIT 5;

-- 20. Create a unique list of genrations?

SELECT DISTINCT generation FROM cardb;

-- 21. Create a unique list of series? 

SELECT DISTINCT series FROM cardb;

DROP DATABASE zdbNation;

DROP DATABASE zdbauto;

SHOW DATABASES;

