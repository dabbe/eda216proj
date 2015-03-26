/* mysql -u db109 -p -h puccini.cs.lth.se db109 */
/* pw: dbdanne */


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



INSERT into cookies(name) VALUES ("Nut ring");
INSERT into cookies(name) VALUES ("Nut cookie");
INSERT into cookies(name) VALUES ("Amneris");
INSERT into cookies(name) VALUES ("Tango");
INSERT into cookies(name) VALUES ("Almond delight");
INSERT into cookies(name) VALUES ("Berliner");


/*INSERT INTO ingredients(material, amount, cookie) VALUES ("Flour", "450", "Nut ring");
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
INSERT INTO ingredients(material, amount, cookie) VALUES ("Vanilla", "2", "Tango");*/

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

