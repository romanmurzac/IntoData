INSERT INTO trusted.fact_technology_demand (
  date_id, job_id, technology_id
)
SELECT 
  d.date_id, 
  f.job_post_id, 
  t.technology_id
FROM staging.jobs s
LEFT JOIN trusted.dim_date d ON d.date = CAST(s.published_at AS DATE)
LEFT JOIN trusted.fact_job_postings f ON f.job_post_id = s.staging_id
LEFT JOIN LATERAL UNNEST(s.tech_stack) AS tech_name ON TRUE
LEFT JOIN trusted.dim_technology t ON t.technology_name = tech_name
WHERE t.technology_id IS NOT NULL;
