--Drop Tables(for debugging)
DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Ordered_items;
DROP TABLE Employees;
DROP TABLE Shifts;
DROP TABLE Deliveries;
DROP TABLE Menu_item;
DROP TABLE Recipes;
DROP TABLE Ingredients;
--DELETE Information in tables(For degugging)
DELETE FROM Customers;
DELETE FROM Orders;
DELETE FROM Ordered_items;
DELETE FROM Employees;
DELETE FROM Shifts;
DELETE FROM Deliveries;
DELETE FROM Menu_item;
DELETE FROM Recipes;
DELETE FROM Ingredients;


--Table creations
CREATE TABLE Customers(
    cust_id unsigned int PRIMARY KEY,
    c_name  VARCHAR(50),
    c_address VARCHAR(75),
    c_phone CHAR(10)

);

CREATE TABLE Orders(
    order_id unsigned int PRIMARY KEY,
    cust_id unsigned int,
    delivery_time TIME,
    delivery_date DATE

);

CREATE TABLE Ordered_items(
    order_id unsigned int,
    item_id unsigned int
);

CREATE TABLE Employees(
    emp_id unsigned int PRIMARY KEY,
    e_name VARCHAR(50),
    hourly_wage DECIMAL(4,2),
    e_phone CHAR(10)
);

CREATE TABLE Shifts(
    shift_id unisgned int PRIMARY KEY,
    emp_id unsigned int,
    start_time TIME,
    s_date DATE,
    end_time TIME
);

CREATE TABLE Deliveries(
    order_id unsigned int,
    emp_id unsigned int
);

CREATE TABLE Menu_item(
    item_id unsigned int PRIMARY KEY,
    description VARCHAR(50),
    price DECIMAL(5,2)
);

CREATE TABLE Recipes(
    ingredient_id unsigned int,
    item_id unsigned int
);

CREATE TABLE Ingredients(
    ingredient_id unsigned int PRIMARY KEY,
    ing_info VARCHAR(50),
    cost DECIMAL(5,2)
);

--Populate tables

--Populate Customers table
INSERT INTO Customers(cust_id, c_name, c_address, c_phone) VALUES 
(1, 'Bob Rider', '1234 1st street',5556621920),
(2, 'Ethan Klein', '11688 Moraga Ln',5558989020),
(3, 'Hila Klein', '11688 Moraga Ln',5557373454),
(4, 'Dan Swerdlove', '4545 hollywood blvd', 5556890678),
(5, 'Zac Louis', '6666 yolo st',5553214521),
(6, 'AB Ayad', '2300 flocka way',5554678989),
(7,'Oliva wild','4343 rodgers st',5551112222),
(8,'Sam temple','5000 bus rd',5559095687),
(9,'Lena Ayad','2300 flocka way',5556748211),
(10,'Ian 905','5000 bus rd',5557748954),
(11,'Maiah Pardo','2303 poop way',5556892111),
(12,'Papa John','3214 rodeo dr',5553212456),
(13,'Whiteclaw Gabe','2578 friday ave',5556662020),
(14,'Joe Biden','4095 Delaware ave',5557600986),
(15,'Eddy Acosta','6983 olivehurst way',5550231476),
(16,'Julien Solomita','1134 Stanford St',5553681010),
(17,'Diego Vasquez','8709 hacker way',5557773521),
(18,'Brittney Rodriguez','1332 dunite dr',5553328908),
(19,'Norman Bates','5590 thureson way',6675432124),
(20,'Todd Yates','7383 S. Race Court',7723567891),
(21,'Magnus Midtbo','9910 Prospect Ave',8046411817),
(22,'Adam Ondra','550 Sherwood Street',2259163445),
(23,'Perry Frank','7875 Oak Valley Drive',4322249626),
(24,'Chainsfr Robinson','1 Delaware Drive',6073268738),
(25,'Ninye Son','7137 Nicolls St.',6196409840),
(26,'Kelly Davis','354 Constitution Street',9074206589),
(27,'Christopher Young','2 Leeton Ridge Court',4126506236),
(28,'Colleen Ramirez','8484 N. Court Rd.',2484985855),
(29,'Joseph Carrillo','137 Goldfield Street',5093808964),
(30,'Jesus Ramirez','8709 Princeton Ave.',2259160168),
(31,'Allison Simmons','568 Rockwell St.',4322245853),
(32,'Yan Lee','9935 San Pablo Dr.',8322595337),
(33,'Patricia Ramirez','99 Corona Rd.',6073263813),
(34,'Victoria Sloan','245 Pin Oak Lane',2569235222),
(35,'Ryan Shepard','956 Trusel Drive',9563328916),
(36,'Taylor Carlson','9447 Center Ave.',2174507788),
(37,'Leslie Erickson','42 Old John Ave.',6028026456),
(38,'Brenda Crosby','990 Cherry Hill Dr.',7162042910),
(39,'Joshua Hurst','962 East Joy Ridge Rd.',9254379622),
(40,'Daniel Graham','9875 Columbia Ave.',9169361215),
(41,'Allen Arnold','874 Gartner Street',9255135782),
(42,'Michael Ruiz','279 Greenview St.',6176819636),
(43,'Thomas Graves','943 South Henry Ave.',7625245377),
(44,'Amanda Matthews','159 W. Beacon Street',6202663159),
(45,'Stacey Nichols','9075 Sage Ave.',2014185995),
(46,'Jennifer Olson','151 Bradford Street',3018380266),
(47,'Courtney Mosley','356 gross way',7166902840),
(48,'Bob Marley','4789 papa bless st',4231891234),
(49,'Jack White','1425 detriot ave',5678765335),
(50,'Meg White','666 make ave',9920921235);

