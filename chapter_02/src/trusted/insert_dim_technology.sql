INSERT INTO trusted.dim_technology (technology_name)
SELECT DISTINCT 
  LOWER(UNNEST(tech_stack)) AS technology_name
FROM staging.jobs
WHERE tech_stack IS NOT NULL
ON CONFLICT (technology_name) DO NOTHING;