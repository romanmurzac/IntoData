INSERT INTO trusted.fact_incidents (incident_id, guard_id, client_id, location_id, time_id, severity_level, description)
SELECT * FROM staging.incident;