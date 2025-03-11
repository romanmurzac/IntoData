INSERT INTO staging.location (address, city, zone)
SELECT DISTINCT address, city, zone
FROM raw.employee_schedule
UNION ALL
SELECT DISTINCT address, city, zone
FROM raw.incident_report
UNION ALL
SELECT DISTINCT address, city, zone
FROM raw.external_crime
UNION ALL
SELECT DISTINCT address, city, zone
FROM raw.iot_device;