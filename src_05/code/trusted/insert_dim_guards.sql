INSERT INTO trusted.dim_guards (guard_id, full_name, rank, shift_schedule)
SELECT * FROM staging.guard;