CREATE TABLE IF NOT EXISTS trusted.dim_technology (
  technology_id SERIAL PRIMARY KEY,
  technology_name VARCHAR(50) NOT NULL UNIQUE
);