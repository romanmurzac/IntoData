CREATE TABLE IF NOT EXISTS trusted.dim_remote_type (
  remote_type_id SERIAL PRIMARY KEY,
  remote_type VARCHAR(50) NOT NULL UNIQUE
);