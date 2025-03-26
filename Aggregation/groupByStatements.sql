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

# * - This statement get all of the items in the orders table, selects the year by orderDate and displays it under a heading of "year", adds the total sales by multiplying the quantity ordered  by the price and then adding all of the products under the heading "total", only displays the amounts if the status is "Shipped", groups all of the totals by the year, but only if the year is after 2003.

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

# * - This statement gets all of the items in the orders table, selects the year from the order date and displays it under a heading of "year", each item's status and gets the total sales as described above under a heading of "total".  It displays the items grouped by year and then by status and puts the items in the order of year from earliest year to the latest year.

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

# This statement gets all of the items from the orders table.  It then displays the items in a column with a heading of "year" and another column with the count of the orders.  Then it groups the items by year.

SELECT
    YEAR(orderDate) AS year,
    COUNT(orderNumber)
FROM
    orders
GROUP BY
    year;

# This statement gets the items from the customers table, then selects the states that each customer is in and displays the states of all of the customers.

SELECT
    state
FROM
    customers
GROUP BY
    state;


