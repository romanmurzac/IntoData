INSERT INTO trusted.dim_company (company_name, source_system, ingested_ts)
SELECT DISTINCT 
  company_name, 
  source_system, 
  ingested_ts
FROM staging.jobs
WHERE company_name IS NOT NULL
ON CONFLICT (company_name) DO NOTHING;