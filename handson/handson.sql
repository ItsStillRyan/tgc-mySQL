https://www.mysqltutorial.org/tryit/
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
-- 7
SELECT count(*),offices.state FROM offices
JOIN employees
ON offices.officeCode = employees.officeCode
WHERE offices.country = "USA"
GROUP BY state
-- 8
SELECT customers.customerName, customers.customerNumber, avg(amount) FROM payments
JOIN customers
on payments.customerNumber = customers.customerNumber
GROUP BY customers.customerName, customers.customerNumber
-- 9
SELECT customers.customerName, avg(amount) FROM payments
JOIN customers
on payments.customerNumber = customers.customerNumber
GROUP BY customers.customerName
HAVING avg(amount) > 10000
-- 10
SELECT count(*) AS count, productCode 
FROM orderdetails
GROUP BY productCode
ORDER BY count(*) desc
LIMIT 10
-- 11
SELECT * FROM orders
WHERE YEAR(orderDate) = 2003
-- 12
SELECT MONTH(orderDate) as Months, count(orderNumber) FROM orders
WHERE YEAR(orderDate) = 2003
GROUP BY MONTH(orderDate)

_____________________---
-- date --
-- make sure date format is yyyy-mm-dd
from orders where YEAR(orderdate) ==> specific date    
                  MONTH(orderdate)
                  DAY(orderdate)


NOW() => show current machine time
CURDATE() => show current date

-- aggregate => summarize a whole table in 1 value 

-- count how many entry
count(*) 

-- sum of all
sum()

--average
avg()

-- find highest of the list
max()

-- find the lowest of the list
min()

-- removing duplicates
distinct()

--group by
--DO GROUP BY LOGIC FIRST
--THEN DO SELECT 
--start with 
SELECT * FROM employees
--then do group by log next
Select * FROM employees
GROUP BY officeCode
--then the condition next
SELECT count(*), officeCode FROM  employees
GROUP BY officeCode

--RENAME COL with
AS "_______"

--filter the group
HAVING

