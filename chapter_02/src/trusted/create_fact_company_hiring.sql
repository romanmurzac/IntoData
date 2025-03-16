CREATE TABLE IF NOT EXISTS trusted.fact_company_hiring (
  company_hiring_id SERIAL PRIMARY KEY,
  date_id INT REFERENCES trusted.dim_date(date_id),
  company_id INT REFERENCES trusted.dim_company(company_id),
  location_id INT REFERENCES trusted.dim_location(location_id),
  total_jobs INT NOT NULL DEFAULT 0
);