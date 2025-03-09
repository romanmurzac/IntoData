INSERT INTO trusted.dim_clients (client_id, client_name, contract_start_date, contract_end_date)
SELECT * FROM staging.client;