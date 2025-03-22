-- Enable safe transaction handling
BEGIN;

-- STEP 1: Close old records if changes detected
UPDATE trusted.dim_company dc
SET valid_to = NOW(), is_current = FALSE
WHERE is_current = TRUE
AND EXISTS (
  SELECT 1 FROM staging.jobs sj
  WHERE sj.company_name = dc.company_name
  AND (dc.source_system IS DISTINCT FROM sj.source_system) 
);

-- STEP 2: Insert new records if changed or new
INSERT INTO trusted.dim_company (
  company_name, source_system, ingested_ts, valid_from, is_current
)
SELECT DISTINCT 
  sj.company_name, 
  sj.source_system, 
  NOW(), 
  NOW(), 
  TRUE
FROM staging.jobs sj
WHERE NOT EXISTS (
  SELECT 1 FROM trusted.dim_company dc
  WHERE dc.company_name = sj.company_name AND dc.is_current = TRUE
);

-- Commit the changes
COMMIT;