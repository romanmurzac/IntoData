WITH RECURSIVE date_series AS (
  SELECT DATE '2020-01-01' AS date
  UNION ALL
  SELECT (date + INTERVAL '1 day')::DATE
  FROM date_series
  WHERE date < DATE '2030-12-31'
)
INSERT INTO trusted.dim_date (date_id, date, day, month, year)
SELECT 
  EXTRACT(YEAR FROM date) * 10000 + EXTRACT(MONTH FROM date) * 100 + EXTRACT(DAY FROM date) AS date_id,
  date,
  EXTRACT(DAY FROM date) AS day,
  EXTRACT(MONTH FROM date) AS month,
  EXTRACT(YEAR FROM date) AS year
FROM date_series;