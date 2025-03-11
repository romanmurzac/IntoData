INSERT INTO staging.alarm_event (client_id, location_id, time_id, alarm_type_id, triggered_by)
SELECT DISTINCT
  client_id, city, start_time, event_type, raw_data->>'sensor'
FROM raw.iot_device
WHERE device_id NOT IN (SELECT alarm_event_id FROM staging.alarm_event);