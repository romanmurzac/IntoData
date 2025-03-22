CREATE TABLE IF NOT EXISTS trusted.dim_location (
  location_id SERIAL PRIMARY KEY,
  location VARCHAR(255) NOT NULL UNIQUE,
  latitude DECIMAL(11,8),
  longitude DECIMAL(11,8),
  city_category VARCHAR(50),
  state_category VARCHAR(50),
  address VARCHAR(255),
  postal_code VARCHAR(50),
  remote_type VARCHAR(50)
);