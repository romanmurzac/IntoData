CREATE TABLE IF NOT EXISTS trusted.fact_job_postings (
  job_post_id SERIAL PRIMARY KEY,
  staging_job_id INT REFERENCES staging.jobs(staging_id),  
  date_id INT REFERENCES trusted.dim_date(date_id),
  company_id INT REFERENCES trusted.dim_company(company_id),
  location_id INT REFERENCES trusted.dim_location(location_id),
  job_type_id INT REFERENCES trusted.dim_job_type(job_type_id),
  salary_id INT REFERENCES trusted.dim_salary(salary_id),
  remote_type_id INT REFERENCES trusted.dim_remote_type(remote_type_id),
  technology_id INT REFERENCES trusted.dim_technology(technology_id),
  job_title VARCHAR(255),
  job_description TEXT,
  job_url TEXT
);