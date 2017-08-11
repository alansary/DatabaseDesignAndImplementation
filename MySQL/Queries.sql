SELECT 'Hello, World!' ;
SELECT *
	FROM Country ;
SELECT COUNT(*)
	FROM Country ;
SELECT Name, LifeExpectancy
	FROM Country ;
SELECT Name AS Country, LifeExpectancy AS 'Life Expectancy'
	FROM Country ;
SELECT Name, Continent, Region
	FROM Country ;
SELECT Name, Continent, Region
	FROM Country
	WHERE Continent = 'Europe' ;
SELECT COUNT(IndepYear)
	FROM Country ;
SELECT Continent
	FROM Country ;
SELECT Continent
	FROM Country
    GROUP BY Continent ;
SELECT Continent, Name
FROM Country ;
SELECT Continent, COUNT(Name) AS Countries
	FROM Country
    GROUP BY Continent ;
SELECT Continent, Name
	FROM Country
	GROUP BY Region ;
SELECT Continent, COUNT(Name) AS Countries
	FROM Country
    GROUP BY Continent ;
CREATE DATABASE test;
CREATE TABLE customer (
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
	city VARCHAR(255),
    state CHAR(2),
    zip CHAR(10)
);
INSERT INTO customer
    ( name, address, city, state, zip )
    VALUES (
        'Mohamed Alansary',
        'Egypt',
        'Alexandria',
        'Sidi-bishr',
        'First-Station',
        '22621'
    );
SELECT * FROM customer;
SELECT c.Name AS Country, c.Continent, ct.Name AS Capital
    FROM Country AS c
    JOIN City AS ct
        ON ct.ID = c.Capital
    ORDER BY Country;
SELECT c.Name AS Country, c.Continent, ct.Name AS Capital
	FROM Country AS c, City AS ct
    WHERE ct.ID = c.Capital
    ORDER BY Country;
SELECT CountryCode, Name, Population
    FROM City
    WHERE CountryCode = 'GBR';
SELECT CountryCode, Name, Population
	FROM City
	WHERE Population >= 5000000;
SELECT *
	FROM City
    WHERE Name LIKE 'z%';
SELECT *
	FROM City
    WHERE Name LIKE 'z_a%';
SELECT *
	FROM City
    WHERE CountryCode IN ('USA', 'CAN', 'MAX');
SELECT *
	FROM City
    WHERE CountryCode IN ('USA', 'CAN', 'MAX')
		AND Population >= 1000000;
SELECT *
	FROM City
	WHERE CountryCode IN ('USA', 'CAN', 'MAX')
		OR Population < 1000000;
SELECT *
	FROM City
    WHERE NOT CountryCode IN ('USA', 'CAN', 'MAX');
SELECT GovernmentForm, HeadOfState FROM Country WHERE HeadOfState LIKE 'Elis%';
SELECT ALL GovernmentForm, HeadOfState FROM Country WHERE HeadOfState LIKE 'Elis%';
SELECT DISTINCT GovernmentForm, HeadOfState FROM Country WHERE HeadOfState LIKE 'Elis%';
SELECT Name, District
    FROM City
    WHERE CountryCode = 'USA';
SELECT Name, District
	FROM City
    WHERE CountryCode = 'USA'
    ORDER BY Name;
SELECT Name, District
	FROM City
    WHERE CountryCode = 'USA'
    ORDER BY District, Name;
SELECT Region, AVG(LifeExpectancy) AS AvgLE
    FROM Country
    WHERE LifeExpectancy #where LifeExpectancy is not NULL
    GROUP BY Region
    ORDER BY AvgLE;
#the average will be taken from a group of rows that have a common region and they will be grouped together
#in the result
SELECT Region, AVG(LifeExpectancy) AS AvgLE
	FROM Country
    WHERE LifeExpectancy
    GROUP BY Region
    ORDER BY AvgLE ASC;
SELECT Region, AVG(LifeExpectancy) AS AvgLE
	FROM Country
    WHERE LifeExpectancy
    GROUP BY Region
    ORDER BY AvgLE DESC;
SELECT * FROM track WHERE id = 16;
UPDATE track SET title = 'Blue Suedo Shoes' WHERE id = 16;
SELECT * FROM track WHERE id = 16;
CREATE DATABASE testdbb;
DROP DATABASE testdbb;
SELECT * FROM track WHERE id = 70;
DELETE FROM track WHERE id = 70;
SELECT * FROM track WHERE id = 70;
INSERT INTO track ( id, album_id, title, track_number, duration )
	VALUES (70, 11, 'Fake Track', 9, 549);
SELECT * FROM track WHERE id = 70;
SELECT SUM(s.quantity) AS QUANTITY, i.name AS item
    FROM sale AS s
    JOIN item AS i ON s.item_id = i.id
    GROUP BY i.id;
SELECT SUM(s.quantity) AS QUANTITY, i.name AS item
	FROM sale AS s
    INNER JOIN item AS i ON s.item_id = i.id
    GROUP BY i.id;
