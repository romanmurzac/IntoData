INSERT INTO staging.guard (guard_id, full_name, rank, shift_schedule)
SELECT DISTINCT guard_id, 'John Doe', 'Officer', 'Rotating'
FROM raw.employee_schedule;
WHERE guard_id NOT IN (SELECT guard_id FROM staging.guard);