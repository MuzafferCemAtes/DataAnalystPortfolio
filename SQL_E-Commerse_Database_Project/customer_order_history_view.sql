-- DROP VIEW IF EXISTS Customer_Order_History;

-- View Customer_Order_History: This view provides a summary of each customer's orders,
-- showing the customer's name, order date, order status, total order amount, 
-- and the products they ordered with quantities.

CREATE OR REPLACE VIEW Customer_Order_History AS
SELECT 
    c.c_first_name || ' ' || c.c_last_name AS customer_name,
	pr.p_name AS product_name,
    o.order_date,
    o.order_status,
    o.quantity AS total_quantity,
	o.order_total
FROM 
    "Customer" AS c
JOIN 
    "Order" AS o ON c.customer_id = o.customer_id
JOIN 
    "Order_Product" AS op ON o.order_id = op.order_id
JOIN 
    "Product" AS pr ON op.product_id = pr.product_id;

--SELECT * FROM Customer_Order_History;