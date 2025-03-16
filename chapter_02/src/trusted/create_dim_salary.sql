CREATE TABLE IF NOT EXISTS trusted.dim_salary (
  salary_id SERIAL PRIMARY KEY,
  min_salary INT NOT NULL,
  max_salary INT NOT NULL,
  currency VARCHAR(3) NOT NULL,
  UNIQUE (min_salary, max_salary, currency)
);