/* mysql -u db109 -p -h puccini.cs.lth.se db109 */
/* pw: dbdanne */
/* --------------------------------------------------------------------- */ 

SET foreign_key_checks = 0;
DROP TABLE if exists customers;

CREATE TABLE customers
(
	name VARCHAR(255) PRIMARY KEY,
	address VARCHAR(255) NOT NULL
);
SET foreign_key_checks = 1;

/* -------------------------------- */

SET foreign_key_checks = 0;
DROP TABLE if exists orders;

CREATE TABLE orders
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	delivery_date DATE NOT NULL,
	customer_name VARCHAR(255) NOT NULL,
	FOREIGN KEY (customer_name) references customers(name)
);
SET foreign_key_checks = 1;


/* -------------------------------- */
SET foreign_key_checks = 0;

DROP TABLE if exists cookies;

CREATE TABLE cookies
(
	name VARCHAR(255) PRIMARY KEY
);
SET foreign_key_checks = 1;

/* -------------------------------- */

SET foreign_key_checks = 0;
DROP TABLE if exists ordered_pallets;

CREATE TABLE ordered_pallets
(
	cookie VARCHAR(255) NOT NULL,
	order_id INT NOT NULL,
	quantity INT NOT NULL,
	FOREIGN KEY(cookie) references cookies(name),
	FOREIGN KEY(order_id) references orders(id)
);

SET foreign_key_checks = 1;
/* -------------------------------- */

SET foreign_key_checks = 0;
DROP TABLE if exists produced_pallets;

CREATE TABLE produced_pallets
(
	pallet_id INT AUTO_INCREMENT PRIMARY KEY,
	cookie VARCHAR(255) NOT NULL,
	date_produced DATE NOT NULL,
	blocked BOOLEAN,
	FOREIGN KEY(cookie) references cookies(name)
);

SET foreign_key_checks = 1;

/* -------------------------------- */

SET foreign_key_checks = 0;
DROP TABLE if exists delivered_pallets;

CREATE TABLE delivered_pallets
(
	pallet_id INT PRIMARY KEY,
	customer_name VARCHAR(255) NOT NULL,
	date_delivered DATE NOT NULL,
	FOREIGN KEY(pallet_id) references produced_pallets(pallet_id),
	FOREIGN KEY(customer_name) references customers(name)
);

SET foreign_key_checks = 1;

/* -------------------------------- */

SET foreign_key_checks = 0;

DROP TABLE if exists raw_materials;

CREATE TABLE raw_materials
(
	name VARCHAR(255) PRIMARY KEY,
	quantity INT NOT NULL,
	measurement ENUM('dl', 'g'),
	last_refilled DATE NOT NULL,
	refilled_quantity INT NOT NULL
);

SET foreign_key_checks = 1;
/* -------------------------------- */

SET foreign_key_checks = 0;

DROP TABLE if exists ingredients;

CREATE TABLE ingredients
(
	amount FLOAT NOT NULL,
	material VARCHAR(255) NOT NULL,
	cookie VARCHAR(255) NOT NULL,
	FOREIGN KEY (material) references raw_materials(name),
	FOREIGN KEY (cookie) references cookies(name),
  	PRIMARY KEY (material, cookie)
);

SET foreign_key_checks = 1;
SET NAMES 'utf8';
SET CHARACTER SET utf8;


/* -------------------------------- */

INSERT INTO customers(name, address) VALUES ("Finkakor AB", "Helsingborg");
INSERT INTO customers(name, address) VALUES ("Småbröd AB", "Malmö");
INSERT INTO customers(name, address) VALUES ("Kaffebröd AB", "Landskrona");
INSERT INTO customers(name, address) VALUES ("Bjudkakor AB", "Ystad");
INSERT INTO customers(name, address) VALUES ("Kalaskakor AB", "Trelleborg");
INSERT INTO customers(name, address) VALUES ("Partykakor AB", "Kristianstad");
INSERT INTO customers(name, address) VALUES ("Gästkakor AB", "Hässleholm");
INSERT INTO customers(name, address) VALUES ("Skånekakor AB", "Perstorp");



INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Flour", "10000", "g", "2014-10-03", "6000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Butter", "15000", "g", "2015-01-02", "23000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Icing sugar", "5000", "g", "2014-11-28", "1000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Egg whites", "8000", "dl", "2014-08-03", "2500");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Roasted, chopped nuts", "75000", "g", "2013-04-22", "100000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Fine-ground nuts", "12000", "g", "2015-02-21", "13000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Ground, roasted nuts", "12000", "g", "2015-02-21", "13000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Bread crumbs", "25000", "g", "2014-12-24", "100");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Eggs", "16000", "g", "2015-01-25", "12000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Chopped almonds", "6500", "g", "2014-08-12", "3000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Cinnamon", "8000", "g", "2014-09-01", "5600");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Chocolate", "35100", "g", "2014-05-11", "50000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Vanilla sugar", "9000", "g", "2014-04-29", "14000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Marzipan", "25600", "g", "2014-07-29", "17800");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Potato starch", "90000", "g", "2012-04-01", "28700");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Wheat flour", "65000", "g", "2013-02-03", "35000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Sodium bicarnonate", "1200", "g", "2015-01-10", "8000");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Vanilla", "36000", "g", "2014-10-01", "7500");
INSERT INTO raw_materials(name, quantity, measurement, last_refilled, refilled_quantity) VALUES ("Sugar", "150000", "g", "2014-11-02", "90500");



INSERT into cookies(name) VALUES ("Nut ring");
INSERT into cookies(name) VALUES ("Nut cookie");
INSERT into cookies(name) VALUES ("Amneris");
INSERT into cookies(name) VALUES ("Tango");
INSERT into cookies(name) VALUES ("Almond delight");
INSERT into cookies(name) VALUES ("Berliner");


INSERT INTO ingredients(material, amount, cookie) VALUES ("Flour", "450", "Nut ring");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Butter", "450", "Nut ring");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Icing sugar", "450", "Nut ring");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Roasted, chopped nuts", "450", "Nut ring");


INSERT INTO ingredients(material, amount, cookie) VALUES ("Fine-ground nuts", "750", "Nut cookie");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Ground, roasted nuts", "625", "Nut cookie");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Bread crumbs", "125", "Nut cookie");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Sugar", "375", "Nut cookie");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Egg whites", "3.5", "Nut cookie");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Chocolate", "50", "Nut cookie");

INSERT INTO ingredients(material, amount, cookie) VALUES ("Marzipan", "750", "Amneris");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Butter", "250", "Amneris");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Eggs", "250", "Amneris");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Potato starch", "25", "Amneris");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Wheat flour", "25", "Amneris");

INSERT INTO ingredients(material, amount, cookie) VALUES ("Butter", "200", "Tango");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Sugar", "250", "Tango");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Flour", "300", "Tango");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Sodium bicarnonate", "4", "Tango");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Vanilla", "2", "Tango");

INSERT INTO ingredients(material, amount, cookie) VALUES ("Butter", "400", "Almond delight");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Sugar", "270", "Almond delight");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Chopped almonds", "279", "Almond delight");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Flour", "400", "Almond delight");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Cinnamon", "10", "Almond delight");

INSERT INTO ingredients(material, amount, cookie) VALUES ("Flour", "350", "Berliner");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Butter", "250", "Berliner");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Icing sugar", "100", "Berliner");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Eggs", "50", "Berliner");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Vanilla sugar", "5", "Berliner");
INSERT INTO ingredients(material, amount, cookie) VALUES ("Chocolate", "50", "Berliner");

INSERT INTO orders(delivery_date, customer_name) VALUES("2015-03-08", "Bjudkakor AB");
INSERT INTO orders(delivery_date, customer_name) VALUES("2015-04-11", "Gästkakor AB");
INSERT INTO orders(delivery_date, customer_name) VALUES("2016-04-11", "Kalaskakor AB");

INSERT INTO ordered_pallets(cookie, order_id, quantity) VALUES ("Almond delight", 1, 10);
INSERT INTO ordered_pallets(cookie, order_id, quantity) VALUES ("Berliner", 1, 15);
INSERT INTO ordered_pallets(cookie, order_id, quantity) VALUES ("Almond delight", 2, 20);
INSERT INTO ordered_pallets(cookie, order_id, quantity) VALUES ("Amneris", 2, 8);
INSERT INTO ordered_pallets(cookie, order_id, quantity) VALUES ("Nut cookie", 2, 6);
INSERT INTO ordered_pallets(cookie, order_id, quantity) VALUES ("Nut cookie", 3, 2);
INSERT INTO ordered_pallets(cookie, order_id, quantity) VALUES ("Nut ring", 3, 12);


INSERT INTO produced_pallets(cookie, date_produced, blocked) VALUES ("Nut cookie", "2014-05-04", 0);
INSERT INTO produced_pallets(cookie, date_produced, blocked) VALUES ("Nut ring", "2014-08-04", 0);
INSERT INTO produced_pallets(cookie, date_produced, blocked) VALUES ("Nut cookie", "2014-10-04", 0);

INSERT INTO delivered_pallets(pallet_id, customer_name, date_delivered) VALUES (1, "Bjudkakor AB", "2014-10-10");
INSERT INTO delivered_pallets(pallet_id, customer_name, date_delivered) VALUES (2, "Kalaskakor AB", "2016-12-10");