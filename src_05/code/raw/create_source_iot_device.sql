CREATE TABLE raw.iot_device (
  device_id INT PRIMARY KEY,
  client_id INT NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  zone VARCHAR(50) NOT NULL,
  event_type VARCHAR(50) NOT NULL,
  raw_data JSONB
);