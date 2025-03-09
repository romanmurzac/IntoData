INSERT INTO trusted.dim_locations (location_id, address, city, zone)
SELECT * FROM staging.location;