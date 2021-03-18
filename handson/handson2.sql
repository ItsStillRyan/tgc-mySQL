/* CHINOOK SOLUTIONS */

/* Q1 */
SELECT FirstName, LastName FROM Employee WHERE Title = "Sales Support Agent";

/* Q2 */
SELECT FirstName, LastName, HireDate FROM Employee 
WHERE HireDate >= "2002-01-01" AND HireDate <= "2003-12-31";

/* Q3 */
SELECT * FROM Artist WHERE Name LIKE "%Metal%";

/* Q4 */
SELECT FirstName, LastName, Title from Employee WHERE Title LIKE "%Sales%";

/* Q5 */
SELECT Track.Name AS "TrackName", Genre.Name AS "GenreName" from Track JOIN Genre
ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = "Easy Listening";

/* Q6 */
SELECT Album.Title, Track.Name, Track.GenreId FROM Album
JOIN Track ON Album.AlbumId = Track.AlbumId

/* Q7 */
SELECT BillingCountry, AVG(Total) FROM Invoice
GROUP BY BillingCountry;

/* Q8 */
SELECT BillingCountry, AVG(Total) FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 100;

/* Q9 */
SELECT Invoice.CustomerId, AVG(Invoice.Total), SUM(Invoice.Total), Customer.Country
FROM Invoice
JOIN Customer
ON Invoice.CustomerId = Customer.CustomerId
WHERE Customer.Country = "Germany"
GROUP BY Invoice.CustomerId, Customer.Country
HAVING SUM(Invoice.Total) > 10;

/* Q10 */
SELECT Album.AlbumId, Album.Title, AVG(Track.Milliseconds)
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
JOIN Album ON Track.AlbumId = Album.AlbumId
WHERE Genre.Name = 'Jazz'
GROUP BY Album.AlbumId, Album.Title;