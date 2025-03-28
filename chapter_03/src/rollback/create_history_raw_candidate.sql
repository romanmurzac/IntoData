CREATE TABLE raw.candidate_history (
    history_id SERIAL PRIMARY KEY,
    candidate_id BIGINT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(50),
    experience INT,
    prefered_post VARCHAR(50),
    technologies TEXT[],
    job_type VARCHAR(50),
    location VARCHAR(50),
    is_available BOOLEAN,
    available_from TIMESTAMP,
    min_salary INT,
    created_at TIMESTAMP,
    source VARCHAR(25),
    ingested_ts TIMESTAMP,
    valid_from TIMESTAMP,
    valid_to TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);