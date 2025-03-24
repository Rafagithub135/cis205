USE pizzaDelivery;

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