Revenue by Marketing Channel
SELECT
u.marketing_channel,
SUM(p.payment_amount) revenue
FROM users u
JOIN orders o ON u.user_id=o.user_id
JOIN payments p ON o.order_id=p.order_id
WHERE p.payment_status='success'
GROUP BY u.marketing_channel
ORDER BY revenue DESC;

Revenue by Device
SELECT
s.device_type,
SUM(p.payment_amount) revenue
FROM sessions s
JOIN orders o ON s.user_id=o.user_id
JOIN payments p ON o.order_id=p.order_id
WHERE p.payment_status='success'
GROUP BY s.device_type;

Conversion by Traffic Source
SELECT
s.traffic_source,
COUNT(DISTINCT o.order_id)/COUNT(DISTINCT s.session_id) AS conversion_rate
FROM sessions s
LEFT JOIN orders o
ON s.user_id=o.user_id
GROUP BY s.traffic_source;