--Populate Orders table
INSERT INTO Orders(order_id, cust_id,delivery_time, delivery_date) VALUES 
(1000, 50,'5:30','2022-10-01'),
(1001, 49,'5:30','2022-10-01'),
(1002, 48,'6:00','2022-10-01'),
(1003, 47,'6:00','2022-10-01'),
(1004, 46,'6:30','2022-10-01'),
(1005, 45,'6:30','2022-10-01'),
(1006,44,'7:00','2022-10-01'),
(1007,43,'7:00','2022-10-01'),
(1008,42,'7:30','2022-10-01'),
(1009,41,'7:30','2022-10-01'),
(1010,40,'8:00','2022-10-01'),
(1011,39,'8:00','2022-10-01'),
(1012,38,'9:00','2022-10-01'),
(1013,37,'9:30','2022-10-01'),
(1014,36,'9:30','2022-10-01'),
(1015,35,'5:30','2022-10-02'),
(1016,34,'5:30','2022-10-02'),
(1017,33,'6:00','2022-10-02'),
(1018,32,'6:00','2022-10-02'),
(1019,31,'6:30','2022-10-02'),
(1020,30,'7:00','2022-10-02'),
(1021,29,'7:30','2022-10-03'),
(1022,28,'8:00','2022-10-03'),
(1023,27,'8:30','2022-10-03'),
(1024,26,'9:00','2022-10-03'),
(1025,25,'10:00','2022-10-03'),
(1026,24,'5:30','2022-10-05'),
(1027,23,'6:00','2022-10-05'),
(1028,22,'6:30','2022-10-05'),
(1029,21,'7:00','2022-10-05'),
(1030,20,'7:30','2022-10-05'),
(1031,19,'8:00','2022-10-05'),
(1032,18,'8:30','2022-10-05'),
(1033,17,'5:30','2022-10-31'),
(1034,16,'6:30','2022-10-31'),
(1035,15,'6:30','2022-10-31'),
(1036,14,'7:00','2022-10-31'),
(1037,13,'7:30','2022-10-31'),
(1038,12,'8:00','2022-10-31'),
(1039,11,'8:30','2022-10-31'),
(1040,10,'9:00','2022-10-31'),
(1041,9,'9:30','2022-10-31'),
(1042,8,'9:00','2022-10-31'),
(1043,7,'9:30','2022-10-31'),
(1044,6,'9:30','2022-10-31'),
(1045,5,'8:00','2022-10-31'),
(1046,4,'7:00','2022-10-31'),
(1047,3,'6:00','2022-10-31'),
(1048,2,'6:30','2022-10-31'),
(1049,1,'7:30','2022-10-31');

--Populate Ordered_items

