INSERT INTO staging.client (client_id, client_name, contract_start_date, contract_end_date)
SELECT DISTINCT client_id, client_name, contract_start_date, contract_end_date
FROM raw.client_contract
WHERE client_id NOT IN (SELECT client_id FROM staging.client);