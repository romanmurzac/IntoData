ALTER TABLE trusted.dim_company 
ADD COLUMN valid_from TIMESTAMP DEFAULT NOW(),
ADD COLUMN valid_to TIMESTAMP,
ADD COLUMN is_current BOOLEAN DEFAULT TRUE;