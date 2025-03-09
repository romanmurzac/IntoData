CREATE TABLE staging.incident (
  incident_id SERIAL PRIMARY KEY,
  guard_id INT NOT NULL,
  client_id INT NOT NULL,
  location_id INT NOT NULL,
  time_id INT NOT NULL,
  severity_level VARCHAR(20),
  description TEXT
);