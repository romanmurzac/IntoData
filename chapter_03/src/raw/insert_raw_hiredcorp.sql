INSERT INTO raw.hiredcorp (
  job_id,
  source,
  company_name,
  job_title,
  job_url,
  address,
  job_type,
  min_salary,
  skills,
  posted_at,
  ingested_ts
) VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP
);