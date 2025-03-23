CREATE OR REPLACE FUNCTION raw.track_candidate_changes()
RETURNS TRIGGER AS $$
BEGIN
    -- Insert old record into history table before update
    INSERT INTO raw.candidate_history (
        candidate_id, first_name, last_name, age, gender, experience, prefered_post,
        technologies, job_type, location, is_available, available_from, min_salary,
        created_at, source, ingested_ts, valid_from, valid_to, modified_at
    )
    VALUES (
        OLD.candidate_id, OLD.first_name, OLD.last_name, OLD.age, OLD.gender,
        OLD.experience, OLD.prefered_post, OLD.technologies, OLD.job_type, OLD.location,
        OLD.is_available, OLD.available_from, OLD.min_salary,  OLD.created_at, OLD.source,
        OLD.ingested_ts, OLD.valid_from, NOW(), NOW()
    );

    -- Update current record with new values
    NEW.valid_from = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;