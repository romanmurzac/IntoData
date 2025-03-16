INSERT INTO trusted.dim_job_type (job_type)
SELECT DISTINCT 
  LOWER(UNNEST(job_type)) AS job_type
FROM staging.jobs
WHERE job_type IS NOT NULL
ON CONFLICT (job_type) DO NOTHING;