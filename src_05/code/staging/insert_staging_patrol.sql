INSERT INTO staging.patrol (patrol_id, guard_id, location_id, time_id, status)
SELECT shift_id, guard_id, location_id, start_time, 'Completed'
FROM raw.employee_schedule
WHERE shift_id NOT IN (SELECT patrol_id FROM staging.patrol);