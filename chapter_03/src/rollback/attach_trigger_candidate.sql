CREATE TRIGGER candidate_update
BEFORE UPDATE ON raw.candidate
FOR EACH ROW
EXECUTE FUNCTION raw.track_candidate_changes();