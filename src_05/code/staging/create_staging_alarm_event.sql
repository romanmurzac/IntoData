CREATE TABLE staging.alarm_event (
  alarm_event_id SERIAL PRIMARY KEY,
  client_id INT NOT NULL,
  location_id INT NOT NULL,
  time_id INT NOT NULL,
  alarm_type_id INT NOT NULL,
  triggered_by VARCHAR(50)
);
