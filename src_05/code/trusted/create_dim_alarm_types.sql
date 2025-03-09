CREATE TABLE trusted.dim_alarm_types (
  alarm_type_id SERIAL PRIMARY KEY,
  alarm_type VARCHAR(50) NOT NULL,
  risk_level VARCHAR(20)
);