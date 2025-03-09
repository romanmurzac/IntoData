INSERT INTO staging.time (time_id, date, month, year, day_of_week, hour_of_day)
SELECT DISTINCT
  timestamp, DATE(timestamp),
  EXTRACT(MONTH FROM timestamp),
  EXTRACT(YEAR FROM timestamp),
  EXTRACT(DOW FROM timestamp),
  EXTRACT(HOUR FROM timestamp)
FROM raw.incident_report
WHERE timestamp NOT IN (SELECT date FROM staging.time);