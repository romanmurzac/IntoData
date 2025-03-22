INSERT INTO trusted.fact_salaries (
  staging_job_id, date_id, company_id, location_id, salary_id
)
SELECT
  sj.staging_id,
  dd.date_id, 
  dc.company_id, 
  dl.location_id, 
  ds.salary_id
FROM staging.jobs sj
LEFT JOIN trusted.dim_date dd ON dd.date = CAST(sj.published_at AS DATE)
LEFT JOIN trusted.dim_company dc ON dc.company_name = sj.company_name
LEFT JOIN trusted.dim_location dl ON dl.location = sj.location
LEFT JOIN trusted.dim_salary ds ON ds.min_salary = sj.salary_min 
  AND ds.max_salary = sj.salary_max 
  AND ds.currency = COALESCE(sj.salary_currency, 'USD');
