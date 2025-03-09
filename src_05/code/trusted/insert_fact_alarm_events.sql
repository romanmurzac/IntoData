INSERT INTO trusted.fact_alarm_events (alarm_event_id, client_id, location_id, time_id, alarm_type_id, triggered_by)
SELECT * FROM stgaging.alarm_event;