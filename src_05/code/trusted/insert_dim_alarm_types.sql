INSERT INTO trusted.dim_alarm_types (alarm_type_id, alarm_type, risk_level)
SELECT * FROM staging.alarm_type;