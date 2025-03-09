CREATE TABLE trusted.fact_patrols (
  patrol_id SERIAL PRIMARY KEY,
  guard_id INT REFERENCES dim_guards(guard_id) ON DELETE CASCADE,
  location_id INT REFERENCES dim_locations(location_id) ON DELETE CASCADE,
  time_id INT REFERENCES dim_time(time_id) ON DELETE CASCADE,
  status VARCHAR(50)
);