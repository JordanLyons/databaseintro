CREATE VIEW ClassOrders AS
SELECT Customers.Companyname
, Orders.OrderID
, Products.ProductName
, Order_Details.Quantity
, Order_Details.UnitPrice * Order_Details.Quantity AS ExtendedPrice
, Orders.OrderDate
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID
INNER JOIN Products
ON Products.ProductID = Order_Details.ProductID
INNER JOIN Categories
ON Categories.CategoryID = Products.CategoryID
--WHERE EXTRACT(YEAR FROM Orders.OrderDate) = 1996
ORDER BY ExtendedPrice DESC
