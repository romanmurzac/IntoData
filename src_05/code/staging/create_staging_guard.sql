CREATE TABLE staging.guard (
  guard_id INT PRIMARY KEY,
  full_name VARCHAR(50) NOT NULL,
  rank VARCHAR(50),
  shift_schedule VARCHAR(50)
);