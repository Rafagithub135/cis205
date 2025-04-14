-- STORED PROCEEDURES AND TRIGGERS

-- INCLUDE DELIMITER $$ COMMAND IN CODE.  This removes the ; as the end of statement.

DELIMITER $$

ENTER PROCEEDURE NAME
BEGIN
    ENTER STATEMENTS
END $$

--     The next line turns the ; back on.
DELIMITER ;

-- The following line calls the proceedure.
CALL GetCustomers();


