-- extract time and date (month, day) from started_at and ended_at columns
alter table cyclistic_data_clean
ADD COLUMN start_month VARCHAR(10),
ADD COLUMN start_day_of_week VARCHAR(10),
ADD COLUMN start_time TIME,
ADD COLUMN end_month VARCHAR(10),
ADD COLUMN end_day_of_week VARCHAR(10),
ADD COLUMN end_time TIME;

UPDATE cyclistic_data_clean
SET 
	start_month = TO_CHAR(started_at,'Month'),
    start_day_of_week = TO_CHAR(started_at, 'Day'),
    start_time = started_at::TIME,
    end_month = TO_CHAR(ended_at,'Month'),
    end_day_of_week = TO_CHAR(ended_at, 'Day'),
    end_time = ended_at::TIME;

select * from cyclistic_data_clean limit 10;