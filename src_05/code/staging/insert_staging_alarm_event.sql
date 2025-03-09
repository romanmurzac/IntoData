INSERT INTO staging.alarm_event (alarm_event_id, client_id, location_id, time_id, alarm_type_id, triggered_by)
SELECT device_id, NULL, location_id, timestamp, NULL, event_type
FROM raw.iot_device
WHERE device_id NOT IN (SELECT alarm_event_id FROM staging.alarm_event);