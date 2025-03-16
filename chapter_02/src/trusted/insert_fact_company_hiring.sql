INSERT INTO trusted.fact_company_hiring (
  date_id, company_id, location_id, total_jobs
)
SELECT 
  d.date_id, 
  c.company_id, 
  l.location_id, 
  COUNT(s.job_id) AS total_jobs
FROM staging.jobs s
LEFT JOIN trusted.dim_date d ON d.date = CAST(s.published_at AS DATE)
LEFT JOIN trusted.dim_company c ON c.company_name = s.company_name
LEFT JOIN trusted.dim_location l ON l.location = s.location
GROUP BY d.date_id, c.company_id, l.location_id;