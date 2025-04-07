USE dealership;

DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS customers;

CREATE TABLE locations
(
    locID       VARCHAR(10) PRIMARY KEY NOT NULL,
    locAddress  VARCHAR(255) NOT NULL
);