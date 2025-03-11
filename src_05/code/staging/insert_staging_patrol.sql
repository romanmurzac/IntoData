INSERT INTO staging.patrol (guard_id, location_id, time_id, status)
SELECT DISTINCT guard_id, city, start_time, status
FROM raw.employee_schedule;