Visitors
SELECT COUNT(DISTINCT user_id)
FROM sessions;

Users who ordered
SELECT COUNT(DISTINCT user_id)
FROM orders;

Users who paid
SELECT COUNT(DISTINCT o.user_id)
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
WHERE p.payment_status='success';

