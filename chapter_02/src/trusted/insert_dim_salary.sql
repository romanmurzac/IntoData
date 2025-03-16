INSERT INTO trusted.dim_salary (min_salary, max_salary, currency)
SELECT DISTINCT 
  salary_min,
  salary_max,
  COALESCE(salary_currency, 'USD') AS currency
FROM staging.jobs
WHERE salary_min IS NOT NULL
AND salary_max IS NOT NULL
ON CONFLICT (min_salary, max_salary, currency) DO NOTHING;