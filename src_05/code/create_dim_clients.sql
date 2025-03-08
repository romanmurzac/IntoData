CREATE TABLE dim_clients (
  client_id SERIAL PRIMARY KEY,
  client_name VARCHAR(100) NOT NULL,
  contract_start_date DATE,
  contract_end_date DATE
);