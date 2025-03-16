CREATE TABLE IF NOT EXISTS trusted.dim_job_type (
  job_type_id SERIAL PRIMARY KEY,
  job_type VARCHAR(255) NOT NULL UNIQUE
);