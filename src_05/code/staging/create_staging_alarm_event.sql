CREATE TABLE staging.alarm_event (
  alarm_event_id SERIAL PRIMARY KEY,
  client_id INT NOT NULL,
  location_id VARCHAR(50) NOT NULL,
  time_id TIMESTAMP NOT NULL,
  alarm_type_id VARCHAR(50) NOT NULL,
  triggered_by VARCHAR(50)
);