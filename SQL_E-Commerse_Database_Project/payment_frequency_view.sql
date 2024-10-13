-- View to get frequency of each payment type
CREATE VIEW Payment_Type_Frequency AS
SELECT 
    p.p_type,
    COUNT(p.payment_id) AS payment_count
FROM 
    "Payment" AS p
GROUP BY 
    p.p_type
ORDER BY 
    payment_count DESC;

select * from Payment_Type_Frequency