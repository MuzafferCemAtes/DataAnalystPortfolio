-- DROP VIEW IF EXISTS Seller_Average_Rating
-- View showing the average rating of each seller
CREATE VIEW Seller_Average_Rating AS
SELECT 
    s.s_name AS seller_name,
    ROUND(AVG(r.rating),1) AS average_rating
FROM 
    "Seller" AS s
LEFT JOIN 
    "Ratings" AS r ON s.seller_id = r.seller_id
GROUP BY 
    s.seller_id, s.s_name;

select * from Seller_Average_Rating