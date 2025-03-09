INSERT INTO staging.location (location_id, address, city, zone)
SELECT DISTINCT location_id, 'Unknown', 'Unknown', 'Unknown'
FROM raw.external_crime_data
WHERE location_id NOT IN (SELECT location_id FROM staging.location);