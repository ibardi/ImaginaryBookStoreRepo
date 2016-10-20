/* "Imaginery Bookstore" by Istvan Bardi, Stefanie Canete */

CREATE DATABASE bookstoredb;
GO

USE bookstoredb;
GO

CREATE TABLE  Customer(
CustomerID bigint NOT NULL PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar (50) NOT NULL,
Phone bigint NOT NULL,
Address1 varchar(50) NOT NULL,
Address2 varchar(50) NOT NULL,
City varchar(50) NOT NULL,
State varchar(50) NOT NULL,
Zip varchar(50) NOT NULL);


CREATE TABLE Author(
AuthorID bigint NOT NULL PRIMARY KEY, 
FirstName varchar(50), 
LastName varchar(50),
YearBorn bigint, 
YearDied bigint);

CREATE TABLE Supplier(
SupplierID bigint NOT NULL PRIMARY KEY,
CompanyName varchar (50) NOT NULL, 
ContactName varchar(50) NOT NULL, 
ContactPhone bigint NOT NULL,
Address1 varchar(50) NOT NULL, 
Address2 varchar(50), 
City varchar(50) NOT NULL, 
State varchar(50), 
ZIP varchar(50) NOT NULL,
Country varchar(50) NOT NULL);

CREATE TABLE [dbo].[Orders] (
    [OrderID]   BIGINT NOT NULL,
    [OrderDate] DATE   NOT NULL,
    [CustomerID] BIGINT NOT NULL, 
    PRIMARY KEY CLUSTERED ([OrderID] ASC), 
    CONSTRAINT [FK_Orders_Customer] FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE [dbo].[Book] (
    [BookID]        BIGINT       NOT NULL,
    [AuthorID]      BIGINT       NOT NULL,
    [SupplierID]    BIGINT       NOT NULL,
    [Title]         VARCHAR (50) NOT NULL,
    [YearPublished] BIGINT       NOT NULL,
    [ISBN]          BIGINT       NOT NULL,
    [Price]         MONEY        NOT NULL,
    PRIMARY KEY CLUSTERED ([BookID] ASC), 
    CONSTRAINT [FK_Book_Author] FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
	CONSTRAINT [FK_Book_Supplier] FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE [dbo].[BookOrder] (
    [BookOrderID]   BIGINT NOT NULL,
    [BookID]        BIGINT NOT NULL,
    [OrderID]       BIGINT NOT NULL,
    [OrderQuantity] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([BookOrderID] ASC), 
    CONSTRAINT [FK_BookOrder_Orders] FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
    CONSTRAINT [FK_BookOrder_Book] FOREIGN KEY (BookID) REFERENCES Book(BookID)
);





/* We used the Designer view to set up the foreign key relationships */ 

INSERT INTO Customer (CustomerID,FirstName, LastName,Phone,Address1,Address2,City,State,Zip) VALUES
(1,'Harry','Potter',6171111111,'41 Forest Street','Park Manor West','Babson Park','MA',02467),
(2,'Hermione','Granger',6171111112,'231 Forest Street','Park Manor North','Babson Park','MA',02467),
(3,'Dudley','Dursley',6171111113,'34 Tree Street','Park Manor North','Balton Park','MA',02257),
(4,'Hagrid','Giant',6171111114,'43 Canada Street','Hagrid Hut','Hagrid Park','CA',53477),
(5,'Dumbledore','Albus',6171111115,'21 Albus Street','Wizard Courtyard','Hogwarts','FL',04557),
(6,'Voldemort','Riddle',6171111116,'21 Jump Street','Hollywood','Los Angeles','CA',07557),
(7,'Ron','Weasley',6171111117,'22 Jump Street','Hollywood','Los Angeles','CA',01347),
(8,'Draco','Malfoy',6171111118,'12 Beacon Street','Apartment 2','Brookline','MA',06557),
(9,'Cedrick','Diggery',6171111119,'86 Bacon Avenue','Sausage Park','Meat Town','NY',02867),
(10,'Snape','Severus',6171111121,'54 Highway Street','Underpass Park','TollGate City','FL',06457);


INSERT INTO Author (AuthorID,FirstName,LastName,YearBorn,YearDied) VALUES
(1,'Tom','Jackson',1539,1584),
(3,'Fiddle','Thomas',1985,2014),
(4,'John','Doe',1932,1995),
(5,'Catherine','Bagel',1930,1973),
(6,'Star','Bucks',1940,1985),
(7,'Ronald','McDonald',1940,1975),
(8,'Roger','Babson',1880,1943);

INSERT INTO Author (AuthorID,FirstName,LastName,YearBorn) VALUES
(9,'Elizabeth','Queen',1930),
(10,'Barack','Obama',1968),
(2,'JK','Rowling',1974);

INSERT INTO Supplier (SupplierID, CompanyName, ContactName, ContactPhone, Address1, Address2, City, State, Zip, Country) VALUES
(1, 'Hogwarts', 'One',  6975550142, '1970 Napa Ct.', 'Glenside Dr', 'Bothell', 'MA', 11124, 'USA'), 
(2, 'Hogsmeade', 'Two', 6975550143, '9833 Mt. Dias Blv.', 'Churchill Dr.', 'Newport Hills', 'MA', 12345, 'USA'),
(3, 'Universal', 'Three', 6975550144, '9297 Kenston Dr.', 'Castro Dr', 'Renton', 'NY', 12334, 'USA'), 
(4, 'Disney', 'Four', 6975550145, '4312 Cambridge Drive', 'Clinton Dr', 'Torrance', 'NJ', 45321, 'USA'),
(5, 'Seth', 'Five', 6975550164, '1286 Cincerto Circle', 'Airport Dr', 'Torrance', 'NJ', 32145, 'USA'),
(6, 'Trump', 'Six', 6975550142, '2141 Delaware Ct.', 'Stupefy Dr', 'Renton', 'NY', 12334, 'USA'), 
(7, 'Hill', 'Seven', 6975550143, '1411 Ranch Drive', 'Northridge Ct.', 'Carnation', 'PA', 41345, 'USA'), 
(8, 'Arry', 'Eight', 6975550123,'2639 Anchor Court', 'Alexander Pl.', 'Edmonds', 'WY', 64315, 'USA'), 
(9, 'Latt', 'Nine', 6975552123, '3284 S. Blank Avenue', 'Norse Drive', 'Bellevue', 'MD', 75412, 'USA'), 
(10, 'Heav', 'Ten', 6975552823, '4311 Clay Rd', 'Teakwood Dr.', 'Lynnwood', 'SC', 53214, 'USA'); 


INSERT INTO Book (BookID, AuthorID, SupplierID, Title, YearPublished, ISBN, Price) VALUES
(1, 3, 4, 'Sorcers Stone', 1991, 1234567891234, 10),
(2, 5, 7, 'Chamber of Secrets', 1992, 1234567891235, 11), 
(3, 4, 9,'Prisoner of Azkaban', 1993, 1234567891236, 12), 
(4, 8, 1, 'Goblet of Fire', 1994, 1234567891237, 13), 
(5, 9, 1,'Order of Phoenix', 1995, 1234567891238, 14), 
(6, 1, 4,'Half Blood Prince', 1996, 1234567891239, 15), 
(7, 6, 9,'Deathly Hallows', 1997, 1234567891222, 16),
(8, 6, 3,'Twilight', 1998, 1234567891223, 17), 
(9, 3, 5,'Eclipse', 1999, 1234567891224, 18), 
(10, 8, 10,'Breaking Dawn', 2000, 1234567891225, 19);


INSERT INTO Orders (OrderID, OrderDate, CustomerID) VALUES
(1, '2016-10-20', 3),
(2, '2016-09-11', 7), 
(3, '2016-08-08', 1),
(4, '2014-03-09', 2),
(5, '2015-05-04', 3), 
(6, '2016-11-09', 4),
(7, '2015-12-16', 5),
(8, '2013-04-09', 6), 
(9, '2015-04-04', 7), 
(10, '2016-09-15', 8);  

INSERT INTO BookOrder (BookOrderID,OrderQuantity,BookID,OrderID) VALUES 
(1,7,3,1),
(2,9,1,5),
(3,10,4,8),
(4,11,8,3),
(5,3,4,3),
(6,5,2,8),
(7,34,5,5), 
(8,4,7,10),
(9,6,4,2),
(10,50,1,4);
