/* Pobranie wszystkich kolumn i wierszy*/
SELECT * FROM dbo.Products
GO

/* Pobranie wybranych kolumn*/
SELECT Id, CustomerFirstName, CustomerSurname FROM dbo.Customers
GO

/* Eliminowanie duplikatów*/
SELECT DISTINCT Category FROM dbo.Products
GO

/* Eliminowanie duplikatów*/
SELECT DISTINCT Category FROM dbo.Products
GO

UPDATE dbo.Customers SET CustomerFirstName='Marian' where Id=2
GO

/*Łączenie danych tekstowych i nadanie własnej nazwy wynikowej kolumny*/
SELECT CustomerFirstName + ' ' + CustomerSurname AS 'Imię i Nazwisko' FROM dbo.Customers
GO

/*Łączenie danych tekstowych i nadanie własnej nazwy wynikowej kolumny*/
SELECT CustomerFirstName + ' ' + CustomerSurname AS 'Imię i Nazwisko' FROM dbo.Customers
GO

/*Operacje arytmetyczne*/
SELECT Price /4.69 AS 'Cena w euro' FROM dbo.Products
GO

/*Funkcje arytmetyczne*/
SELECT ROUND(Price /4.69,2) AS 'Cena w euro' FROM dbo.Products
GO

/*Konwertowanie*/
SELECT CAST(ROUND(Price /4.69,2) AS numeric(26,2)) AS 'Cena w euro' FROM dbo.Products
GO

/*Inne funkcje arytmetyczne*/
SELECT SQRT(9), ABS(-1), RAND()
GO

/*Funkcje znakowe*/
SELECT LEN('Podstawy SQL'), UPPER('podstawy sql'), REPLACE('to jest test','test','kurs')
GO

/*Funkcje daty*/
SELECT GETDATE(), DAY(GETDATE()), DATEADD(DAY, 1, GETDATE())
GO

/*Funkcja CASE*/
SELECT ProductName, Price, 
CASE
	WHEN Price <100 THEN 'Tani'
	WHEN Price <500 THEN 'Umiarkowana cena'
	ELSE 'Drogi' 
END AS 'Półka cenowa'
FROM dbo.Products
GO

/*Sortowanie wyników*/
SELECT * FROM dbo.Products
ORDER BY Price

SELECT * FROM dbo.Products
ORDER BY Price DESC

/*WYBIERANIE WIERSZY*/

SELECT * FROM dbo.Products
WHERE Category =1

SELECT * FROM dbo.Products
WHERE Category =1 AND Id=1

SELECT * FROM dbo.Products
WHERE Category =1 OR Category =2

SELECT * FROM dbo.Products
WHERE Category IN(1,2)

SELECT * FROM dbo.Products
WHERE Category BETWEEN 1 AND 2

SELECT * FROM dbo.Products
WHERE (Category BETWEEN 1 AND 2) AND (Price>2000)

SELECT * FROM dbo.Products
WHERE Category<>1

SELECT * FROM dbo.Products
WHERE NOT Category=1

/*Tu nawiasy maja znaczenie*/
SELECT * FROM dbo.Products
WHERE NOT Category=1 AND Price<1900

SELECT * FROM dbo.Products
WHERE NOT (Category=1 AND Price<1900)

/*Sortowanie i wybieranie*/
SELECT * FROM dbo.Products
WHERE Category IN(1,2)
ORDER BY Category DESC

/*top*/
SELECT TOP 2 * FROM dbo.Products
WHERE Category IN(1,2)
ORDER BY Category DESC

/*WARTOŚĆ NULL*/
SELECT * FROM dbo.Products
WHERE ProductDescription=null
SELECT * FROM dbo.Products
WHERE ProductDescription is null

SELECT * FROM dbo.Products
WHERE ProductDescription is not null

/*Łączenie tabel i wyników zapytań*/
--JOIN
SELECT O.Id as OrderId, CustomerFirstName, CustomerSurname FROM
dbo.Customers AS C 
JOIN dbo.Orders AS O
ON C.Id=O.Customer

--LEFT/RIGHT JOIN
SELECT * FROM dbo.Orders
SELECT * FROM dbo.Customers

INSERT INTO dbo.Customers
VALUES(5, 'Nowy', 'Klient', null)
GO

SELECT C.* FROM
dbo.Customers AS C
LEFT JOIN dbo.Orders AS O 
ON O.Customer=C.Id

SELECT C.* FROM
dbo.Customers AS C
JOIN dbo.Orders AS O 
ON O.Customer=C.Id

SELECT C.* FROM
dbo.Customers AS C
RIGHT JOIN dbo.Orders AS O 
ON O.Customer=C.Id

SELECT C.* FROM
dbo.Orders AS O 
RIGHT JOIN dbo.Customers AS C 
ON O.Customer=C.Id




