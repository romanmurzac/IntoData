CREATE TABLE raw.employee_schedule (
  shift_id SERIAL PRIMARY KEY,
  guard_id INT NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  location_id INT NOT NULL
);
