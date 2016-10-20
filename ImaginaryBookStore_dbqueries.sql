USE bookstoredb;

/* Question #1 */

SELECT *
FROM Author;

SELECT *
FROM Book;

SELECT *
FROM BookOrder;

SELECT *
FROM Customer;

SELECT *
FROM Orders;

SELECT *
FROM Supplier;

/*Question #2 - Aggregate Function */

SELECT YearPublished,SUM(OrderQuantity) as TotalBooksOrdered
FROM BookOrder
JOIN Book
ON BookOrder.BookID = Book.BookID
GROUP BY YearPublished
ORDER BY YearPublished ASC;

/*Question #3 - Inner join */

SELECT s.CompanyName, b.Title
FROM Supplier as s
INNER JOIN Book as b
ON s.SupplierID = b.SupplierID
ORDER BY s.CompanyName ASC; 

/* Question #4 - Left Outer Join */

SELECT b.Title, bo.*
FROM Book as b
LEFT OUTER JOIN BookOrder as bo
ON b.BookID = bo.BookID
ORDER BY b.BookID ASC; 

/* Here we are using a left outer join so that the query displays all the books that we have catalogued but have not been sold (donated). The left outerjoin is neccesary here because otherwise the "Half Blood Prince", "Eclipse", and "Breaking Dawn" books would not be displayed.*/

/*Question #5 - Sub-Query */

SELECT b.BookID, b.Title, b.Price
FROM Book as b
WHERE b.Price > (SELECT AVG(Price)
FROM Book)
ORDER BY b.Price DESC;

/*Team Name = ImaginaryBookstore. Members: Istvan Bardi, Stefanie Canete
