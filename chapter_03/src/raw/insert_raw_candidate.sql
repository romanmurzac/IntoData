INSERT INTO raw.candidate (
  candidate_id,
  first_name,
  last_name
  age,
  gender,
  experience,
  prefered_post,
  technologies,
  job_type,
  location,
  is_available,
  available_from,
  min_salary,
  created_at,
  source,
  ingested_ts
) VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
  %s, %s, %s, %s, %s, CURRENT_TIMESTAMP
);