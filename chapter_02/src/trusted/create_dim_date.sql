CREATE TABLE IF NOT EXISTS trusted.dim_date (
  date_id INT PRIMARY KEY,
  date DATE NOT NULL,
  day INT NOT NULL,
  month INT NOT NULL,
  year INT NOT NULL
);