INSERT INTO trusted.fact_patrols (patrol_id, guard_id, location_id, time_id, status)
SELECT * FROM staging.patrol;