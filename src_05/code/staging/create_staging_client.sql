CREATE TABLE staging.client (
  client_id SERIAL PRIMARY KEY,
  client_name VARCHAR(50) NOT NULL,
  contract_start_date DATE NOT NULL,
  contract_end_date DATE NOT NULL
);
