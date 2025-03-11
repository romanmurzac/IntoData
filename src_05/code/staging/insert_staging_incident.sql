INSERT INTO staging.incident (incident_id, guard_id, client_id, location_id, time_id, severity_level, description)
SELECT DISTINCT
  report_id, guard_id, client_id, city, start_time, severity, description
FROM raw.incident_report
UNION ALL
SELECT DISTINCT
  crime_id + 10000000, 0, 0, city, start_time, severity_level, crime_type
FROM raw.external_crime;