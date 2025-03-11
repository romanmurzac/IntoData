INSERT INTO staging.time (date, month, year, day_of_week, hour_of_day)
SELECT DISTINCT
  DATE(start_time),
  EXTRACT(MONTH FROM start_time),
  EXTRACT(YEAR FROM start_time),
  EXTRACT(DOW FROM start_time),
  EXTRACT(HOUR FROM start_time)
FROM raw.incident_report
UNION ALL
SELECT DISTINCT
  DATE(start_time),
  EXTRACT(MONTH FROM start_time),
  EXTRACT(YEAR FROM start_time),
  EXTRACT(DOW FROM start_time),
  EXTRACT(HOUR FROM start_time)
FROM raw.external_crime
UNION ALL
SELECT DISTINCT
  DATE(start_time),
  EXTRACT(MONTH FROM start_time),
  EXTRACT(YEAR FROM start_time),
  EXTRACT(DOW FROM start_time),
  EXTRACT(HOUR FROM start_time)
FROM raw.iot_device
UNION ALL
SELECT DISTINCT
  DATE(start_time),
  EXTRACT(MONTH FROM start_time),
  EXTRACT(YEAR FROM start_time),
  EXTRACT(DOW FROM start_time),
  EXTRACT(HOUR FROM start_time)
FROM raw.employee_schedule;