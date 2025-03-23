CREATE OR REPLACE PROCEDURE raw.rollback_candidate(p_candidate_id BIGINT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_last_valid_from TIMESTAMP;
    v_previous_valid_from TIMESTAMP;
    v_count INT;
BEGIN
    -- Step 1: Check if there is history data for the candidate
    SELECT COUNT(*) INTO v_count 
    FROM raw.candidate_history
    WHERE candidate_id = p_candidate_id;

    IF v_count = 0 THEN
        RAISE EXCEPTION 'No previous version found for candidate_id %', p_candidate_id;
    END IF;

    -- Step 2: Get the last and previous valid_from timestamps
    SELECT valid_from INTO v_last_valid_from
    FROM raw.candidate_history
    WHERE candidate_id = p_candidate_id
    ORDER BY valid_from DESC
    LIMIT 1;

    SELECT valid_from INTO v_previous_valid_from
    FROM raw.candidate_history
    WHERE candidate_id = p_candidate_id
    ORDER BY valid_from DESC
    LIMIT 1 OFFSET 1;

    -- Debugging: Display timestamps
    RAISE NOTICE 'Last valid_from: %, Previous valid_from: %', v_last_valid_from, v_previous_valid_from;

    -- Step 3: Move the current candidate version to history
    INSERT INTO raw.candidate_history (candidate_id, first_name, last_name, age, gender, experience, prefered_post, technologies, job_type, location, is_available, available_from, min_salary, created_at, source, ingested_ts, valid_from, valid_to)
    SELECT candidate_id, first_name, last_name, age, gender, experience, prefered_post, technologies, job_type, location, is_available, available_from, min_salary, created_at, source, ingested_ts, valid_from, NOW()
    FROM raw.candidate
    WHERE candidate_id = p_candidate_id;

    -- Step 4: Remove the current version from candidate
    DELETE FROM raw.candidate WHERE candidate_id = p_candidate_id;

    -- Step 5: Restore the previous version from history
    INSERT INTO raw.candidate (candidate_id, first_name, last_name, age, gender, experience, prefered_post, technologies, job_type, location, is_available, available_from, min_salary, created_at, source, ingested_ts, valid_from, valid_to)
    SELECT candidate_id, first_name, last_name, age, gender, experience, prefered_post, technologies, job_type, location, is_available, available_from, min_salary, created_at, source, ingested_ts, valid_from, NULL
    FROM raw.candidate_history
    WHERE candidate_id = p_candidate_id AND valid_from = v_previous_valid_from
    LIMIT 1;

    RAISE NOTICE 'Rollback successful for candidate_id %', p_candidate_id;
END $$;