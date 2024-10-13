-- Query to get the top 5 best-selling products based on total quantity sold
SELECT 
    p.product_id,
    p.p_name,
    SUM(o.quantity) AS total_quantity_sold
FROM 
    "Product" AS p
JOIN 
    "Order_Product" AS op ON p.product_id = op.product_id
JOIN 
    "Order" AS o ON op.order_id = o.order_id
GROUP BY 
    p.product_id, p.p_name
ORDER BY 
    total_quantity_sold DESC
LIMIT 5;
