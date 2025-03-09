CREATE TABLE staging.incident (
  patrol_id SERIAL PRIMARY KEY,
  guard_id INT NOT NULL,
  location_id INT NOT NULL,
  time_id INT NOT NULL,
  status VARCHAR(20)
);
