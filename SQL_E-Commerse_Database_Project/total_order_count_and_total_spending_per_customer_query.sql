-- Query to get total order count and total spending per customer
SELECT 
    c.customer_id,
    c.c_first_name || ' ' || c.c_last_name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_total) AS total_spent
FROM 
    "Customer" AS c
LEFT JOIN 
    "Order" AS o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, customer_name
ORDER BY 
    total_spent DESC;