SELECT SUM(s.quantity) AS QUANTITY, i.name AS item
	FROM sale AS s
    RIGHT JOIN item AS i ON s.item_id = i.id
    GROUP BY i.id
    ORDER BY quantity;
SELECT s.date, c.name AS Customer, i.name AS item, s.price
    FROM sale AS s
    JOIN item AS i ON s.item_id = i.id
    JOIN customer AS c ON s.customer_id = c.id
    ORDER BY s.date;
SELECT 'Hi there, I''m Mohamed Alansary';
SELECT CONCAT('Hello, ', 'World!');
SELECT LENGTH('Rock and Roll Medley') AS length;
SELECT LENGTH(title) AS 'Title Length' FROM album;
SELECT * FROM album;
SELECT CONCAT(title, ' ', artist) AS test FROM album;
SELECT title, LENGTH(title) AS 'Title Length' FROM album;
SELECT SUBSTR('Hello, World!', 1, 5);
SELECT RIGHT('Hello, World!', 5);
SELECT LEFT('Hello, World!', 5);
SELECT '    Four spaces to the left and right    ';
SELECT TRIM('    Four spaces to the left and right    ');
SELECT title AS Title FROM album;
SELECT UPPER(title) AS Title FROM album;
SELECT LOWER(title) AS Title FROM album;
SELECT ABS(-12);
SELECT ABS('-12');
SELECT ABS('-x12');
SELECT Name AS Country, ABS(GNP - GNPOld) AS Delta
    FROM Country
    WHERE GNP AND GNPOld
    ORDER BY Country;
SELECT ROUND(5.19, 0);
SELECT ROUND(5.5, 0);
SELECT ROUND(-5.49);
SELECT ROUND(-5.5);
SELECT Region, AVG(LifeExpectancy) AS AvgLE, ROUND(AVG(LifeExpectancy), 0)
    AS RndLE
    FROM Country
    WHERE LifeExpectancy
    GROUP BY Region
    ORDER BY AvgLE;
SELECT a.title AS Album, t.title AS Track, t.duration AS Duration
    FROM album AS a
    JOIN track AS t ON t.album_id = a.id;
SELECT a.title AS Album, t.title AS Track, SEC_TO_TIME(t.duration) AS Duration
    FROM album AS a
    JOIN track AS t ON t.album_id = a.id;
SELECT a.title AS Album, t.title AS Track,
    CONCAT(
        t.duration DIV 60,
        ':',
        LPAD(t.duration MOD 60, 2, '0')
	) AS Duration
    FROM album AS a
    JOIN track AS t ON t.album_id = a.id;
SELECT LPAD(title, 23, 'XO') FROM album;
SELECT MAX(LENGTH(title)) FROM album;
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 2 WEEK) AS Later;
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 2 DAY) AS Later;
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 2 MONTH) AS Later;
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 2 YEAR) AS Later;
SELECT NOW(), DATE_SUB(NOW(), INTERVAL 2 WEEK) AS Earlier;
SELECT NOW(), DATE_SUB(NOW(), INTERVAL 2 DAY) AS Earlier;
SELECT NOW(), DATE_SUB(NOW(), INTERVAL 2 MONTH) AS Earlier;
SELECT NOW(), DATE_SUB(NOW(), INTERVAL 2 YEAR) AS Earlier;
SELECT COUNT(*) FROM Country;
SELECT Region, COUNT(*) AS Count
    FROM Country
    GROUP BY Region
    ORDER BY Count, Region;
SELECT a.title AS Album, COUNT(t.track_number) AS Tracks
    FROM track AS t
    JOIN album AS a ON a.id = t.album_id
    GROUP BY t.album_id
    ORDER BY Tracks DESC, Album;
SELECT a.title AS Album, COUNT(t.track_number) AS Tracks
	FROM track AS t
    JOIN album AS a ON a.id = t.album_id
    GROUP BY t.album_id
		HAVING Tracks >= 10
    ORDER BY Tracks DESC, Album;
SELECT COUNT(HeadOfState) AS NumHeads FROM Country;
SELECT COUNT(DISTINCT HeadOfState) AS NumHeads FROM Country;
SELECT SUM(duration) FROM track;
SELECT SEC_TO_TIME(SUM(duration)) FROM track;
SELECT a.title AS Album, SEC_TO_TIME(SUM(t.duration)) AS Duration
    FROM album AS a
    JOIN track AS t ON t.album_id = a.id
    GROUP BY Album;
SELECT a.title AS Album, SEC_TO_TIME(AVG(t.duration)) AS Duration
    FROM album AS a
    JOIN track AS t ON t.album_id = a.id
    GROUP BY Album;
SELECT a.title AS Album, SEC_TO_TIME(MAX(t.duration)) AS Duration
    FROM album AS a
    JOIN track AS t ON t.album_id = a.id
    GROUP BY Album;
SELECT a.title AS Album, SEC_TO_TIME(MIN(t.duration)) AS Duration
    FROM album AS a
    JOIN track AS t ON t.album_id = a.id
    GROUP BY Album;
