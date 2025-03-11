CREATE TABLE staging.incident (
  incident_id INT PRIMARY KEY,
  guard_id INT NOT NULL,
  client_id INT NOT NULL,
  location_id VARCHAR(50) NOT NULL,
  time_id TIMESTAMP NOT NULL,
  severity_level VARCHAR(20),
  description TEXT
);