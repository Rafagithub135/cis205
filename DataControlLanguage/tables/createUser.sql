-- To create a user use below line.
CREATE USER ralph@localhost
       -- The identified by line is the user's password.
       IDENTIFIED BY '12345';

-- Use command prompt for adding users.

-- SELECT user FROM mysql.user; will show you all of the current users.
-- To grant access to users, log in as administrator and use GRANT Statement.
       GRANT all privleges on bobdb.* to bob@localhost;
-- GRANT all privleges on *.* to user@localhost gives all privleges to all databases to that particular user.
-- mysql -u bob -p to log in as bob

GRANT SELECT ON *.* TO bob@localhost;
GRANT INSERT ON classicmodels.* TO bob@localhost;
GRANT DELETE ON classicmodels.* TO bob@localhost;
GRANT SELECT (employeeeNumber, lastName, firstName, email),
             UPDATE(lastName)
             ON employees
             TO bob@localhost;
GRANT EXECUTE ON PROCEDURE CheckCredit TO bob@localhost;
GRANT PROXY ON root TO allice@localhost;
CREATE USER super@localhost
       IDENTIFIED BY '12345';
SHOW GRANTS FOR super@localhost;
GRANT ALL ON classicmodels.* TO super@localhost;


CREATE USER rfc@localhost
       IDENTIFIED BY '12345';
GRANT SELECT, UPDATE, INSERT
      ON classicmodels.*
      TO rfc@localhost;
SHOW GRANTS FOR rfc@localhost;
REVOKE INSERT, UPDATE
        ON classicmodels.*
        FROM rfc@localhost;
SHOW GRANTS FOR rfc@localhost;
GRANT EXECUTE
        ON classicmodels.*
        TO rfc@lockahost;
REVOKE ALL, GRANT OPTION
        FROM rfc@localhost;
SHOW GRANTS FOR rfc@localhost;
GRANT PROXY
ON root
TO rfc@localhost;
SHOW GRANTS FOR rfc@localhost;
REVOKE PROXY
ON root
FROM rfc@localhost;
SHOW GRANTS FOR rfc@localhost;