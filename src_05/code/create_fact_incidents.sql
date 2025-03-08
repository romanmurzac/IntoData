CREATE TABLE fact_incidents (
  incident_id SERIAL PRIMARY KEY,
  guard_id INT REFERENCES dim_guards(guard_id) ON DELETE CASCADE,
  client_id INT REFERENCES dim_clients(client_id) ON DELETE CASCADE,
  location_id INT REFERENCES dim_locations(location_id) ON DELETE CASCADE,
  time_id INT REFERENCES dim_time(time_id) ON DELETE CASCADE,
  severity_level VARCHAR(20),
  description TEXT
);