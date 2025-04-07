# - The following statement collects all items from the orderDetails table, selects the ordernumber, sums the quantityOrdered and the product of the priceeach times the quantityOrdered.  It then displays the orderNumber under a heading of "ordernumber", adds the total number of items ordered and displays that number under a heading of "itemsCount" and adds all of the products up and displays them under the heading "total".  The displays are then grouped by the ordernumber.

SELECT
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach * quantityOrdered) AS total
FROM
    orderdetails
GROUP BY
    ordernumber;


# - This statement collects all items from the orderdetails table, selects the ordernumber, adds the quantityOrderd totals together and also adds the product of the priceEach with the quantityOrdered items.  It then displays the ordernumber with the heading "ordernumber", the quantityOrdered items under the heading "itemsCount" and the sum of the price products under the heading "total".  The list is then grouped by the ordernumber as long as the total is greater than 1000.

SELECT
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach * quantityOrdered) AS total
FROM
    orderdetails
GROUP BY
    ordernumber
HAVING
    total > 1000;