INSERT INTO staging.alarm_type (alarm_type_id, alarm_type, risk_level)
SELECT DISTINCT device_id, event_type, 'Unknown'
FROM raw.iot_device
WHERE device_id NOT IN (SELECT alarm_type_id FROM staging.alarm_type);