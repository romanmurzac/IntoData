CREATE TABLE staging.location (
  location_id SERIAL PRIMARY KEY,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  zone VARCHAR(50) NOT NULL
);
