-- 1. List all customers
SELECT * FROM Customers;

-- 2. Find all orders placed in January 2023
SELECT * FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-01-31';

-- 3. Get the details of each order, including the customer name and email
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName, Customers.Email
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 4. List the products purchased in a specific order (e.g., OrderID = 1)
SELECT Products.ProductName, OrderItems.Quantity
FROM OrderItems
JOIN Products ON OrderItems.ProductID = Products.ProductID
WHERE OrderItems.OrderID = 1;

-- 5. Calculate the total amount spent by each customer
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(Products.Price * OrderItems.Quantity) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
JOIN Products ON OrderItems.ProductID = Products.ProductID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

-- 6. Find the most popular product (the one that has been ordered the most)
SELECT Products.ProductName, SUM(OrderItems.Quantity) AS TotalOrdered
FROM Products
JOIN OrderItems ON Products.ProductID = OrderItems.ProductID
GROUP BY Products.ProductName
ORDER BY TotalOrdered DESC
LIMIT 1;

-- 7. Get the total number of orders and the total sales amount for each month in 2023
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month, 
    COUNT(DISTINCT Orders.OrderID) AS TotalOrders,
    SUM(Products.Price * OrderItems.Quantity) AS TotalSales
FROM Orders
JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
JOIN Products ON OrderItems.ProductID = Products.ProductID
WHERE YEAR(OrderDate) = 2023
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m');

-- 8. Find customers who have spent more than $1000
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(Products.Price * OrderItems.Quantity) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
JOIN Products ON OrderItems.ProductID = Products.ProductID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
HAVING TotalSpent > 1000;
