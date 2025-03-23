SELECT 
    candidate_id, 
    first_name, 
    age,
    LAG(age) OVER (PARTITION BY job_type ORDER BY age) AS previous_age,
    LEAD(age) OVER (PARTITION BY job_type ORDER BY age) AS next_age,
    CUME_DIST() OVER (PARTITION BY job_type ORDER BY age) AS cume_distribution,
    FIRST_VALUE(age) OVER (PARTITION BY job_type ORDER BY age) AS first_age,
    LAST_VALUE(age) OVER (PARTITION BY job_type ORDER BY age ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_age
FROM raw.candidate;