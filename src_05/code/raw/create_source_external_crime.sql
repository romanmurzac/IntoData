CREATE TABLE raw.external_crime (
  crime_id SERIAL PRIMARY KEY,
  client_name VARCHAR(100) NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  zone VARCHAR(50) NOT NULL,
  crime_type VARCHAR(50) NOT NULL,
  severity_level VARCHAR(20),
  source VARCHAR(50)
);
