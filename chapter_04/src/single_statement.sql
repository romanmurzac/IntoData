WITH upsert AS (
    UPDATE raw.candidate
    SET age = 35
    WHERE candidate_id = 6
    RETURNING *
),
deleted AS (
    DELETE FROM raw.candidate
    WHERE candidate_id = 7
    RETURNING *
)
INSERT INTO raw.candidate (candidate_id, first_name, last_name, age)
VALUES (8, 'Bob', 'Smith', 40)
ON CONFLICT (candidate_id) 
DO UPDATE SET age = EXCLUDED.age
RETURNING *;