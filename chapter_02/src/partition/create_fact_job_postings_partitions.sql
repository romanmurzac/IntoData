CREATE TABLE trusted.fact_job_postings_2024 PARTITION OF trusted.fact_job_postings_partitioned
  FOR VALUES FROM (20240101) TO (20250101);

CREATE TABLE trusted.fact_job_postings_2025 PARTITION OF trusted.fact_job_postings_partitioned
  FOR VALUES FROM (20250101) TO (20260101);