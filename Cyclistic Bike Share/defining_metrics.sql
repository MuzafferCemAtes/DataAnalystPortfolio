select * from cyclistic_data_clean limit 10;


'''
alter table cyclistic_data_clean
drop column ride_duration,
drop column distance ,
drop column is_round_trip;
'''
--defining key metrics: ride_duration, distance, is_round_trip
alter table cyclistic_data_clean
add column ride_duration INTERVAL,
add column distance decimal(6,2),
add column is_round_trip boolean;

--calculating ride_duration metric
update cyclistic_data_clean
set ride_duration = ended_at - started_at


--create a function for haversine calculation
CREATE OR REPLACE FUNCTION haversine_km(
    start_lat DOUBLE PRECISION,
    start_lng DOUBLE PRECISION,
    end_lat DOUBLE PRECISION,
    end_lng DOUBLE PRECISION
) RETURNS DOUBLE PRECISION AS $$
DECLARE
    R DOUBLE PRECISION := 6371; -- Earth's radius in kilometers
    dlat DOUBLE PRECISION;
    dlng DOUBLE PRECISION;
    a DOUBLE PRECISION;
    c DOUBLE PRECISION;
BEGIN
    dlat := RADIANS(end_lat - start_lat);
    dlng := RADIANS(end_lng - start_lng);
    
    a := POWER(SIN(dlat / 2), 2) +
         COS(RADIANS(start_lat)) * COS(RADIANS(end_lat)) *
         POWER(SIN(dlng / 2), 2);
    
    c := 2 * ATAN2(SQRT(a), SQRT(1 - a));
    
    RETURN R * c;
END;
$$ LANGUAGE plpgsql;

UPDATE cyclistic_data_clean
SET distance = haversine_km(start_lat, start_lng, end_lat, end_lng);


--filling is_round_trip
UPDATE cyclistic_data_clean
SET is_round_trip = 
    CASE 
        WHEN start_station_name = end_station_name THEN TRUE
        ELSE FALSE
    END;