CREATE TABLE IF NOT EXISTS trusted.fact_salaries (
  salary_fact_id SERIAL PRIMARY KEY,
  staging_job_id INT REFERENCES staging.jobs(staging_id),
  date_id INT REFERENCES trusted.dim_date(date_id),
  company_id INT REFERENCES trusted.dim_company(company_id),
  location_id INT REFERENCES trusted.dim_location(location_id),
  salary_id INT REFERENCES trusted.dim_salary(salary_id)
);