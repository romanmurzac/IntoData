CREATE TABLE dim_guards (
  guard_id SERIAL PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  rank VARCHAR(50),
  shift_schedule VARCHAR(50)
);