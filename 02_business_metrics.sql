Total Revenue
SELECT SUM(payment_amount)
FROM payments
WHERE payment_status='success';

Total Orders
SELECT COUNT(*)
FROM orders
WHERE order_status='completed';

Average Order Value
SELECT
SUM(payment_amount)/COUNT(DISTINCT order_id) AS avg_order_value
FROM payments
WHERE payment_status='success';

Revenue per User
SELECT
SUM(payment_amount)/COUNT(DISTINCT o.user_id) AS revenue_per_user
FROM orders o
JOIN payments p ON o.order_id=p.order_id
WHERE p.payment_status='success';
