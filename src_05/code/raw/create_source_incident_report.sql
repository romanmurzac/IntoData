CREATE TABLE raw.incident_report (
  report_id SERIAL PRIMARY KEY,
  guard_id INT NOT NULL,
  client_id INT NOT NULL,
  location_id INT NOT NULL,
  timestamp TIMESTAMP NOT NULL,
  description TEXT,
  severity VARCHAR(20)
);