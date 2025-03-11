CREATE TABLE trusted.fact_incidents (
  incident_id SERIAL PRIMARY KEY,
  guard_id INT REFERENCES trusted.dim_guards(guard_id) ON DELETE CASCADE,
  client_id INT REFERENCES trusted.dim_clients(client_id) ON DELETE CASCADE,
  location_id INT REFERENCES trusted.dim_locations(location_id) ON DELETE CASCADE,
  time_id INT REFERENCES trusted.dim_time(time_id) ON DELETE CASCADE,
  severity_level VARCHAR(20),
  description TEXT
);