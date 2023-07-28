/* Retrieve specific columns from the "Customers" table:*/
SELECT CustomerId, FirstName, LastName, City, Country FROM Customers;

/* Count the number of enrolled customers from the "Customers" table:*/
SELECT COUNT(*) AS CustomerUSA FROM Customers 
WHERE Country != 'United States';

/* Calculate the average total amount of orders from the "Orders" table*/
SELECT AVG(Total) AS AvgOrderTotal FROM Orders;

/* Retrieve orders placed in the last 7 days from the "Orders" table:*/
SELECT * FROM Orders WHERE Date >= DATEADD(DAY, -7, GETDATE());

/*Join the "Customers" and "Orders" tables to get customer information along with their orders*/
SELECT Cust.CustomerId, Cust.FirstName, Cust.LastName, Ord.OrderId, Ord.ItemName, Ord.Total
FROM Customers AS Cust
JOIN Orders AS Ord ON Cust.CustomerId = CustomerId;

/*Show total revenue for each customer: Should be the Same*/
SELECT Cust.CustomerId, Cust.FirstName, Cust.LastName, SUM(Ord.Total) AS TotalRevenue
FROM Customers AS Cust
INNER JOIN Orders AS Ord ON Cust.CustomerId = CustomerId
GROUP BY Cust.CustomerId, Cust.FirstName, Cust.LastName;

/*Add Revenue per product total purchse amount: Should be the Same per Customer*/
SELECT Cust.CustomerId, Cust.FirstName, Cust.LastName, Ord.ItemName, SUM(Ord.Total) AS TotalRevenue
FROM Customers AS Cust
INNER JOIN Orders AS Ord ON Cust.CustomerId = CustomerId
GROUP BY Cust.CustomerId, Cust.FirstName, Cust.LastName, Ord.ItemName;

/*Customer who have placed orders for Hammers=Expect Everyone*/
SELECT DISTINCT cust.CustomerId, cust.FirstName, cust.LastName
FROM Customers AS cust
JOIN Orders AS ord ON cust.CustomerId = CustomerId
WHERE ord.ItemName = 'Hammer' OR ord.ItemName = 'Drill';









