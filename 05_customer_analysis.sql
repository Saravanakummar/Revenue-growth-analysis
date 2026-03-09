Top Customers
SELECT
u.user_id,
SUM(p.payment_amount) total_spent
FROM users u
JOIN orders o ON u.user_id=o.user_id
JOIN payments p ON o.order_id=p.order_id
WHERE p.payment_status='success'
GROUP BY u.user_id
ORDER BY total_spent DESC
LIMIT 10;

Repeat Buyers
SELECT
user_id,
COUNT(order_id) orders
FROM orders
GROUP BY user_id
ORDER BY orders DESC;
