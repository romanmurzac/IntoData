CREATE TABLE IF NOT EXISTS raw.hiredcorp (
  job_id SERIAL PRIMARY KEY,
  source VARCHAR(25),
  company_name VARCHAR(255),
  job_title VARCHAR(255),
  job_url VARCHAR(500),
  address VARCHAR(255),
  job_type TEXT[],
  min_salary INT,
  skills TEXT[],
  posted_at TIMESTAMP,
  ingested_ts TIMESTAMP
);