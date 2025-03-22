UPDATE staging.jobs
SET salary_currency = 'USD'
WHERE salary_currency IS NULL;