INSERT INTO Ordered_items(order_id,item_id) VALUES
(1000,2000),
(1000,2001),
(1001,2002),
(1002,2002),
(1002,2003),
(1002,2004),
(1003,2005),
(1004,2005),
(1005,2006),
(1005,2007),
(1006,2000),
(1007,2001),
(1007,2002),
(1008,2003),
(1009,2005),
(1009,2006),
(1010,2001),
(1010,2002),
(1011,2003),
(1011,2004),
(1012,2005),
(1012,2006),
(1013,2007),
(1013,2005),
(1014,2002),
(1014,2003),
(1015,2001),
(1015,2002),
(1016,2000),
(1017,2003),
(1018,2004),
(1019,2005),
(1019,2006),
(1020,2007),
(1021,2000),
(1022,2002),
(1023,2003),
(1024,2000),
(1025,2002),
(1026,2003),
(1026,2000),
(1026,2005),
(1027,2002),
(1028,2003),
(1029,2006),
(1029,2007),
(1030,2007),
(1031,2006),
(1031,2002),
(1032,2000),
(1032,2001),
(1033,2004),
(1034,2005),
(1035,2002),
(1035,2003),
(1036,2000),
(1037,2002),
(1038,2003),
(1039,2004),
(1040,2005),
(1041,2006),
(1041,2005),
(1042,2000),
(1042,2005),
(1043,2006),
(1043,2002),
(1044,2000),
(1044,2001),
(1045,2002),
(1046,2000),
(1047,2001),
(1047,2005),
(1048,2001),
(1048,2003),
(1049,2005);

--Populate Employees table
INSERT INTO Employees(emp_id, e_name, hourly_wage, e_phone) VALUES 
(1,'Bob Burquest',15.00,4085557272),
(2,'Sandy Cheeks',20.00,5554082233),
(3,'Spongebob Squarepants',15.00,4443332222),
(4,'Squidward Tentacles',15.00,5678889999),
(5,'Eugene Krabs',15.00,2334556788),
(6,'Larry the lobster',15.00,9965004321),
(7,'Pearl Krabs',15.00,8986753241),
(8,'Mary Lozano',15.00,7572234444),
(9,'Britt Rodriguez',15.00,2456678921),
(10,'Marcos Rodriguez',15.00,5556673211);



--Populate Shifts

--INSERT or IGNORE into Shifts(emp_id, start_time, s_date, end_time) VALUES

INSERT INTO Shifts(shift_id,emp_id, start_time, s_date, end_time) VALUES
(1,1,'5:00','2022-10-01','9:00'),
(2,2,'6:00','2022-10-01','10:00'),
(3,3,'7:00','2022-10-01','10:00'),
(4,4,'5:00','2022-10-01','10:00'),
(5,5,'5:00','2022-10-02','10:00'),
(6,6,'5:30','2022-10-02','10:00'),
(7,7,'6:00','2022-10-02','10:00'),
(8,8,'6:30','2022-10-02','10:00'),
(9,9,'5:00','2022-10-03','9:00'),
(10,10,'5:30','2022-10-03','10:00'),
(11,2,'6:00','2022-10-03','10:00'),
(12,4,'6:30','2022-10-03','10:00'),
(13,3,'5:00','2022-10-05','9:00'),
(14,5,'5:30','2022-10-05','10:00'),
(15,7,'6:00','2022-10-05','10:00'),
(16,9,'6:30','2022-10-05','10:00'),
(17,10,'6:30','2022-10-05','10:00'),
(18,3,'5:00','2022-10-31','10:00'),
(19,4,'5:00','2022-10-31','10:00'),
(20,6,'5:30','2022-10-31','10:00'),
(21,8,'6:00','2022-10-31','10:00'),
(22,7,'6:30','2022-10-31','10:00');

--Populate Deliveries

INSERT INTO Deliveries(order_id,emp_id) VALUES
(1000,4),
(1001,1),
(1002,4),
(1003,1),
(1004,2),
(1005,4),
(1006,2),
(1007,1),
(1008,3),
(1009,2),
(1010,3),
(1011,4),
(1012,3),
(1013,4),
(1014,3),
(1015,5),
(1016,6),
(1017,5),
(1018,6),
(1019,7),
(1020,8),
(1021,9),
(1022,10),
(1023,2),
(1024,4),
(1025,2),
(1026,3),
(1027,5),
(1028,7),
(1029,10),
(1030,9),
(1031,5),
(1032,7),
(1033,3),
(1034,4),
(1035,3),
(1036,8),
(1037,7),
(1038,6),
(1039,4),
(1040,3),
(1041,7),
(1042,8),
(1043,6),
(1044,7),
(1045,3),
(1046,4),
(1047,6),
(1048,8),
(1049,6);

