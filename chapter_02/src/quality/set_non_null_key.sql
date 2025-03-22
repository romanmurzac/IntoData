ALTER TABLE trusted.fact_job_postings
ALTER COLUMN job_id SET NOT NULL,
ALTER COLUMN company_id SET NOT NULL,
ALTER COLUMN location_id SET NOT NULL;