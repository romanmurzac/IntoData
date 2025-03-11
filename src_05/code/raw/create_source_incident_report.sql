CREATE TABLE raw.incident_report (
  report_id SERIAL PRIMARY KEY,
  guard_id INT NOT NULL,
  client_id INT NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  zone VARCHAR(50) NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  severity VARCHAR(20),
  type VARCHAR(20),
  description TEXT
);