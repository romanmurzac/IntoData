CREATE TABLE trusted.fact_alarm_events (
  alarm_event_id SERIAL PRIMARY KEY,
  client_id INT REFERENCES dim_clients(client_id) ON DELETE CASCADE,
  location_id INT REFERENCES dim_locations(location_id) ON DELETE CASCADE,
  time_id INT REFERENCES dim_time(time_id) ON DELETE CASCADE,
  alarm_type_id INT REFERENCES dim_alarm_types(alarm_type_id) ON DELETE CASCADE,
  triggered_by VARCHAR(50)
);