CREATE DATABASE BicycleShop
GO

USE BicycleShop
GO

CREATE TABLE dbo.Category(
Id int PRIMARY KEY,
CategoryName varchar(50) not null
)
GO

INSERT INTO dbo.Category VALUES
(1, 'Rower miejski'),
(2, 'Rower górski'),
(3, 'Rower trekkingowy'),
(4, 'Rękawiczki')
GO

CREATE TABLE dbo.Products(
Id int PRIMARY KEY,
ProductName varchar(200) not null,
Category int FOREIGN KEY REFERENCES dbo.Category(Id),
Price decimal(10,2),
ProductDescription varchar(200),
ImagePath varchar(100)
)
GO

INSERT INTO dbo.Products (Id, ProductName, Category, Price, ProductDescription, ImagePath)
VALUES 
(1, 'Ortler de Goya Wave, czarny', 1, 1800, 'Z Ortler De Goya możesz komfortowo sunąć wśród malowniczych krajobrazów na dłuższych wycieczkach lub na krótkich dystansach w mieście.','C:\1.jpg'),
(2, 'Ortler Monet Wave, czarny', 1, 1976, 'Dzięki wysokiej jakości pełnemu wyposażeniu jest on równie dobrze przygotowany do wycieczek po kraju, jak i do codziennego użytkowania w ruchu miejskim.','C:\2.jpg'),
(3, 'Serious Rockville Disc 27.5'', czarny', 2, 1654.00, 'Najnowsza wersja udanego modelu Serious Rockville MTB jest idealna do tego szerokiego zakresu zastosowań.','C:\3.jpg'),
(4, 'Radio Griffin 26'', zielony', 2, 4356, null,'C:\4.jpg'),
(5, 'Serious Cedar Street Trapeze, czarny', 3, 2345, 'Cedar Street to doskonały rower uniwersalny dla rowerzystów poszukujących sportowego roweru, który jest wystarczająco elastyczny, aby sprostać szerokiej gamie wyzwań w mieście.','C:\5.jpg'),
(6, 'Winter Race Bike Rękawiczki, czarny', 4, 82, 'Rękawice Winter Race Red Cycling Products opracowały wiatroszczelne i wodoodporne rękawice zimowe, które umożliwiają wsiadanie na rower nawet przy niskich temperaturach.','C:\6.jpg')
GO

CREATE TABLE dbo.Customers(
Id int PRIMARY KEY,
CustomerFirstName varchar(200) not null,
CustomerSurname varchar(200) not null,
CustomerDob date
)
GO

INSERT INTO dbo.Customers (Id, CustomerFirstName, CustomerSurname, CustomerDob)
VALUES
(1, 'Jan', 'Tręba', '01/01/1987'),
(2, 'Aleksandra', 'Słowik', '02/01/1997'),
(3, 'Karol', 'Karolowski', '01/04/2001'),
(4, 'Marianna', 'Trzębiełka', '01/12/1997')
GO

CREATE TABLE dbo.Orders(
Id int PRIMARY KEY,
Customer int FOREIGN KEY REFERENCES dbo.Customers(Id),
FullAddress varchar(200),
OrderDate date
)
GO

INSERT INTO dbo.Orders
VALUES
(1, 1, null, '01/12/2020'),
(2, 2, null, '01/12/2020'),
(3, 3, null, '03/12/2020'),
(4, 4, null, '04/12/2020'),
(5, 1, null, '12/12/2020')
GO

CREATE TABLE dbo.OrderProduct(
Id int IDENTITY(1,1) PRIMARY KEY,
OrderId int FOREIGN KEY REFERENCES dbo.Orders(Id),
ProductId int FOREIGN KEY REFERENCES dbo.Products(Id)
)
GO

INSERT INTO dbo.OrderProduct(OrderId, ProductId)
VALUES
(1, 2),
(2, 6),
(3, 1),
(3, 6),
(4, 4),
(5, 6)
GO






