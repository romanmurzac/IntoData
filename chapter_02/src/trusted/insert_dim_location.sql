INSERT INTO trusted.dim_location (location, latitude, longitude, city_category, state_category, address, postal_code, remote_type)
SELECT DISTINCT 
  location,
  latitude,
  longitude,
  city_category,
  state_category,
  address,
  postal_code,
  remote_type
FROM staging.jobs
WHERE location IS NOT NULL
ON CONFLICT (location) DO NOTHING;
