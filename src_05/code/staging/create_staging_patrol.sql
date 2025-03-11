CREATE TABLE staging.patrol (
  patrol_id SERIAL PRIMARY KEY,
  guard_id INT NOT NULL,
  location_id VARCHAR(50) NOT NULL,
  time_id TIMESTAMP NOT NULL,
  status VARCHAR(20)
);
