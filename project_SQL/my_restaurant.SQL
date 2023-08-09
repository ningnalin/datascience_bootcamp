.header on
.mode column
.mode box

CREATE TABLE menu (
    menu_id INT,
    menu_name TEXT,
    price REAL,
    type_id INT
);

INSERT INTO menu values
  (1, "pizza", 200, 1),
  (2, "pasta", 120, 1),
  (3, "salad", 150, 1),
  (4, "steak", 260, 1),
  (5, "frenchfries", 80, 1),
  (6, "juice", 30, 2),
  (7, "smoothie", 65, 2),
  (8, "water", 20, 2),
  (9, "noodle", 50, 1),
  (10, "milk", 18, 2);

-- SELECT * FROM menu;

CREATE TABLE food_type (
    type_id INT,
    type TEXT
);

INSERT INTO food_type values
  (1, "Food"),
  (2, "Drink");
  
-- SELECT * FROM food_type;

CREATE TABLE customer (
  customer_id INT,
  name TEXT,
  gender TEXT,
  age INT
);

INSERT INTO customer VALUES 
  (1, "Boss", "Male", 30),
  (2, "Dolce", "Female", 3),
  (3, "Ning", "Female", 28),
  (4, "Cadence", "Male", 2),
  (5, "Lek", "Female", 31),
  (6, "Lee", "Female", 33);

-- SELECT * FROM customer;

CREATE TABLE bill (
  bill_id INT,
  date TEXT,
  customer_id INT,
  menu_id INT,
  amount INT
);

INSERT INTO bill VALUES
	(1, "2022-01-02",1, 2, 4),
    (2, "2022-01-03",2, 4, 5),
    (3, "2022-01-08",3, 1, 2),
	(4, "2022-01-09",4, 5, 3),
    (5, "2022-02-03",5, 3, 1),
    (6, "2022-02-18",6, 6, 3),
    (7, "2022-03-26",2, 7, 5),
    (8, "2022-03-26",1, 2, 3),
    (9, "2022-04-15",3, 8, 6),
    (10, "2022-04-16",4, 9, 2),
    (11, "2022-04-16",4, 10, 4);
    
-- SELECT * FROm bill;

CREATE TABLE review(
	menu_id INT,
	review REAL);
    
INSERT INTO review VALUES
	(1, 4.5),
    (3, 3.4),
    (2, 4.4),
    (6, 4.9),
    (4, 3.5),
    (5, 4.8),
    (7, 2.4),
    (8, 3.9),
    (10, 4.1),
    (9, 2.7),
    (4, 5),
    (5, 3.2),
    (1, 2.5),
    (2, 4.8),
    (3, 5);
    
-- SELECT * FROM review;

-- Reccomend Rating

WITH rating AS
(SELECT
    menu.menu_name,
    AVG(review.review) rate
FROM review
JOIN menu ON review.menu_id = menu.menu_id
GROUP BY menu.menu_name
ORDER BY rate DESC)

SELECT
	rating.menu_name,
    rating.rate,
    CASE WHEN rate >= 4 THEN "Reccommend"
		ELSE "-" END AS reccommend
FROM rating
ORDER BY rate DESC;


-- Top Spender

SELECT
	customer.name,
    COUNT(bill.customer_id) amount,
    menu.price * bill.amount AS top_spender
FROM customer
JOIN bill ON bill.customer_id = customer.customer_id
JOIN menu ON bill.menu_id = menu.menu_id
GROUP BY 1
ORDER BY 3 DESC
LIMIT 3;


-- Monthly Sales

SELECT
	month, 
    SUM(amount) AS transaction_sum, 
    SUM(total) AS total_sale, 
    ROUND(SUM(total)/SUM(amount),0) AS average_per_transaction
FROM
(SELECT
    STRFTIME("%m",date) AS month,
    bill.menu_id,
	menu.menu_name,
	menu.price,
	bill.amount,
    menu.price * bill.amount AS total
FROM bill
JOIN menu ON bill.menu_id = menu.menu_id
)
GROUP BY month;


-- Total By Food Type

SELECT
food_type.type,
SUM(bill.amount) type_total_sale
FROM menu
JOIN food_type ON menu.type_id = food_type.type_id
JOIN bill ON menu.menu_id = bill.menu_id
GROUP BY food_type.type
ORDER BY type_total_sale DESC;


-- Best Seller By Sales

SELECT 
menu.menu_name AS bestseller,
sum(amount) * menu.price AS total_sale
FROM bill
JOIN menu ON menu.menu_id = bill.menu_id
GROUP BY menu.menu_name
order by total_sale desc
LIMIT 5;
