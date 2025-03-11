INSERT INTO staging.guard (guard_id, full_name, rank, shift_schedule)
SELECT DISTINCT guard_id, CONCAT(first_name, ' ', last_name), rank, CONCAT(start_time, ' - ', end_time)
FROM raw.employee_schedule;