CREATE TABLE IF NOT EXISTS raw.candidate (
  candidate_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(50),
  experience INT,
  prefered_post VARCHAR(50),
  technologies TEXT[],
  job_type VARCHAR(50),
  location VARCHAR(50),
  is_available BOOLEAN,
  available_from TIMESTAMP,
  min_salary INT,
  created_at TIMESTAMP,
  source VARCHAR(25),
  ingested_ts TIMESTAMP
);