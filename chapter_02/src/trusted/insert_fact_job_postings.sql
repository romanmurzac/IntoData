INSERT INTO trusted.fact_job_postings (
  staging_job_id, date_id, company_id, location_id, job_type_id, 
  salary_id, remote_type_id, technology_id, job_title, 
  job_description, job_url
)
SELECT DISTINCT
  sj.staging_id, dd.date_id, dc.company_id, dl.location_id, djt.job_type_id, 
  ds.salary_id, drt.remote_type_id, dt.technology_id, 
  sj.job_title, sj.job_description, sj.job_url

FROM staging.jobs sj
LEFT JOIN trusted.dim_date dd ON dd.date = CAST(sj.published_at AS DATE)
LEFT JOIN trusted.dim_company dc ON dc.company_name = sj.company_name
LEFT JOIN trusted.dim_location dl ON dl.location = sj.location
LEFT JOIN LATERAL (
  SELECT djt.job_type_id 
  FROM trusted.dim_job_type djt 
  WHERE djt.job_type = ANY(sj.job_type)
) djt ON TRUE
LEFT JOIN trusted.dim_salary ds ON ds.min_salary = sj.salary_min 
  AND ds.max_salary = sj.salary_max 
  AND ds.currency = COALESCE(sj.salary_currency, 'USD')
LEFT JOIN trusted.dim_remote_type drt ON drt.remote_type = sj.remote_type
LEFT JOIN LATERAL (
  SELECT dt.technology_id 
  FROM trusted.dim_technology dt 
  WHERE dt.technology_name = ANY(sj.tech_stack)
) dt ON TRUE;