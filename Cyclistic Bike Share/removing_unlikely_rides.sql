select * from cyclistic_data_clean limit 10

DELETE FROM cyclistic_data_clean
WHERE ride_duration < INTERVAL '1 minute' 
   OR ride_duration > INTERVAL '1 day';
