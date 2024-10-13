-- Query to find available stock of products by store location and store name
SELECT 
    pr.p_name AS product_name,
    s.s_name AS store_name,
    pr.stock_quantity,
    g.g_city AS store_location
FROM 
    "Product" AS pr
JOIN 
    "Geolocation_Seller" AS gs ON pr.store_id = gs.store_id
JOIN 
    "Geolocation" AS g ON gs.g_id = g.g_id
JOIN 
    "Seller" AS s ON gs.seller_id = s.seller_id
ORDER BY 
    s.s_name, pr.p_name;
