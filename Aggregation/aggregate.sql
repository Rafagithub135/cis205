SELECT
    average_buy_price
FROM
    products;
GROUP BY productLine
ORDER BY productLine;

SELECT
    COUNT(*) AS total
FROM products;

SELECT productLine, COUNT(*)
FROM products;

SELECT productCode

FROM orderDetails
GROUP BY productCode
ORDER By total DESC;