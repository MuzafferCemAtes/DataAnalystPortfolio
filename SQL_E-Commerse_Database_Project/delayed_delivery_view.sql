-- View to find orders with delayed delivery
CREATE VIEW Delayed_Deliveries AS
SELECT 
    o.order_id,
    o.order_date,
    o.order_courier_date,
    o.order_customer_expected,
    o.order_customer_delivered,
    (o.order_customer_delivered > o.order_customer_expected) AS is_delayed
FROM 
    "Order" AS o
WHERE 
    o.order_customer_delivered > o.order_customer_expected;

select * from Delayed_Deliveries