CREATE TABLE trusted.fact_job_postings_partitioned (
  job_id BIGINT NOT NULL,
  date_id INT NOT NULL,
  company_id INT NOT NULL REFERENCES trusted.dim_company(company_id),
  location_id INT NOT NULL REFERENCES trusted.dim_location(location_id),
  job_type_id INT REFERENCES trusted.dim_job_type(job_type_id),
  salary_id INT REFERENCES trusted.dim_salary(salary_id),
  remote_type_id INT REFERENCES trusted.dim_remote_type(remote_type_id),
  technology_id INT REFERENCES trusted.dim_technology(technology_id),
  job_title VARCHAR(255),
  job_description TEXT,
  job_url TEXT,
  PRIMARY KEY (job_id, date_id)
) PARTITION BY RANGE (date_id);