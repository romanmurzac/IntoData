CREATE TABLE IF NOT EXISTS trusted.dim_company (
  company_id SERIAL PRIMARY KEY,
  company_name VARCHAR(255) NOT NULL UNIQUE,
  source_system VARCHAR(25),
  ingested_ts TIMESTAMP
);