-- Add a full-text index column
ALTER TABLE raw.candidate 
ADD COLUMN search_vector tsvector 
    GENERATED ALWAYS AS (to_tsvector('english', first_name || ' ' || last_name)) STORED;

-- Create an index on the full-text column
CREATE INDEX idx_fulltext_candidate ON raw.candidate USING GIN(search_vector);

-- Search for a keyword
SELECT * 
FROM raw.candidate 
WHERE search_vector @@ to_tsquery('Bob');