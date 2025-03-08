CREATE TABLE dim_time (
  time_id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  month INT NOT NULL,
  year INT NOT NULL,
  day_of_week VARCHAR(10) NOT NULL,
  hour_of_day INT NOT NULL CHECK (hour_of_day BETWEEN 0 AND 23)
);