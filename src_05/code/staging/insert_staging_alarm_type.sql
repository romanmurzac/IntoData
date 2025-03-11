INSERT INTO staging.alarm_type (alarm_type, risk_level)
SELECT DISTINCT
  type, severity
FROM raw.incident_report
UNION ALL
SELECT DISTINCT
  event_type, raw_data->>'risk'
FROM raw.iot_device
UNION ALL
SELECT DISTINCT
  crime_type, severity_level
FROM raw.external_crime;