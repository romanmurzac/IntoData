CREATE TABLE trusted.dim_locations (
  location_id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  city VARCHAR(100),
  zone VARCHAR(50)
);