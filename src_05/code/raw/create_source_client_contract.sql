CREATE TABLE raw.client_contract (
  contract_id SERIAL PRIMARY KEY,
  client_id INT NOT NULL,
  client_name VARCHAR(100) NOT NULL,
  contract_start_date DATE,
  contract_end_date DATE,
  contract_terms TEXT
);