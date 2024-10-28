--Create Table

Create table cyclistic_data(
	ride_id varchar(16) primary key,
	rideable_type varchar(20),
	started_at timestamp,
	ended_at timestamp,
	start_station_name varchar(255),
	start_station_id varchar(100),
	end_station_name varchar(255),
	end_station_id varchar(50),
	start_lat DOUBLE PRECISION,
    start_lng DOUBLE PRECISION,
    end_lat DOUBLE PRECISION,
    end_lng DOUBLE PRECISION,
	member_casual varchar(6)
)