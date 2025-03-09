INSERT INTO trusted.dim_time (time_id, date, month, year, day_of_week, hour_of_day)
SELECT * FROM staging.time;