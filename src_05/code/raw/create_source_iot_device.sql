CREATE TABLE raw.iot_device (
  device_id SERIAL PRIMARY KEY,
  timestamp TIMESTAMP,
  location_id INT NOT NULL,
  event_type VARCHAR(50) NOT NULL,
  raw_data JSONB
);