-- CREATES A TEMPORARY TABLE
CREATE TEMPORARY TABLE credits
(
    customerNumber INT PRIMARY KEY,
    creditLimit DEC(10, 2)
);

INSERT INTO credits(customerNumber, creditLimit)
SELECT
    customerNumber,
    creditLimit
FROM
    customers
WHERE
    creditLimit > 0;


CREATE TEMPORARY TABLE top_customers
(
    SELECT p.customerNumber, c
    .
    customerName,
    ROUND(SUM(p.amount),2) sales
FROM payments p
INNER JOIN customers c
ON c.customerNumber = p.customerNumber
GROUP BY p.customerNumber
ORDER BY sales DESC
LIMIT 10;
);

DROP TEMPORARY TABLE top_customers;