--Populate Menu_item table
INSERT INTO Menu_item(item_id,description,price) VALUES
(2000,'Cheese Pizza',10.00),
(2001,'Pepperoni Pizza - Cheese Pizza with pepperoni topping and tomato sauce',11.00),
(2002,'Veggie Pizza - Cheese Pizza with olive, onion, bell pepper, tomato toppings and tomato sauce',13.00),
(2003,'Combo - Cheese Pizza with pepperoni, olive, onion, bell pepper, sausage toppings and tomato sauce',14.00),
(2004,'Hawaiian - Cheese Pizza with pineapple, ham toppings and tomato sauce',12.00),
(2005,'Meat Lovers - Cheese Pizza with pepperoni, sausage, salami, chicken toppings and tomato sauce',15.00),
(2006,'Gourmet Veggie - Cheese Pizza with mushroom, olive, onion, bell pepper, tomato, jalapeno, and tomato sauce',16.00),
(2007,'Dannys - Cheese pizza with pepperoni, pineapple and tomato sauce',9.00),
(2008,'Custom Pizza',100.00);

--Populate Recipes

INSERT INTO Recipes(ingredient_id,item_id) VALUES
(3000,2000),
(3001,2000),
(3002,2000),
--
(3000,2001),
(2001,2001),
(3002,2001),
(3003,2001),
--
(3000,2002),
(3001,2002),
(3002,2002),
(3008,2002),
(3009,2002),
(3010,2002),
(3011,2002),
--
(3000,2003),
(3001,2003),
(3002,2003),
(3003,2003),
(3004,2003),
(3008,2003),
(3009,2003),
(3010,2003),
--
(3000,2004),
(3001,2004),
(3002,2004),
(3007,2004),
(3014,2004),
--
(3000,2005),
(3001,2005),
(3002,2005),
(3003,2005),
(3004,2005),
(3005,2005),
(3006,2005),
--
(3000,2006),
(3001,2006),
(3002,2006),
(3012,2006),
(3008,2006),
(3009,2006),
(3010,2006),
(3011,2006),
(3013,2006),
--
(3000,2007),
(3001,2007),
(3002,2007),
(3003,2007),
(3014,2007);

--Populate Ingredients table 

INSERT INTO Ingredients(ingredient_id,ing_info,cost) VALUES
(3000,'pizza dough',00.05),
(3001,'tomato sauce',00.10),
(3002,'cheese',00.30),
(3003,'pepperoni',00.05),
(3004,'sausage',00.05),
(3005,'salami',00.05),
(3006,'chicken',00.05),
(3007,'ham',00.05),
(3008,'olive',00.02),
(3009,'onion',00.02),
(3010,'bell pepper',00.02),
(3011,'tomato',00.02),
(3012,'mushroom',00.02),
(3013,'jalapeno',00.02),
(3014,'pineapple',00.02);

--1. Add customer info
INSERT INTO Customers(cust_id, c_name, c_address, c_phone) VALUES
(51, 'Marissa Rodriguez', '1645 Columbia Mine Road', 3476734474),
(52, 'John Hill', '4890 Shadowmar Drive', 4145351455),
(53, 'Gerard Way', '2052 Scenic Way', 2243255975);

--2. Customer wants to update new phone number

UPDATE Customers
SET c_address ='1062 Oakway Lane', c_phone = '5556869777' 
WHERE cust_id = 5;

--3. Add a order(order placed)
INSERT INTO Orders(order_id, cust_id,delivery_time, delivery_date) VALUES
(1050,'50','6:00','2022-11-01');

--4. Delete order 
DELETE FROM Orders 
WHERE order_id = 1050;

--5. Add item to already made order
INSERT INTO Ordered_items(order_id,item_id) VALUES
(1049,2001),
(1048,2002),
(1002,2000);

--6. We ran out of pepperoni pizzas delete item from any orders that ordered one
DELETE FROM Ordered_items
Where item_id = 2001;

--7. Add employee info(New hire)
INSERT INTO Employees(emp_id, e_name, hourly_wage, e_phone) VALUES
(11,'Chet Hanks', 16.00,5559992020);

