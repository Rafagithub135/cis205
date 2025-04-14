-- Ralph McCloskey
-- Views Project
-- Created:  4/7/2025
-- Fall 2025

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