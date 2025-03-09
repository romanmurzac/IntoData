INSERT INTO raw.iot_device (device_id, timestamp, location_id, event_type, raw_data) VALUES
(1, '2025-03-09 08:15:00', 101, 'Motion Detected', '{"sensor": "PIR", "intensity": 85}'),
(2, '2025-03-09 09:30:00', 102, 'Door Open', '{"sensor": "DoorMagnet", "status": "open"}'),
(3, '2025-03-09 10:45:00', 103, 'Glass Break', '{"sensor": "Acoustic", "frequency": 12000}');