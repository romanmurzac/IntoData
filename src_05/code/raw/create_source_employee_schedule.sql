CREATE TABLE raw.employee_schedule (
  shift_id SERIAL PRIMARY KEY,
  guard_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  rank VARCHAR(50) NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  zone VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL
);
