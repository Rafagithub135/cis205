# This statement selects the items in the orders table and groups all of the items by their status.

SELECT
    status
FROM
    orders
GROUP BY
    status;

# This statement gets all of the items in the orders table and counts all of them. Then it displays them in groups of their status with the count.

SELECT
    status,
    COUNT(*)
FROM
    orders
GROUP BY
    status;

# * - This statement gets the items from the orders table, gets their status, multiplies the quantity ordered by the price and then displays them in groups of their status.

SELECT
    status,
    SUM(quantityOrdered * priceEach) AS amount
FROM
    orders
        INNER JOIN orderdetails USING (orderNumber)
GROUP BY
    status;

# This statement gets all of the items in the orderdetails table, gets the order number and multiplies the quantity ordered by the price.  Then it displays all of the items grouped by the order number.

SELECT
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY
    orderNumber;

# * - This statement gets all items from the orders table, displays the year under a heading of "year" and the price multiplied by the quantity ordered under the heading of "total".  The items are only listed if the status is "Shipped" and they are grouped by the year of the order date.

SELECT
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
        INNER JOIN orderdetails USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY
    YEAR(orderDate);


SELECT
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
        INNER JOIN orderdetails USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY
    year
HAVING
    year > 2003;


SELECT
    YEAR(orderDate) AS year,
    status,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
        INNER JOIN orderdetails USING (orderNumber)
GROUP BY
    year,
    status
ORDER BY
    year;


SELECT
    YEAR(orderDate) AS year,
    COUNT(orderNumber)
FROM
    orders
GROUP BY
    year;


SELECT
    state
FROM
    customers
GROUP BY
    state;


