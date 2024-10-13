INSERT INTO "Customer" (c_first_name, c_last_name, c_city, c_street, c_zipcode, c_phone_number, c_email) 
VALUES 
('Alice', 'Johnson', 'Toronto', '123 Maple St', 'M1B2K3', '1234567890', 'alice@example.com'),
('Bob', 'Smith', 'Vancouver', '456 Pine Rd', 'V5K0A1', '0987654321', 'bob@example.com'),
('Carol', 'Williams', 'Montreal', '789 Elm Ave', 'H2A3J4', '2345678901', 'carol@example.com'),
('David', 'Brown', 'Calgary', '321 Oak Dr', 'T2N1N4', '3456789012', 'david@example.com'),
('Eva', 'Davis', 'Ottawa', '654 Cedar Blvd', 'K1P5G5', '4567890123', 'eva@example.com');

INSERT INTO "Geolocation" (g_timezone, g_region, g_city, g_zip_code, g_country, g_lat, g_lng) 
VALUES 
('America/Toronto', 'Ontario', 'Toronto', 'M1B2K3', 'Canada', 43.65107, -79.347015),
('America/Vancouver', 'British Columbia', 'Vancouver', 'V5K0A1', 'Canada', 49.282729, -123.120738),
('America/Montreal', 'Quebec', 'Montreal', 'H2A3J4', 'Canada', 45.501689, -73.567256),
('America/Calgary', 'Alberta', 'Calgary', 'T2N1N4', 'Canada', 51.044733, -114.071883),
('America/Ottawa', 'Ontario', 'Ottawa', 'K1P5G5', 'Canada', 45.42153, -75.697193);

INSERT INTO "Seller" (s_name, s_city, s_zip_code, s_email, s_phone, seller_type, g_id) 
VALUES 
('Nike Store', 'Toronto', 'M1B2K3', 'toronto@nike.com', '1234567890', 'Physical', 1),
('Adidas Store', 'Vancouver', 'V5K0A1', 'vancouver@adidas.com', '0987654321', 'Physical', 2),
('Reebok Store', 'Montreal', 'H2A3J4', 'montreal@reebok.com', '2345678901', 'Physical', 3),
('Amazon', NULL, NULL, 'support@amazon.com', '3456789012', 'Online', NULL),
('eBay', NULL, NULL, 'support@ebay.com', '4567890123', 'Online', NULL);

INSERT INTO "Geolocation_Seller" (g_id, seller_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(1, 1),  -- Example of multiple stores for the same seller in the same location
(4, 4);

INSERT INTO "Order" (customer_id, store_id, order_date, order_approved_date, order_courier_date, order_customer_expected, order_customer_delivered, order_status, order_total, quantity, shipping_cost) 
VALUES 
(1, 1, NOW(), NOW(), NOW(), NOW() + INTERVAL '5 days', NOW() + INTERVAL '7 days', 'Shipped', 150.00, 2, 10.00),
(2, 2, NOW(), NOW(), NOW(), NOW() + INTERVAL '3 days', NULL, 'Pending', 100.00, 1, 5.00),
(3, 3, NOW(), NOW(), NOW(), NOW() + INTERVAL '4 days', NOW() + INTERVAL '6 days', 'Delivered', 75.50, 3, 8.00),
(4, 4, NOW(), NOW(), NOW(), NOW() + INTERVAL '2 days', NULL, 'Processing', 200.00, 1, 12.00),
(5, NULL, NOW(), NOW(), NOW(), NOW() + INTERVAL '6 days', NULL, 'Cancelled', 50.00, 1, 5.00);

INSERT INTO "Ratings" (seller_id, store_id, rating, rating_date) 
VALUES 
(1, 1, 5, NOW() - INTERVAL '1 day'),
(2, 2, 4, NOW() - INTERVAL '2 days'),
(3, 3, 3, NOW() - INTERVAL '3 days'),
(4, NULL, 5, NOW() - INTERVAL '4 days'),
(5, NULL, 4, NOW() - INTERVAL '5 days');

INSERT INTO "Product" (seller_id, store_id, p_category, p_name, price, stock_quantity, description) 
VALUES 
(1, 1, 'Footwear', 'Air Max', 150.00, 100, 'Nike Air Max running shoes'),
(2, 2, 'Clothing', 'Adidas Hoodie', 75.00, 50, 'Comfortable Adidas hoodie'),
(3, 3, 'Accessories', 'Reebok Backpack', 50.00, 30, 'Durable Reebok backpack'),
(4, NULL, 'Electronics', 'Amazon Kindle', 120.00, 200, 'Amazon e-reader'),
(5, NULL, 'Home', 'eBay Blender', 45.00, 25, 'High-speed blender');

INSERT INTO "Order_Product" (order_id, product_id) 
VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

INSERT INTO "Payment" (order_id, p_type, p_installments_number, amount) 
VALUES 
(1, 'Credit', 1, 150.00),
(2, 'PayPal', 1, 100.00),
(3, 'Gift Card', NULL, 75.50),
(4, 'Credit', 3, 200.00),
(5, 'Debit', NULL, 50.00);

INSERT INTO "Order_Review" (order_id, customer_id, r_score, r_comment_title, r_type, r_comment_message, r_comment_date, r_answer_date, r_answer_message) 
VALUES 
(1, 1, 5, 'Great Product', 'Product Quality', 'Very satisfied with the quality!', NOW() - INTERVAL '3 days', NOW(), 'Thank you!'),
(2, 2, 4, 'Good Service', 'Shipping Experience', 'Fast shipping!', NOW() - INTERVAL '5 days', NULL, NULL),
(3, 3, 3, 'Average Quality', 'Product Quality', 'Could be better', NOW() - INTERVAL '7 days', NOW(), 'We appreciate your feedback.'),
(4, 4, 2, 'Late Delivery', 'Shipping Experience', 'Product was delayed', NOW() - INTERVAL '10 days', NOW(), 'We apologize for the delay.'),
(5, 5, 5, 'Excellent', 'Overall Experience', 'Great experience, will buy again!', NOW() - INTERVAL '2 days', NOW(), 'Thank you for your feedback!');
