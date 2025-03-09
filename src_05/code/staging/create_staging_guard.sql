CREATE TABLE staging.guard (
  guard_id SERIAL PRIMARY KEY,
  full_name VARCHAR(50) NOT NULL,
  rank VARCHAR(20),
  shift_schedule VARCHAR(20)
);