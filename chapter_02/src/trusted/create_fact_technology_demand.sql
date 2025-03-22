CREATE TABLE IF NOT EXISTS trusted.fact_technology_demand (
  tech_demand_id SERIAL PRIMARY KEY,
  date_id INT REFERENCES trusted.dim_date(date_id),
  job_id INT REFERENCES trusted.fact_job_postings(job_post_id) ON DELETE CASCADE,
  technology_id INT REFERENCES trusted.dim_technology(technology_id)
);