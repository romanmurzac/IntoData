CREATE TABLE raw.external_crime (
  crime_id SERIAL PRIMARY KEY,
  location_id INT NOT NULL,
  timestamp TIMESTAMP NOT NULL,
  crime_type VARCHAR(50) NOT NULL,
  severity_level VARCHAR(20),
  source VARCHAR(50)
);
