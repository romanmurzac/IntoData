CREATE UNIQUE INDEX idx_unique_job_id ON trusted.fact_job_postings_partitioned (date_id, job_id);

CREATE INDEX idx_fact_job_postings_company ON trusted.fact_job_postings_partitioned (date_id, company_id);

CREATE INDEX idx_fact_job_postings_location ON trusted.fact_job_postings_partitioned (date_id, location_id);

CREATE INDEX idx_fact_job_postings_technology ON trusted.fact_job_postings_partitioned (date_id, technology_id);

