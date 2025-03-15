CREATE TABLE staging.jobs (
  staging_id SERIAL PRIMARY KEY,
  job_id TEXT,
  source_system VARCHAR(25),
  job_url VARCHAR(500),
  job_title VARCHAR(255),
  company_name VARCHAR(255),
  company_logo VARCHAR(500),
  job_industry TEXT[],
  job_type TEXT[],
  job_level VARCHAR(50),
  job_description TEXT,
  job_excerpt TEXT,
  location VARCHAR(255),
  latitude DECIMAL(11,8),
  longitude DECIMAL(11,8),
  remote_type VARCHAR(50),
  workplace VARCHAR(50),
  salary_min INT, 
  salary_max INT,
  salary_currency VARCHAR(3),
  company_size VARCHAR(50), 
  company_type VARCHAR(50),
  tech_stack TEXT[],
  filter_tags TEXT[],
  has_visa_sponsorship BOOLEAN,
  language_requirements TEXT[],
  published_at TIMESTAMP,  
  last_update TIMESTAMP,
  ingested_ts TIMESTAMP,
  staging_ts TIMESTAMP
);
