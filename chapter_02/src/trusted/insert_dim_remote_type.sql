INSERT INTO trusted.dim_remote_type (remote_type)
SELECT DISTINCT 
  COALESCE(remote_type, workplace)
FROM staging.jobs
WHERE remote_type IS NOT NULL
ON CONFLICT (remote_type) DO NOTHING;