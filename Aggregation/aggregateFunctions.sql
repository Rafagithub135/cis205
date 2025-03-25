-- This is the average function.  It returns the average price of all of the products in the products table.

SELECT
    AVG(buyPrice) average_buy_price
FROM
    products;

-- This average function was included in class but is not in the video.  This statement returns the average price of all of the products in the product line table and then groups them by product line and puts them in order by product line.

# SELECT
#     productLine,
#     AVG(buyPrice)
# FROM
#     products
# GROUP BY productLine
# ORDER BY productLine;

-- This is the count function.  It returns the total number of products in the products table.

SELECT
    COUNT(*) AS total
FROM
    products;

-- This count function was included in class but is not in the video.  This statement also returns the total number of products but it groups them by product line and puts them in order by product line.

# SELECT
#     productLine,
#     COUNT(*)
# FROM
#     products
# GROUP BY productLine
# ORDER BY productLine;

-- This sum function was included in class but is not in the video.  This statement returns the total price of all the items that were ordered in the database and then groups them by product line and then puts them in order by the total in order from highest to lowest.  Additionally, the total amount is calculated by multiplying the price of each item by the quantity of each item ordered.

# SELECT
#     productCode,
#     SUM(priceEach * quantityOrdered) total
# FROM
#     orderDetails
# GROUP BY productCode
# ORDER BY total DESC;

-- This max function determines the highest price of all the products in the products table and returns only the highest priced item.

SELECT
    MAX(buyPrice) highest_price
FROM
    products;

-- This fuction finds the highest price item in the products table and then groups them by product line and puts them in order by the highest price in descending order.

# SELECT
#     productLine, MAX(buyPrice)
# FROM
#     products
# GROUP BY productLine
# ORDER BY MAX(buyPrice) DESC;

-- This function finds the lowest price item in the products table and returns only the lowest priced item.

SELECT
    MIN(buyPrice) lowest_price
FROM
    products;

-- This function finds the lowest price items in the products table and then groups them by product line and puts them in order by the lowest price product to the product with the highest "lowest price".

# SELECT
#     productLine,
#     MIN(buyPrice)
# FROM
#     products
# GROUP BY productLine
# ORDER BY MIN(buyPrice);

-- This function adds the total price of all the items in the products table and returns the total price of all the items.

SELECT
    SUM(buyPrice) total
FROM
    products;