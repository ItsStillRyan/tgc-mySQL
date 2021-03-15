-- 1
SELECT city,phone,country FROM offices;
-- 2
SELECT * FROM orders where comments like "%FedEx%"
-- 3
SELECT orders.*,
         customers.customerName,
         customers.contactFirstName,
         customers.contactLastName
FROM orders
JOIN customers
WHERE orders.customerNumber = 124
-- 4
SELECT contactFirstName, contactLastName
FROM customers 
ORDER BY customerName
DESC
-- 5
SELECT *
FROM employees
WHERE officeCode IN (1,2,3)
        AND jobTitle = "Sales Rep"
        AND (firstName LIKE "%son%"
        OR lastName LIKE "%son%")
-- 6
SELECT orderdetails.orderNumber,products.productCode,products.productName 
FROM orderdetails
JOIN products
ON orderdetails.productCode = products.productCode