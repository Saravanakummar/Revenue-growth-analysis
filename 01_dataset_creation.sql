CREATE DATABASE revenue_project;
USE revenue_project;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    signup_date DATE,
    country VARCHAR(50),
    device_type VARCHAR(20),
    marketing_channel VARCHAR(50)
);
  CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    order_status VARCHAR(20),
    order_value DECIMAL(10,2)
);


CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_status VARCHAR(20),
    payment_method VARCHAR(30),
    payment_amount DECIMAL(10,2)
);

CREATE TABLE numbers (
n INT PRIMARY KEY
);

INSERT INTO numbers (n)
SELECT a.N + b.N * 10 + c.N * 100 + 1
FROM
(SELECT 0 N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION 
 SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
(SELECT 0 N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION 
 SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b,
(SELECT 0 N UNION SELECT 1) c
WHERE a.N + b.N * 10 + c.N * 100 < 200;


INSERT INTO users
SELECT
n,
DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND()*60) DAY),
'India',
ELT(FLOOR(1 + RAND()*3),'Mobile','Desktop','Tablet'),
ELT(FLOOR(1 + RAND()*4),'Google Ads','Organic','Instagram','Referral')
FROM numbers;

INSERT INTO orders (user_id, order_date, order_status, order_value)
SELECT
FLOOR(1 + RAND()*200),
DATE_ADD('2025-02-01', INTERVAL FLOOR(RAND()*60) DAY),
ELT(FLOOR(1 + RAND()*3),'completed','cancelled','pending'),
ROUND(200 + RAND()*5000,2)
FROM numbers n1
JOIN numbers n2
LIMIT 600;

INSERT INTO payments (order_id, payment_status, payment_method, payment_amount)
SELECT
order_id,
ELT(FLOOR(1 + RAND()*3),'success','failed','refunded'),
ELT(FLOOR(1 + RAND()*3),'UPI','Credit Card','Debit Card'),
ROUND(200 + RAND()*5000,2)
FROM orders;


CREATE TABLE sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    session_date DATE,
    device_type VARCHAR(20),
    traffic_source VARCHAR(50),
    pages_viewed INT,
    session_duration INT
);

INSERT INTO sessions (
user_id,
session_date,
device_type,
traffic_source,
pages_viewed,
session_duration
)
SELECT
FLOOR(1 + RAND()*200),
DATE_ADD('2025-02-01', INTERVAL FLOOR(RAND()*60) DAY),
ELT(FLOOR(1 + RAND()*3),'Mobile','Desktop','Tablet'),
ELT(FLOOR(1 + RAND()*4),'Google Ads','Organic','Instagram','Referral'),
FLOOR(1 + RAND()*10),
FLOOR(10 + RAND()*600)
FROM numbers n1
JOIN numbers n2
LIMIT 1000;
