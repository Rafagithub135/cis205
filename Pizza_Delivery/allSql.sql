DROP DATABASE IF EXISTS pizzaDelivery;
CREATE DATABASE pizzaDelivery;
USE pizzaDelivery;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS deliveryPerson;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS pizza;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS topping;
DROP TABLE IF EXISTS toppings;

CREATE TABLE employees
(
    empNum    VARCHAR(10),
    empName   VARCHAR(30),

    CONSTRAINT empnum_PK PRIMARY KEY (empnum)
);

CREATE TABLE customer
(
    custFName   VARCHAR(30),
    custLName   VARCHAR(50),
    custPhone   CHAR(10),

    CONSTRAINT custPhone_PK PRIMARY KEY (custPhone)
);

CREATE TABLE deliveryPerson
(
    delPhone    CHAR(10),
    delmodel    VARCHAR(30),
    delName     VARCHAR(30),

    CONSTRAINT delPhone_PK PRIMARY KEY (delPhone)
);

CREATE TABLE orders
(
    orderNum       VARCHAR(25),
    orderDate      DATE,
    orderTime      TIME,
    empNum_FK      VARCHAR(10),
    delPhone_FK    CHAR(10),
    custPhone_FK   CHAR(10),

    CONSTRAINT orderNum_PK PRIMARY KEY (orderNum),
    CONSTRAINT empNum_FK1 FOREIGN KEY (empNum_FK)
        REFERENCES employees(empNum),
    CONSTRAINT delPhone_FK2 FOREIGN KEY (delPhone_FK)
        REFERENCES deliveryPerson(delPhone),
    CONSTRAINT custPhone_FK3 FOREIGN KEY (custPhone_FK)
        REFERENCES customer(custPhone)
);

CREATE TABLE pizza
(
    pSize   VARCHAR(10),
    pPrice  DOUBLE,

    CONSTRAINT pizza_PK PRIMARY KEY (pSize)
);

CREATE TABLE item
(
    itemNum     INTEGER auto_increment,
    orderNum_FK VARCHAR(25),
    pSize_FK    VARCHAR(10),

    CONSTRAINT itemNum_PK PRIMARY KEY (itemNum),
    CONSTRAINT orderNum_FK1 FOREIGN KEY (orderNum_FK)
        REFERENCES orders (orderNum),
    CONSTRAINT pSize_FK2 FOREIGN KEY (pSize_FK)
        REFERENCES pizza (pSize)
);

CREATE TABLE topping
(
    tName     VARCHAR(30),
    tPrice    DOUBLE,

    CONSTRAINT topping PRIMARY KEY (tName)
);

CREATE TABLE toppings
(
    tName_FK   VARCHAR(30),
    itemNum_FK INTEGER,

    CONSTRAINT toppings_FK PRIMARY KEY (tName_FK, itemNum_FK),
    CONSTRAINT toppings_FK1 FOREIGN KEY (tName_FK)
        REFERENCES topping(tName),
    CONSTRAINT toppings_FK2 FOREIGN KEY (itemNum_FK)
        REFERENCES item(itemNum)
);

INSERT INTO employees (empNum, empName)
VALUES
    ('T100', 'Greg House'),
    ('T101', 'George Grey'),
    ('T102', 'B. J. Honeycutt'),
    ('T103', 'Sherman Potter'),
    ('T104', 'Frank Burns');

INSERT INTO customer (custFName, custLName, custPhone)
VALUES
    ('David', 'Wendt', 7137552311),
    ('Sam', 'Smucker', 7178991234);

INSERT INTO deliveryPerson (delPhone, delModel, delName)
VALUES
    (2158348599, 'Escort', 'Fred Sanford'),
    (2157354677, 'Ranger','Roger Rabbit'),
    (123456789, 'Escalade','George Winston');

-- On the many side, values must have values for foreign keys in one table.  If orderNum is set for auto increment, leave data blank when entering.
INSERT INTO orders (orderNum, orderDate, orderTime, empNum_FK, delPhone_FK, custPhone_FK)
VALUES
    ('01', 20250115, 1600, 'T100', 2158348599, 7137552311),
    ('02', 20250117, 1035, 'T101', 2158348599, 7178991234);

INSERT INTO pizza (pSize, pPrice)
VALUES
    ('Small', 4.99),
    ('Medium', 8.99),
    ('Large', 12.99),
    ('X-Large', 15.99);

INSERT INTO item (orderNum_FK, pSize_FK)
VALUES
    ('01', 'Small'),
    ('02', 'X-Large');