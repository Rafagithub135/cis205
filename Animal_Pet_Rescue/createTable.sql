DROP DATABASE IF EXISTS animal_pet_rescue;
CREATE DATABASE animal_pet_rescue;
USE animal_pet_rescue;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS donor;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS vehicle;
DROP TABLE IF EXISTS pickup;
DROP TABLE IF EXISTS dropoff;
DROP TABLE IF EXISTS rescuer;
DROP TABLE IF EXISTS location;

CREATE TABLE employees
(
    empNum  VARCHAR(10) NOT NULL PRIMARY KEY,
    empName VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone   CHAR(10),
    email   VARCHAR(255),

    CONSTRAINT empNum_PK PRIMARY KEY (empNum)
);

CREATE TABLE donor
(
    donID VARCHAR(10) NOT NULL PRIMARY KEY,
    donName VARCHAR(255) NOT NULL ,
    donAddress VARCHAR(255) NOT NULL,
    donPhone CHAR(10),
    donEmail VARCHAR(255),

    CONSTRAINT donID_PK PRIMARY KEY (donID)
);

CREATE TABLE pet
(
    petID VARCHAR(10) NOT NULL PRIMARY KEY,
    petName VARCHAR(255) NOT NULL,
    petSpecies VARCHAR(30) NOT NULL,
    petDob DATE,
    petBreed VARCHAR(30) NOT NULL,
    donID_FK VARCHAR(10) NOT NULL,

    CONSTRAINT petID_PK PRIMARY KEY (petID),
    CONSTRAINT donID_FK1 FOREIGN KEY (donID_FK)
    REFERENCES donor(donID)
);

CREATE TABLE vehicle
(
    vin VARCHAR(45) NOT NULL PRIMARY KEY,
    vehMake VARCHAR(30) NOT NULL,
    vehModel    VARCHAR(30) NOT NULL,
    vehType     VARCHAR(30) NOT NULL,

    CONSTRAINT vin_PK PRIMARY KEY (vin)
);

CREATE TABLE pickup
(
    dateTime    VARCHAR(20) NOT NULL PRIMARY KEY,
    vin_FK      VARCHAR(45) NOT NULL,
    empNum_FK   VARCHAR(10) NOT NULL,
    pid_FK      VARCHAR(10) NOT NULL,

    CONSTRAINT dateTime_PK PRIMARY KEY (dateTime),
    CONSTRAINT vin_FK1 FOREIGN KEY (vin_FK)
    REFERENCES vehicle(vin),
    CONSTRAINT empNum_FK2 FOREIGN KEY (empNum_FK)
    REFERENCES employees(empNum),
    CONSTRAINT pid_FK3 FOREIGN KEY (pid_FK)
    REFERENCES pet(petID)
);

CREATE TABLE dropoff
(
    dateTimeD   VARCHAR(20) NOT NULL PRIMARY KEY,
    empNum_FK   VARCHAR(10) NOT NULL,
    pid_FK      VARCHAR(10) NOT NULL,

    CONSTRAINT dateTime_PK PRIMARY KEY (dateTimeD),
    CONSTRAINT empNum_FK1 FOREIGN KEY (empNum_FK)
    REFERENCES employees(empNum),
    CONSTRAINT pid_FK2 FOREIGN KEY (pid_FK)
    REFERENCES pet(petID)
);

CREATE TABLE rescuer
(
    resID VARCHAR(15) NOT NULL PRIMARY KEY,
    resName VARCHAR(255) NOT NULL,
    resAddress VARCHAR(255) NOT NULL,
    resPhone CHAR(10),
    resEmail VARCHAR(255) NOT NULL,

    CONSTRAINT resID_PK PRIMARY KEY (resID)
);
CREATE TABLE location
(
    locID VARCHAR(15) NOT NULL PRIMARY KEY,
    locName VARCHAR(15) NOT NULL,
    locNum VARCHAR(10) NOT NULL,
    locPhone CHAR(10) NOT NULL,
    locContact VARCHAR(255) NOT NULL,
    locEmail VARCHAR(255) NOT NULL,

    CONSTRAINT locID_PK PRIMARY KEY (locID)
);