--8. Show the 5 largest amounts of deliveries an employee has made while working a single shift.
SELECT e.e_name AS empName, s.shift_id AS shiftNumber, COUNT(d.order_id) AS numDeliveries
FROM Employees AS e, Shifts AS s, Deliveries AS d
WHERE e.emp_id = s.emp_id
  AND e.emp_id = d.emp_id
GROUP BY e.emp_id, s.shift_id ORDER BY COUNT(d.order_id) DESC 
LIMIT 5;


--9. All of the ingredients that are in a combo pizza
SELECT DISTINCT i.ing_info AS ingredient
FROM Ingredients i, Recipes r, Menu_item m
WHERE m.item_id = r.item_id
  AND m.item_id = 2003
  AND i.ingredient_id = r.ingredient_id;

--10. The most popularly ordered menu item id and name
SELECT i AS item_id, m.description FROM (
SELECT i2.item_id AS i, COUNT(i2.item_id) 
FROM Ordered_items AS i2 
GROUP BY i2.item_id ORDER BY 
COUNT(i2.item_id) DESC LIMIT 1), Menu_item m
WHERE m.item_id = i;


-- 11. how many ingredients are in a combo pizza?
SELECT COUNT(Recipes.ingredient_id)
FROM Recipes
WHERE Recipes.item_id = 2003;
 

--12. how many deliveries made on october 31st at 9pm
SELECT COUNT(Orders.order_id)
FROM Deliveries, Orders
WHERE Deliveries.order_id = Orders.order_id
AND delivery_time = "9:00"
AND delivery_date = "2022-10-31";
 

-- 13. Give an employee a $5 raise
UPDATE Employees
SET hourly_wage = hourly_wage + 5
WHERE emp_id = 1;

-- 14. Assign a delivery to an employee
INSERT INTO Orders
VALUES (1050, 51, '7:00', '2022-11-07');
INSERT INTO Ordered_items
VALUES (1050, 2000);
INSERT INTO Deliveries
VALUES (1050, NULL);
INSERT INTO Customers
VALUES (51, 'Billy', '123 Billy St.', 5329164150);
UPDATE Deliveries
SET emp_id = 1
WHERE order_id = 1050;

-- 15. A complaint was made because a pizza that was supposed to be delivered at 6:00pm was delivered at 8:00pm.
-- This happened on Halloween. Find which employee took 6:00pm deliveries
SELECT e_name, shift_id
FROM Orders, Employees, Deliveries, Shifts
WHERE Orders.order_id = Deliveries.order_id
AND Shifts.emp_id = Deliveries.emp_id
AND Employees.emp_id = Deliveries.emp_id
AND Shifts.s_date = '2022-10-31'
AND Orders.delivery_date = '2022-10-31'
AND Orders.delivery_time = '6:00';


-- 16. How many pizzas were ordered on october 5th
SELECT COUNT(Orders.order_id)
FROM Orders, Deliveries
WHERE Orders.order_id = Deliveries.order_id
AND Orders.delivery_date = '2022-10-05';

-- 17. How much did the restaurant make on profit on october 31st
SELECT
(SELECT SUM(m.price) 
FROM Menu_item AS m, Ordered_items AS oi, Orders AS o
WHERE o.delivery_date = DATE('2022-10-31') 
AND o.order_id = oi.order_id 
AND oi.item_id = m.item_id)
-
(SELECT SUM(i.cost)
FROM Menu_item AS m, Ingredients AS i, Ordered_items AS oi, Orders o, Recipes AS r
WHERE o.delivery_date = DATE('2022-10-31')
AND o.order_id = oi.order_id 
AND oi.item_id = m.item_id 
AND m.item_id = r.item_id 
AND r.ingredient_id = i.ingredient_id) AS Profit;

-- 18. Which employees worked on October 5th
SELECT COUNT(Employees.emp_id)
FROM Employees, Shifts
WHERE Shifts.emp_id = Employees.emp_id
AND Shifts.s_date = '2022-10-05';


--19. Delete employee bob (fired for sleeping on the job)
DELETE FROM Employees
WHERE emp_id = 1;

--20. Order a combo pizza add jalapenos
INSERT INTO Orders
VALUES (1051, 51, '7:00', '2022-11-09');
INSERT INTO Ordered_items
VALUES (1051, 2008);

SELECT * FROM Ordered_items;
SELECT * FROM Customers;
SELECT * FROM Deliveries;
SELECT * FROM Employees;
SELECT * FROM Shifts;
SELECT * FROM Menu_item;

