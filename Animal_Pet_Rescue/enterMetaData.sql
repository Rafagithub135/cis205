DROP DATABASE IF EXISTS animal_pet_rescue;
CREATE DATABASE animal_pet_rescue;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS donor;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS driver;

CREATE TABLE employees
(
    empNum  VARCHAR(10),
    empName VARCHAR(255),
    address VARCHAR(255),
    phone   CHAR(10),
    email   VARCHAR(255)
);

CREATE TABLE donor
(
    donID   VARCHAR(10),
    donName VARCHAR(255),
    donAddress  VARCHAR(255)
);

CREATE TABLE animal
(
    animalID    VARCHAR(10),
    animalName  VARCHAR(255),
    animalSpecies   VARCHAR(255)
);

CREATE TABLE driver
(
    driverNum   VARCHAR(10),
    driverName  VARCHAR(255),
    driverMake  VARCHAR(255)
);

INSERT INTO employees (empName, address, phone, email, empNum)
    VALUES
        ('John Smith', '1325 South 8th Street', '6102358579', 'johnsmith@gmail.com', 'C100'
        ),
        ('Joe Malarkey', '728 West Mifflin Street', '2678247564', 'joemalarkey@gmail.com', 'C101');

INSERT INTO donor (donID, donName, donAddress)
    VALUES
    ('D100', 'Janet Smith', '1823 Orchard Avenue'),
    ('D101' 'Sam Smucker', '673, Pine Street'),
    ('D102', 'John Widener', '18732 West 23rd Street')