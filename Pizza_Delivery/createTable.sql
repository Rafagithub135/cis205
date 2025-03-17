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
    orderNum        VARCHAR(25),
    orderDate       DATE,
    orderTime       TIME,
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
    itemNum         INTEGER auto_increment,
    orderNum_FK     VARCHAR(25),

    CONSTRAINT item_PK  PRIMARY KEY (itemNum),
    CONSTRAINT item_FK1 FOREIGN KEY (orderNum_FK)
    REFERENCES orders(orderNum)
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