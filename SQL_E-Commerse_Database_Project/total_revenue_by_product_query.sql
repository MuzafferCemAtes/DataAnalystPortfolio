-- Query to calculate total revenue by product category
SELECT 
    p.p_category,
    SUM(o.order_total) AS total_revenue
FROM 
    "Product" AS p
JOIN 
    "Order_Product" AS op ON p.product_id = op.product_id
JOIN 
    "Order" AS o ON op.order_id = o.order_id
GROUP BY 
    p.p_category
ORDER BY 
    total_revenue DESC;