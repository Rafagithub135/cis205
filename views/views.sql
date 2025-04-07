-- CREATES A VIEW
CREATE VIEW customerPayments
AS
    SELECT
    customerName,
    checkNumber,
    paymentDate,
    amount
FROM
    customers
INNER JOIN
            payments USING (customerNumber);

-- CALLS THE VIEW
SELECT * FROM customerPayments;