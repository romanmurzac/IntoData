INSERT INTO staging.incident (incident_id, guard_id, client_id, location_id, time_id, severity_level, description)
SELECT DISTINCT report_id, guard_id, client_id, location_id, timestamp, severity, description
FROM raw.incident_report
WHERE report_id NOT IN (SELECT incident_id FROM staging.incident);