create database airbnb_listings_data;
use airbnb_listings_data;
create table airbnb_listings(id int,city varchar(20),country varchar(20),number_of_rooms float,year_listed YEAR);
insert into airbnb_listings(id,city,country,number_of_rooms,year_listed)
values 
(1,'Paris','France',5,2018),
(2,'Tokyo','Japan',2,2017),
(3,'New York','USA',2,2022);

-- QUERING TABLE --
 -- 1. Get all the columns from a table --
 SELECT *
 FROM airbnb_listings;
 
 -- 2. Get the city column from the table--
 SELECT city 
 FROM airbnb_listings;
 
-- 3. Get the city and year_listed columns from the table--
SELECT city, year_listed
 FROM airbnb_listings;

-- 4. Get the listing id, city, ordered by the number_of_rooms in ascending order--
SELECT id,city 
FROM airbnb_listings 
ORDER BY number_of_rooms ASC;

-- 5. Get the listing id, city, ordered by the number_of_rooms in descending order--
SELECT id,city
FROM airbnb_listings
ORDER BY number_of_rooms DESC;

-- 6. Get the first 2 rows from the airbnb_listings table--
SELECT *
FROM airbnb_listings
LIMIT 2;

-- 7. Get a unique list of cities where there are listings--
SELECT DISTINCT CITY 
FROM airbnb_listings;

-- FILTERING DATA --
-- Filtering on numeric columns--
-- 1. Get all the listings where number_of_rooms is more or equal to 3--
SELECT *
FROM airbnb_listings
WHERE number_of_rooms >=3;

-- 2. Get all the listings where number_of_rooms is more than 3--
SELECT *
FROM airbnb_listings
WHERE number_of_rooms >3;

-- 3. Get all the listings where number_of_rooms is exactly equal to 3--
SELECT *
FROM airbnb_listings
WHERE number_of_rooms =3;

-- 4. Get all the listings where number_of_rooms is lower or equal to 3--
SELECT * 
FROM airbnb_listings
WHERE number_of_rooms <=3;

-- 5. Get all the listings where number_of_rooms is lower than 3--
SELECT *
FROM airbnb_listings
WHERE number_of_rooms <3;

-- 6. Get all the listings with 3 to 6 rooms--
SELECT *
FROM airbnb_listings
WHERE number_of_rooms BETWEEN 3 AND 6;

-- FILTERING ON TEXT COLUMNS--
-- 7. Get all the listings that are based in 'Paris'--
SELECT *
FROM airbnb_listings
WHERE city='Paris';

-- 8. Get the listings based in the  and in 'USA' 'France'--
SELECT *
FROM airbnb_listings
WHERE country IN('USA','France');

-- 9. Get all the listings where the city starts with and where the city does not end in 'j' 't'--
SELECT *
FROM airbnb_listings
WHERE city  LIKE 'j%' AND city NOT LIKE '%t';

-- Filtering on multiple columns--
 -- 10. Get all the listings in  where number_of_rooms is bigger than 3 --
 SELECT * 
 FROM airbnb_listings
 WHERE city='Paris' and number_of_rooms>3;
 
-- Get all the listings in  ‘Paris’ OR the ones that were listed after 2012 --
SELECT *
FROM airbnb_listings
WHERE city='Paris'
OR year_listed >2012;

-- Filtering on missing data --
 -- Return the listings where number_of_rooms is missing --
 SELECT *
 FROM airbnb_listings
 WHERE number_of_rooms IS NULL;
 
-- Return the listings where number_of_rooms is not missing --
SELECT *
FROM airbnb_listings
WHERE number_of_rooms IS NOT NULL;

-- AGGREGATING DATA --
-- Simple aggregations  --
-- Get the total number of rooms available across all listings --
SELECT SUM(number_of_rooms)
FROM airbnb_listings;

-- Get the average number of rooms per listing across all listings --
SELECT AVG(number_of_rooms)
FROM airbnb_listings;

-- Get the listing with the highest number of rooms across all listings --
SELECT MAX(number_of_rooms)
FROM airbnb_listings;

-- Get the listing with the lowest number of rooms across all listings --
SELECT MIN(number_of_rooms)
FROM airbnb_listings;

-- Grouping, filtering, and sorting --
-- Get the total number of rooms for each country --
SELECT country,
SUM(number_of_rooms)
FROM airbnb_listings
GROUP BY country;

-- Get the average number of rooms for each country --
SELECT country
,AVG(number_of_rooms)
FROM airbnb_listings
GROUP BY country;

-- Get the listing with the maximum number of rooms per country --
SELECT country,
MAX(number_of_rooms)
FROM airbnb_listings
GROUP BY country;

-- Get the listing with the lowest amount of rooms per country --
SELECT country,
MIN(number_of_rooms)
FROM airbnb_listings
GROUP BY country;

--  For each country, get the average number of rooms per listing, sorted by ascending order --
SELECT country,
AVG(number_of_rooms) AS avg_rooms
FROM airbnb_listings
GROUP  BY country
ORDER BY avg_rooms ASC;

-- For Japan and the USA, get the average number of rooms per listing in each country --
SELECT country,AVG(number_of_rooms)
FROM airbnb_listings
WHERE country IN ('USA','Japan')
GROUP BY country;

-- Get the number of cities per country, where there are listings --
SELECT country,
COUNT(city) as number_of_cities
FROM airbnb_listings
GROUP BY country;      

 -- Get all the years where there were more than 100 listings per year --
 SELECT year_listed
 FROM airbnb_listings
 GROUP BY year_listed
 HAVING COUNT(id)>100;
 