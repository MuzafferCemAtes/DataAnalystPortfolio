-- Query to calculate total sales by store location
SELECT 
    gs.store_id,
    g.g_city AS store_location,
    SUM(o.order_total) AS total_sales
FROM 
    "Order" AS o
JOIN 
    "Geolocation_Seller" AS gs ON o.store_id = gs.store_id
JOIN 
    "Geolocation" AS g ON gs.g_id = g.g_id
GROUP BY 
    gs.store_id, g.g_city
ORDER BY 
    total_sales DESC;
