SELECT 
    job_type,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) AS median_age
FROM raw.candidate
GROUP BY job_type;